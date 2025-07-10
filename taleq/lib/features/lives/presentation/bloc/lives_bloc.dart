import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/features/lives/presentation/bloc/lives_event.dart';
import 'package:taleq/features/lives/presentation/bloc/lives_state.dart';
import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taleq/core/service/agora.dart';

class LivesBloc extends Bloc<LivesEvent, LivesState> {
  final AgoraService agoraService;

  LivesBloc(this.agoraService) : super(LivesInitial()) {
    on<InitLivesAgoraEvent>(_initAgora);
    on<LeaveLivesEvent>(_leaveLives);
  }

  Future<void> _initAgora(
    InitLivesAgoraEvent event,
    Emitter<LivesState> emit,
  ) async {
    emit(LivesLoading());

    try {
      await agoraService.initVideoSession(
        appId: '59fd63f1b8fa4761b7900a1d9bc8992b',
        token: event.token,
        channelName: event.channelName,
        userAccount: event.userID,
        isHost: event.isBrodcaster,
      );

      emit(
        LivesRunning(
          isHost: event.isBrodcaster,
          hostUID: event.hostID,
          agoraService: agoraService,
        ),
      );
    } catch (e) {
      log('Agora init error: $e');
      emit(LivesError(message: 'فشل تشغيل البث'));
    }
  }

  Future<void> _leaveLives(
    LeaveLivesEvent event,
    Emitter<LivesState> emit,
  ) async {
    try {
      await agoraService.leaveChannel();
      emit(LivesInitial());
    } catch (e) {
      log('Error leaving Lives: $e');
      emit(LivesError(message: 'فشل الخروج من البث'));
    }
  }

  @override
  Future<void> close() async {
    await agoraService.leaveChannel();
    return super.close();
  }
}
