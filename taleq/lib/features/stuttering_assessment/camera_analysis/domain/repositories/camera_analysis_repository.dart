import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/domain/entities/camera_analysis.dart';

abstract class Camera_analysisRepository {
  Future<Either<Failure, Camera_analysis>> getCamera_analysis();
}
