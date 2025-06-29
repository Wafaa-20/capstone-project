import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/data/datasources/camera_analysis_datasource.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/domain/entities/camera_analysis.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/domain/repositories/camera_analysis_repository.dart';

class Camera_analysisRepositoryImpl implements Camera_analysisRepository {
  final Camera_analysisDatasource datasource;

  Camera_analysisRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, Camera_analysis>> getCamera_analysis() async {
    try {
      final result = await datasource.getCamera_analysis();
      return Right(result.toEntity());
    } on Exception {
      return Left(ServerFailure(message: "Something went wrong!"));
    }
  }
}
