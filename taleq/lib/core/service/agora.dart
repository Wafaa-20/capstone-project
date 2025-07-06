import 'dart:async';
import 'dart:math';
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
    bool isBroadcaster = true,
  }) async {
    await Permission.microphone.request();

    _engine = createAgoraRtcEngine();
    await _engine.initialize(
      RtcEngineContext(
        appId: appId,
        channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
      ),
    );

    await _engine.setAudioProfile(
      profile: AudioProfileType.audioProfileMusicHighQuality,
      scenario: AudioScenarioType.audioScenarioGameStreaming,
    );

    await _engine.setClientRole(
      role: isBroadcaster
          ? ClientRoleType.clientRoleBroadcaster
          : ClientRoleType.clientRoleAudience,
    );

    await _engine.enableAudio();

    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint("انضم المستخدم: ${connection.localUid}");
          _localUserJoined = true;
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint("انضم مستخدم: $remoteUid");
          _remoteUid = remoteUid;
        },
        onUserOffline:
            (
              RtcConnection connection,
              int remoteUid,
              UserOfflineReasonType reason,
            ) {
              debugPrint("غادر المستخدم: $remoteUid");
              _remoteUid = null;
            },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          debugPrint('التوكن سينتهي قريباً');
        },
      ),
    );

    await _engine.joinChannelWithUserAccount(
      token: token,
      channelId: channelName,
      userAccount: userAccount,
      options: const ChannelMediaOptions(),
    );
  }

  Future<void> leave() async {
    await _engine.leaveChannel();
    await _engine.release();
  }

  bool get isLocalUserJoined => _localUserJoined;
  int? get remoteUid => _remoteUid;
}
