import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/profile/domain/repositories/profile_repository.dart';

abstract class ImagePickerRepository {
  Future<Either<Failure, File>> pickImage({required ImageSourceType source});
}
