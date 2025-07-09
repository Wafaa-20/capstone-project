import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/lives/data/datasources/lives_datasource.dart';
import 'package:taleq/features/lives/domain/entities/lives.dart';
import 'package:taleq/features/lives/domain/repositories/lives_repository.dart';

class LivesRepositoryImpl implements LivesRepository {
  final LivesDatasource datasource;

  LivesRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, Lives>> getLives() async {
    try {
      final result = await datasource.getLives();
      return Right(result.toEntity());
    } on Exception {
      return Left(ServerFailure(message: "Something went wrong!"));
    }
  }
}
