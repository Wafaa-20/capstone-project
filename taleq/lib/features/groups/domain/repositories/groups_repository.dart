import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/groups/domain/entities/join_details.dart';
import 'package:taleq/features/groups/domain/entities/space_details.dart';
import 'package:taleq/features/groups/domain/entities/spaces.dart';

abstract class GroupsRepository {
  Future<Either<Failure, Map<String, List<SpacesEntity>>>> getSummerySpaces();
  Future<Either<Failure, SpaceDetailsEntity>> getSpaceDetails(String spaceId);
  Future<Either<Failure, JoinDetailsEntity>> joinSpace(String spaceId ,String channelName);
}
