import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/home/data/datasources/home_datasource.dart';
import 'package:taleq/features/home/data/models/specialist_model.dart';
import 'package:taleq/features/home/domain/entities/specialist_entity.dart';
import 'package:taleq/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasource datasource;

  HomeRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<SpecialistEntity>>> getSpecialistData() async {
    try {
      final result = await datasource.getSpecialistData();
      return Right(result.map((model) => model.toEntity()).toList());
    } on Exception {
      return Left(ServerFailure(message: "Something went wrong!"));
    }
  }
}
