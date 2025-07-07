import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/profile/data/datasources/profile_datasource.dart';
import 'package:taleq/features/profile/data/models/user_profile/user_profile_model.dart';
import 'package:taleq/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDatasource datasource;

  ProfileRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, UserProfileModel>> getProfile() async {
    try {
      final result = await datasource.getProfile();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserProfileModel>> updateProfile({
    required String fullName,
    required String email,
    required String password,
    required String avatarUrl,
  }) async {
    try {
      final result = await datasource.updateProfile(
        fullName: fullName,
        email: email,
        password: password,
        avatarUrl: avatarUrl,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserProfileModel>> uploadAvatar({
    required File imageFile,
  }) async {
    try {
      final result = await datasource.uploadAvatar(imageFile: imageFile);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await datasource.signOut();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
