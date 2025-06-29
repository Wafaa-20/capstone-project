import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/plan/data/datasources/plan_datasource.dart';
import 'package:taleq/features/plan/domain/entities/plan.dart';
import 'package:taleq/features/plan/domain/repositories/plan_repository.dart';

class PlanRepositoryImpl implements PlanRepository {
  final PlanDatasource datasource;

  PlanRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, Plan>> getPlan() async {
    try {
      final result = await datasource.getPlan();
      return Right(result.toEntity());
    } on Exception {
      return Left(ServerFailure(message: "Something went wrong!"));
    }
  }
}
