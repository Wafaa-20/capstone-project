import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:taleq/features/profile/domain/entities/profile_entity.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoadedSuccess extends ProfileState {
  final ProfileEntity profile;

  const ProfileLoadedSuccess({required this.profile});

  @override
  List<Object> get props => [profile];
}

final class ProfileFailure extends ProfileState {
  final String message;
  const ProfileFailure({required this.message});
  @override
  List<Object> get props => [message];
} // ignore: unused_import

final class SelectedImageProfile extends ProfileState {
  final File image;

  const SelectedImageProfile({required this.image});
  @override
  List<Object> get props => [image];
}

final class ChangeLanguageSuccess extends ProfileState {}

final class SignOutSuccess extends ProfileState {}
