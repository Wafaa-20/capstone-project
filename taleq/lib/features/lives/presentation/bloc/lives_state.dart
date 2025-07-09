import 'package:equatable/equatable.dart';
import 'package:taleq/core/service/agora.dart';
sealed class LivesState {}

class LivesInitial extends LivesState {}

class LivesLoading extends LivesState {}

class LivesRunning extends LivesState {
  final bool isHost;
  final String hostUID;
  final AgoraService agoraService;

  LivesRunning({
    required this.isHost,
    required this.hostUID,
    required this.agoraService,
  });
}

class LivesError extends LivesState {
  final String message;

  LivesError({required this.message});
}
