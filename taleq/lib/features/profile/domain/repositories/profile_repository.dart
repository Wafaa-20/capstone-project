import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/profile/domain/entities/profile_entity.dart';

enum ImageSourceType { camera, gallery }

abstract class ProfileRepository {
  //Upload Avatar Image
  Future<Either<Failure, ProfileEntity>> uploadAvatar({

    required File imageFile,
  });
  //Get Profile
  Future<Either<Failure, ProfileEntity>> getProfile();

  //Update Profile
  Future<Either<Failure, ProfileEntity>> updateProfile({

    required String fullName,
    required String email,
    required String password,
    required String avatarUrl,
  });
  //SignOut From Account
  Future<Either<Failure, void>> signOut();
}
