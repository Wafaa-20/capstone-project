import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/groups/domain/entities/groups.dart';

abstract class GroupsRepository {
  Future<Either<Failure, Groups>> getGroups();
}
