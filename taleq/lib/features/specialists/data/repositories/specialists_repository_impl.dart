import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/specialists/data/datasources/specialists_datasource.dart';
import 'package:taleq/features/specialists/data/models/specialists_model.dart';
import 'package:taleq/features/specialists/domain/repositories/specialists_repository.dart';

class SpecialistsRepositoryImpl implements SpecialistsRepository {
  final SpecialistsDatasource datasource;

  SpecialistsRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<SpecialistsModel>>> getSpecialists() async {
    try {
      final result = await datasource.getSpecialists();
      print("Result: +++ $result");
      return Right(result);
    } on Exception {
      return Left(ServerFailure(message: "Something went wrong!++++"));
    }
  }
}
