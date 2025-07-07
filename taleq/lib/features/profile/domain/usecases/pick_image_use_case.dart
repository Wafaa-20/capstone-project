import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/core/usecase/usecase.dart';
import 'package:taleq/features/profile/domain/repositories/image_picker_repository.dart';
import 'package:taleq/features/profile/domain/repositories/profile_repository.dart';

class PickImageUseCase implements UseCase<File, PickImageParams> {
  final ImagePickerRepository repository;

  PickImageUseCase({required this.repository});
  @override
  Future<Either<Failure, File>> call(PickImageParams params) {
    return repository.pickImage(source: params.source);
  }
}

class PickImageParams {

  final ImageSourceType source;

  PickImageParams({required this.source});

}
