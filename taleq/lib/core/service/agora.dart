import 'dart:async';
import 'dart:developer';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/foundation.dart';
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
    log('🔧 بدء تهيئة Agora');

    final micStatus = await Permission.microphone.request();
    log('🎙 حالة إذن المايك: $micStatus');

    _engine = createAgoraRtcEngine();
    log('✅ تم إنشاء RtcEngine');

    await _engine.initialize(
      RtcEngineContext(
        appId: appId,
        channelProfile: ChannelProfileType.channelProfileCommunication,
      ),
    );
    log('✅ تم تهيئة RtcEngine');

    _engine.registerEventHandler(
      RtcEngineEventHandler(
        
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
      
      ),
    );
    log('✅ تم تسجيل الـ EventHandler');

    await _engine.setAudioProfile(
      profile: AudioProfileType.audioProfileMusicHighQuality,
      scenario: AudioScenarioType.audioScenarioGameStreaming,
    );
    log('🎵 تم ضبط ملف تعريف الصوت');

    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    log('🎤 تم تعيين الدور كمذيع (Broadcaster)');

    await _engine.enableAudio();
    log('🔊 تم تفعيل الصوت');

    final int uid = _convertUserAccountToInt(userAccount);
    log('🔑 UID المحسوب من userAccount: $uid');

    log('🚀 الانضمام إلى القناة: $channelName');
    await _engine.joinChannelWithUserAccount(
      token: token,
      channelId: channelName,
      userAccount: userAccount,
      options: const ChannelMediaOptions(
        autoSubscribeAudio:
            true, // Automatically subscribe to all audio streams
        publishMicrophoneTrack: true, // Publish microphone-captured audio
        // Use clientRoleBroadcaster to act as a host or clientRoleAudience for audience
        clientRoleType: ClientRoleType.clientRoleBroadcaster,
      ),
    );
    log('✅ طلب الانضمام إلى القناة مكتمل');
  }

  Future<void> leave() async {
    log('⬅️ مغادرة القناة');
    await _engine.leaveChannel();
    await _engine.release();
    log('✅ تم تحرير الموارد');
  }

  Future<void> muteLocalMic() async {
    log('🔇 كتم المايك');
    await _engine.muteLocalAudioStream(true);
  }

  Future<void> unmuteLocalMic() async {
    log('🔊 إلغاء كتم المايك');
    await _engine.muteLocalAudioStream(false);
  }

  bool get isLocalUserJoined => _localUserJoined;
  int? get remoteUid => _remoteUid;

  int _convertUserAccountToInt(String uuid) {
    final hash = uuid.hashCode & 0x7FFFFFFF;
    log('🔢 تحويل userAccount إلى int: $uuid => $hash');
    return hash;
  }
}
