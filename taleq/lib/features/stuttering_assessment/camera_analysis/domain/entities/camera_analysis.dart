import 'package:equatable/equatable.dart';

class CameraAnalysisEntity extends Equatable {
  final String name;
  final int sensorOrientation;

  const CameraAnalysisEntity({
    required this.name,
    required this.sensorOrientation,
  });

  @override
  List<Object> get props => [name, sensorOrientation];
}
