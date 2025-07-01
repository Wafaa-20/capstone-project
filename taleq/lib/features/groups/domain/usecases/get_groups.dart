import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/groups/domain/entities/groups.dart';
import 'package:taleq/features/groups/domain/repositories/groups_repository.dart';

class GetGroups {
  final GroupsRepository repository;

  GetGroups(this.repository);

  Future<Either<Failure, Groups>> call() async {
    return await repository.getGroups();
  }
}
