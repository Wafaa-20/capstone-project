import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/groups/data/datasources/supabase_datasource.dart';
import 'package:taleq/features/groups/data/models/join_details.dart';
import 'package:taleq/features/groups/data/models/space_details_model.dart';
import 'package:taleq/features/groups/data/models/summary_spaces_model.dart';
import 'package:taleq/features/groups/domain/entities/join_details.dart';
import 'package:taleq/features/groups/domain/entities/space_details.dart';
import 'package:taleq/features/groups/domain/entities/spaces.dart';
import 'package:taleq/features/groups/domain/repositories/groups_repository.dart';

class GroupsRepositoryImpl implements GroupsRepository {
  final GroupsRemoteDatasource datasource;

  GroupsRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, Map<String, List<SpacesEntity>>>>
  getSummerySpaces() async {
    try {
      final result = await datasource.getSummerySpaces();

      final availableSpaces =
          result['availableSpaces']
              ?.map((space) => space.toEntity())
              .toList() ??
          [];
      final userSpaces =
          result['userSpaces']?.map((space) => space.toEntity()).toList() ?? [];

      return Right({
        'availableSpaces': availableSpaces,
        'userSpaces': userSpaces,
      });
    } on Exception {
      return Left(ServerFailure(message: "Something went wrong!"));
    }
  }

  @override
  Future<Either<Failure, SpaceDetailsEntity>> getSpaceDetails(
    String spaceId,
  ) async {
    try {
      final result = await datasource.getSpaceDetails(spaceId);

      final entity = result.toEntity();

      return Right(entity);
    } on Exception {
      return Left(ServerFailure(message: "Something went wrong!"));
    }
  }

  @override
  Future<Either<Failure, JoinDetailsEntity>> joinSpace(
    String spaceId,
    String channelName,
  ) async {
    try {
      final result = await datasource.joinSpace(spaceId, channelName);

      final entity = result.toEntity();

      return Right(entity);
    } on Exception {
      return Left(ServerFailure(message: "Something went wrong!"));
    }
  }
}
