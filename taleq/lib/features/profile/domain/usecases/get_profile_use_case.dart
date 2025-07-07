import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/core/usecase/usecase.dart';
import 'package:taleq/features/profile/domain/entities/profile_entity.dart';
import 'package:taleq/features/profile/domain/repositories/profile_repository.dart';

class GetProfileUseCase extends UseCase<ProfileEntity, GetProfileParam> {
  final ProfileRepository repository;

  GetProfileUseCase({required this.repository});

  @override
  Future<Either<Failure, ProfileEntity>> call(GetProfileParam params) {
    return repository.getProfile();
  }
}

class GetProfileParam {}
