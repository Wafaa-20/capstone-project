import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/space/data/datasources/space_datasource.dart';
import 'package:taleq/features/space/domain/entities/space.dart';
import 'package:taleq/features/space/domain/repositories/space_repository.dart';

class SpaceRepositoryImpl implements SpaceRepository {
  final SpaceDatasource datasource;

  SpaceRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, Space>> getSpace() async {
    try {
      final result = await datasource.getSpace();
      return Right(result.toEntity());
    } on Exception {
      return Left(ServerFailure(message: "Something went wrong!"));
    }
  }
}
