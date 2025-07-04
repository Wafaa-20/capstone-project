import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/domain/usecases/get_camera_analysis.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/presentation/bloc/camera_analysis_event.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/presentation/bloc/camera_analysis_state.dart';

class CameraAnalysisBloc
    extends Bloc<CameraAnalysisEvent, CameraAnalysisState> {
  final CameraAnalysisUseCase getCameraAnalysis;

  CameraAnalysisBloc(this.getCameraAnalysis) : super(CameraAnalysisInitial()) {
    on<CameraAnalysisEvent>((event, emit) {});
    on<StartCameraAnalysis>(startCamera);
  }

  FutureOr<void> startCamera(
    StartCameraAnalysis event,
    Emitter<CameraAnalysisState> emit,
  ) async {
    emit(CameraAnalysisLoading());
    final result = await getCameraAnalysis.call( CameraAnalysisParam());

    result.fold(
      (failure) => emit(CameraAnalysisFailure(message: failure.message)),

      (success) => emit(CameraAnalysisSuccess()),
    );
  }
}
