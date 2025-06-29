import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/plan/domain/entities/plan.dart';
import 'package:taleq/features/plan/domain/repositories/plan_repository.dart';

class GetPlan {
  final PlanRepository repository;

  GetPlan(this.repository);

  Future<Either<Failure, Plan>> call() async {
    return await repository.getPlan();
  }
}
