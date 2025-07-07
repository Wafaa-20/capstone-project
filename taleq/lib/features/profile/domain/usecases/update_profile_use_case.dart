import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/core/usecase/usecase.dart';
import 'package:taleq/features/profile/domain/entities/profile_entity.dart';
import 'package:taleq/features/profile/domain/repositories/profile_repository.dart';

class UpdateProfileUseCase extends UseCase<ProfileEntity, UpdateProfileParam> {
  final ProfileRepository repository;

  UpdateProfileUseCase({required this.repository});

  @override
  Future<Either<Failure, ProfileEntity>> call(UpdateProfileParam params) {
    return repository.updateProfile(
     
      fullName: params.fullName,
      email: params.email,
      password: params.password,
      avatarUrl: params.avatarUrl,
    );
  }
}

class UpdateProfileParam {

  final String fullName;
  final String email;
  final String password;
  final String avatarUrl;

  UpdateProfileParam({

    required this.fullName,
    required this.email,
    required this.password,
    required this.avatarUrl,
  });
}
