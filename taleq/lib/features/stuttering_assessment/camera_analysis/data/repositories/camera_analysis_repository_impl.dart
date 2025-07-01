import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/data/datasources/camera_analysis_datasource.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/data/models/camera_analysis_model.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/domain/repositories/camera_analysis_repository.dart';

class CameraAnalysisRepositoryImpl implements CameraAnalysisRepository {
  final CameraAnalysisDatasource datasource;

  CameraAnalysisRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, CameraAnalysisModel>> getCameraAnalysis() async {
    try {
      final result = await datasource.getCameraAnalysis();
      return Right(result);
    } on Exception {
      return Left(ServerFailure(message: "Something went wrong!"));
    }
  }
}
