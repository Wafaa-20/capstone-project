import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taleq/core/service/agora.dart';

sealed class LivesEvent {}

class InitLivesAgoraEvent extends LivesEvent {
  final String channelName;
  final String token;
  final int userID;
  final String hostID;
  final bool isBrodcaster;

  InitLivesAgoraEvent({
    required this.channelName,
    required this.token,
    required this.userID,
    required this.hostID,
    required this.isBrodcaster,
  });
}

class LeaveLivesEvent extends LivesEvent {}
