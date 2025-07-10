import 'dart:async';
import 'dart:developer';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';

class AgoraService {
  late final RtcEngine _engine;
  bool _localUserJoined = false;
  int? _remoteUid;

  Future<void> initWithUserAccount({
    required String appId,
    required String token,
    required String channelName,
    required String userAccount,
  }) async {
    log('🔧 بدء تهيئة Agora للصوت');

    final micStatus = await Permission.microphone.request();
    log('🎙 حالة إذن المايك: $micStatus');

    _engine = createAgoraRtcEngine();
    await _engine.initialize(
      RtcEngineContext(
        appId: appId,
        channelProfile: ChannelProfileType.channelProfileCommunication,
      ),
    );

    _engine.registerEventHandler(_buildEventHandler());

    await _engine.setAudioProfile(
      profile: AudioProfileType.audioProfileMusicHighQuality,
      scenario: AudioScenarioType.audioScenarioGameStreaming,
    );

    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await _engine.enableAudio();

    _convertUserAccountToInt(userAccount);

    await _engine.joinChannelWithUserAccount(
      token: token,
      channelId: channelName,
      userAccount: userAccount,
      options: const ChannelMediaOptions(
        autoSubscribeAudio: true,
        publishMicrophoneTrack: true,
        clientRoleType: ClientRoleType.clientRoleBroadcaster,
      ),
    );
  }

  Future<void> initVideoSession({
    required String appId,
    required String token,
    required String channelName,
    required int userAccount,
    required bool isHost,
  }) async {
    log('🔧 بدء تهيئة Agora للفيديو');

    final micStatus = await Permission.microphone.request();
    final cameraStatus = await Permission.camera.request();
    log('🎙 إذن المايك: $micStatus');
    log('📷 إذن الكاميرا: $cameraStatus');

    _engine = createAgoraRtcEngine();
    await _engine.initialize(
      RtcEngineContext(
        appId: appId,
        channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
      ),
    );

    await _engine.enableAudio();
    await _engine.enableVideo();

    await _engine.setClientRole(
      role: isHost
          ? ClientRoleType.clientRoleBroadcaster
          : ClientRoleType.clientRoleAudience,
    );

    _engine.registerEventHandler(_buildEventHandler());

    final int uid = userAccount;

    await _engine.joinChannel(
      token: token,
      channelId: channelName,
      uid: uid,
      options: ChannelMediaOptions(
        autoSubscribeAudio: true,
        autoSubscribeVideo: true,
        publishMicrophoneTrack: isHost,
        publishCameraTrack: isHost,
        clientRoleType: isHost
            ? ClientRoleType.clientRoleBroadcaster
            : ClientRoleType.clientRoleAudience,
      ),
    );
  }

  Future<void> leaveChannel() async {
    log('⬅️ مغادرة القناة');
    await _engine.leaveChannel();
    await _engine.release();
  }

  Future<void> muteLocalMic() async {
    log('🔇 كتم المايك');
    await _engine.muteLocalAudioStream(true);
  }

  Future<void> unmuteLocalMic() async {
    log('🔊 إلغاء كتم المايك');
    await _engine.muteLocalAudioStream(false);
  }

  Future<void> muteLocalVideo() async {
    log('📷 إيقاف الفيديو المحلي');
    await _engine.muteLocalVideoStream(true);
  }

  Future<void> unmuteLocalVideo() async {
    log('📷 تشغيل الفيديو المحلي');
    await _engine.muteLocalVideoStream(false);
  }

  localView() {
    return AgoraVideoView(
      controller: VideoViewController(
        rtcEngine: _engine,
        canvas: const VideoCanvas(uid: 0),
      ),
    );
  }

  remoteView(String remoteUid, channelName) {
    return AgoraVideoView(
      controller: VideoViewController.remote(
        rtcEngine: _engine,
        canvas: VideoCanvas(uid: _convertUserAccountToInt(remoteUid)),
        connection: RtcConnection(channelId: channelName),
      ),
    );
  }

  RtcEngineEventHandler _buildEventHandler() {
    return RtcEngineEventHandler(
      onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
        log("✅ انضم المستخدم المحلي: ${connection.localUid}");
        _localUserJoined = true;
      },
      onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
        log("👤 انضم مستخدم: $remoteUid");
        _remoteUid = remoteUid;
      },
      onUserOffline:
          (
            RtcConnection connection,
            int remoteUid,
            UserOfflineReasonType reason,
          ) {
            log("👤 غادر المستخدم: $remoteUid - السبب: $reason");
            _remoteUid = null;
          },
      onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
        log('[⚠️ التوكن سينتهي قريباً] token: $token');
      },
    );
  }

  bool get isLocalUserJoined => _localUserJoined;
  int? get remoteUid => _remoteUid;

  int _convertUserAccountToInt(String uuid) {
    final hash = uuid.hashCode & 0x7FFFFFFF;
    return hash;
  }
}
