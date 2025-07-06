import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/core/usecase/usecase.dart';
import 'package:taleq/features/groups/domain/entities/join_details.dart';
import 'package:taleq/features/groups/domain/entities/space_details.dart';
import 'package:taleq/features/groups/domain/entities/spaces.dart';
import 'package:taleq/features/groups/domain/repositories/groups_repository.dart';

class JoinSpaceUseCase implements UseCase<JoinDetailsEntity, JoinSpaceParams> {
  final GroupsRepository repository;

  JoinSpaceUseCase({required this.repository});

  @override
  Future<Either<Failure, JoinDetailsEntity>> call(
    JoinSpaceParams params,
  ) async {
    return await repository.joinSpace(params.spaceID, params.channelName);
  }
}

class JoinSpaceParams {
  final String spaceID;
  final String channelName;
  JoinSpaceParams({required this.spaceID, required this.channelName});
}
