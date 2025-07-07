import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:taleq/features/profile/domain/usecases/pick_image_use_case.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class PickAvatarEvent extends ProfileEvent {
  final PickImageParams params;
  const PickAvatarEvent(this.params);

  @override
  List<Object> get props => [params];
}

class LoadProfileEvent extends ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final String userId;
  final String fullName;
  final String email;
  final String password;
  final String avatarUrl;

  const UpdateProfileEvent({
    required this.userId,
    required this.fullName,
    required this.email,
    required this.password,
    required this.avatarUrl,
  });
  @override
  List<Object> get props => [userId, fullName, email, password, avatarUrl];
}

class UploadAvatarEvent extends ProfileEvent {
  final String userId;
  final File imageFile;

  const UploadAvatarEvent({required this.userId, required this.imageFile});

  @override
  List<Object> get props => [userId, imageFile];
}

class ChangeLanguageEvent extends ProfileEvent {
  final String localeCode;

  const ChangeLanguageEvent({required this.localeCode});
  @override
  List<Object> get props => [localeCode];
}

class SignOutEvent extends ProfileEvent {}
