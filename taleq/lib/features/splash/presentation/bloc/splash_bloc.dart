import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:taleq/core/service/local_storage.dart' as storage;
import 'package:taleq/core/service/supabase_connect.dart';
import 'package:taleq/features/splash/presentation/bloc/splash_event.dart';
import 'package:taleq/features/splash/presentation/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final getItData = GetIt.I.get<storage.LocalStorage>();

  SplashBloc() : super(SplashInitial()) {
    on<InitAppEvent>(deeplink);
    on<AuthSuccessWithGoogleEvent>(moveToHome);
    on<CheckFirstTimeUserEvent>(checkApp);
  }
  FutureOr deeplink(InitAppEvent event, Emitter<SplashState> emit) async {
    await Future.delayed(Duration(seconds: 2));
    final session = SupabaseConnect.supabase?.client.auth.currentSession;

    if (session?.user != null) {
      emit(AuthSuccess(user: session!.user));
    } else {
      emit(NotFirstTimeUseApp());
    }
  }

  FutureOr<void> checkApp(
    CheckFirstTimeUserEvent event,
    Emitter<SplashState> emit,
  ) async {
    await Future.delayed(Duration(seconds: 2));
    final bool isDownloaded =
        await getItData.getData(key: "isOnboardingVisited") ?? false;

    if (isDownloaded) {
      emit(NotFirstTimeUseApp());
    } else {
      emit(FirstTimeUseApp());
    }
  }

  FutureOr<void> moveToHome(
    AuthSuccessWithGoogleEvent event,
    Emitter<SplashState> emit,
  ) async {
    await Future.delayed(Duration(seconds: 2));
    emit(AuthSuccess(user: event.user));
  }
}
