import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/groups/data/datasources/groups_datasource.dart';
import 'package:taleq/features/groups/domain/entities/groups.dart';
import 'package:taleq/features/groups/domain/repositories/groups_repository.dart';

class GroupsRepositoryImpl implements GroupsRepository {
  final GroupsDatasource datasource;

  GroupsRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, Groups>> getGroups() async {
    try {
      final result = await datasource.getGroups();
      return Right(result.toEntity());
    } on Exception {
      return Left(ServerFailure(message: "Something went wrong!"));
    }
  }
}
