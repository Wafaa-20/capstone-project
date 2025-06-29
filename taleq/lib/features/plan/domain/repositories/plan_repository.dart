import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/plan/domain/entities/plan.dart';

abstract class PlanRepository {
  Future<Either<Failure, Plan>> getPlan();
}
