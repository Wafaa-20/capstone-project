import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/trainning/data/datasources/trainning_datasource.dart';
import 'package:taleq/features/trainning/domain/entities/trainning.dart';
import 'package:taleq/features/trainning/domain/repositories/trainning_repository.dart';

class TrainningRepositoryImpl implements TrainningRepository {
  final TrainningDatasource datasource;

  TrainningRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, Trainning>> getTrainning() async {
    try {
      final result = await datasource.getTrainning();
      return Right(result.toEntity());
    } on Exception {
      return Left(ServerFailure(message: "Something went wrong!"));
    }
  }
}
