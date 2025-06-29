import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/domain/entities/camera_analysis.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/domain/repositories/camera_analysis_repository.dart';

class GetCamera_analysis {
  final Camera_analysisRepository repository;

  GetCamera_analysis(this.repository);

  Future<Either<Failure, Camera_analysis>> call() async {
    return await repository.getCamera_analysis();
  }
}
