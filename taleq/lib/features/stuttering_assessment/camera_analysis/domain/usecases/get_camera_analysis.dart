import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/core/usecase/usecase.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/domain/entities/camera_analysis.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/domain/repositories/camera_analysis_repository.dart';

class CameraAnalysisUseCase
    implements UseCase<CameraAnalysisEntity, CameraAnalysisParam> {
  final CameraAnalysisRepository repository;

  CameraAnalysisUseCase({required this.repository});

  @override
  Future<Either<Failure, CameraAnalysisEntity>> call({
    required CameraAnalysisParam params,
  }) async {
    return await repository.getCameraAnalysis();
  }
}

class CameraAnalysisParam {}
