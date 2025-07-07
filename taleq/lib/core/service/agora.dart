import 'dart:async';
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
    // اطلب صلاحية المايك
    await Permission.microphone.request();

    // إنشاء المحرك
    _engine = createAgoraRtcEngine();
    await _engine.initialize(
       RtcEngineContext(
        appId: appId,
        channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
      ),
    );

    // تسجيل الأحداث
    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint("✅ انضم المستخدم المحلي: ${connection.localUid}");
          _localUserJoined = true;
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint("👤 انضم مستخدم: $remoteUid");
          _remoteUid = remoteUid;
        },
        onUserOffline:
            (
              RtcConnection connection,
              int remoteUid,
              UserOfflineReasonType reason,
            ) {
              debugPrint("👤 غادر المستخدم: $remoteUid");
              _remoteUid = null;
            },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          debugPrint('[⚠️ التوكن سينتهي قريباً] token: $token');
        },
      ),
    );

    
    await _engine.setAudioProfile(
      profile: AudioProfileType.audioProfileMusicHighQuality,
      scenario: AudioScenarioType.audioScenarioGameStreaming,
    );

    
    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);

    
    await _engine.enableAudio();

    
    final int uid = _convertUserAccountToInt(userAccount);

    
    await _engine.joinChannel(
      token: token,
      channelId: channelName,
      uid: uid,
      options: const ChannelMediaOptions(
        publishMicrophoneTrack: true,
        autoSubscribeAudio: true,
      ),
    );
  }

  
  Future<void> leave() async {
    await _engine.leaveChannel();
    await _engine.release();
  }

  
  Future<void> muteLocalMic() async {
    await _engine.muteLocalAudioStream(true);
  }

 
  Future<void> unmuteLocalMic() async {
    await _engine.muteLocalAudioStream(false);
  }

  bool get isLocalUserJoined => _localUserJoined;
  int? get remoteUid => _remoteUid;


  int _convertUserAccountToInt(String uuid) {
   
    return uuid.hashCode & 0x7FFFFFFF; 
  }
}
