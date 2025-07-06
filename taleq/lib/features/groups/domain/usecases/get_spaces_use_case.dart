import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/core/usecase/usecase.dart';
import 'package:taleq/features/groups/domain/entities/spaces.dart';
import 'package:taleq/features/groups/domain/repositories/groups_repository.dart';

class GetSpacesUseCase
    implements UseCase<Map<String, List<SpacesEntity>>, GetSpacesParams> {
  final GroupsRepository repository;

  GetSpacesUseCase({required this.repository});

  @override
  Future<Either<Failure, Map<String, List<SpacesEntity>>>> call(
    GetSpacesParams params,
  ) async {
    
    return await repository.getSummerySpaces();
  }
}

class GetSpacesParams {
  GetSpacesParams();
}
