import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:taleq/core/service/local_storage.dart';
import 'package:taleq/features/splash/presentation/bloc/splash_event.dart';
import 'package:taleq/features/splash/presentation/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final getItData = GetIt.I.get<LocalStorage>();

  SplashBloc() : super(SplashInitial()) {
    on<AuthSuccessWithGoogleEvent>(moveToHome);
    on<CheckFirstTimeUserEvent>(checkApp);
  }

  FutureOr<void> checkApp(
    CheckFirstTimeUserEvent event,
    Emitter<SplashState> emit,
  ) async {
    await Future.delayed(Duration(seconds: 3));
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
    emit(AuthSuccess());
  }
}
