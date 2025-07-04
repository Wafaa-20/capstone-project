import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/core/usecase/usecase.dart';
import 'package:taleq/features/groups/domain/entities/space_details.dart';
import 'package:taleq/features/groups/domain/entities/spaces.dart';
import 'package:taleq/features/groups/domain/repositories/groups_repository.dart';

class GetSpaceDetailsUseCase
    implements UseCase<SpaceDetailsEntity, GetSpaceDetailsParams> {
  final GroupsRepository repository;

  GetSpaceDetailsUseCase({required this.repository});

  @override
  Future<Either<Failure, SpaceDetailsEntity>> call({
    required GetSpaceDetailsParams params,
  }) async {
    return await repository.getSpaceDetails(params.id);
  }
}

class GetSpaceDetailsParams {
  final String id;
  GetSpaceDetailsParams({required this.id});
}
