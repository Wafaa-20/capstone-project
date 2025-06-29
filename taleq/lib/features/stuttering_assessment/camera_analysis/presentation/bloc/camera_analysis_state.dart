import 'package:equatable/equatable.dart';

sealed class Camera_analysisState extends Equatable {
  const Camera_analysisState();

  @override
  List<Object> get props => [];
}

final class Camera_analysisInitial extends Camera_analysisState {}
