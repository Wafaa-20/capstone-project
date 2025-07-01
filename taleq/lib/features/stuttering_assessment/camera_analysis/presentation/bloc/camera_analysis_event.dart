import 'package:equatable/equatable.dart';

sealed class CameraAnalysisEvent extends Equatable {
  const CameraAnalysisEvent();

  @override
  List<Object> get props => [];
}

class StartCameraAnalysis extends CameraAnalysisEvent {}
