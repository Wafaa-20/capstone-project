import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/profile/data/datasources/image_picker_datasource.dart';
import 'package:taleq/features/profile/domain/repositories/image_picker_repository.dart';
import 'package:taleq/features/profile/domain/repositories/profile_repository.dart';

class ImagePickerRepositoryImpl implements ImagePickerRepository {
  final ImagePickerDatasource datasource;

  ImagePickerRepositoryImpl({required this.datasource});
  @override
  Future<Either<Failure, File>> pickImage({
    required ImageSourceType source,
  }) async {
    try {
      File? file;
      if (source == ImageSourceType.camera) {
        file = await datasource.pickImageFromCamera();
      } else {
        file = await datasource.pickImageFromGallery();
      }
      if (file == null) {
        return Left(ServerFailure(message: 'No image selected'));
      }

      return Right(file);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
