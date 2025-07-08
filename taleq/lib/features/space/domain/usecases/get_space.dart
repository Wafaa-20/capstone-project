import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/space/domain/entities/space.dart';
import 'package:taleq/features/space/domain/repositories/space_repository.dart';
import 'package:taleq/core/usecase/usecase.dart';

class GetSpaceListsUseCase implements UseCase<SpaceEntity, SpaceParams> {
  final SpaceRepository repository;

  GetSpaceListsUseCase({required this.repository});

  @override
  Future<Either<Failure, SpaceEntity>> call(SpaceParams params) async {
    return await repository.getSpaceLists(params.spaceID, params.userID);
  }
}

class SpaceParams {
  final String spaceID;
  final String userID;
  SpaceParams({required this.spaceID, required this.userID});
}
