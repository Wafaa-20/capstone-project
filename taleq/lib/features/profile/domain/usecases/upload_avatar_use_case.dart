import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/core/usecase/usecase.dart';
import 'package:taleq/features/profile/domain/entities/profile_entity.dart';
import 'package:taleq/features/profile/domain/repositories/profile_repository.dart';

class UploadAvatarUseCase extends UseCase<ProfileEntity, UploadAvatarParam> {
  final ProfileRepository repository;

  UploadAvatarUseCase({required this.repository});

  @override
  Future<Either<Failure, ProfileEntity>> call(UploadAvatarParam params) {
    return repository.uploadAvatar(imageFile: params.imageFile);
  }
}

class UploadAvatarParam {
  final File imageFile;

  UploadAvatarParam({required this.imageFile});
}
