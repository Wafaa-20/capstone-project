import 'package:equatable/equatable.dart';

sealed class CameraAnalysisState extends Equatable {
  const CameraAnalysisState();

  @override
  List<Object> get props => [];
}

final class CameraAnalysisInitial extends CameraAnalysisState {}

final class CameraAnalysisLoading extends CameraAnalysisState {}

final class CameraAnalysisFailure extends CameraAnalysisState {
  final String message;

  const CameraAnalysisFailure({required this.message});
  @override
  List<Object> get props => [message];
}

final class CameraAnalysisSuccess extends CameraAnalysisState {}
