import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/features/profile/domain/usecases/get_profile_use_case.dart';
import 'package:taleq/features/profile/domain/usecases/pick_image_use_case.dart';
import 'package:taleq/features/profile/domain/usecases/sign_out_use_case.dart';
import 'package:taleq/features/profile/domain/usecases/update_profile_use_case.dart';
import 'package:taleq/features/profile/domain/usecases/upload_avatar_use_case.dart';
import 'package:taleq/features/profile/presentation/bloc/profile_event.dart';
import 'package:taleq/features/profile/presentation/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final PickImageUseCase pickImageUseCase;
  final GetProfileUseCase getProfileUseCase;
  final SignOutUseCase signOutUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final UploadAvatarUseCase uploadAvatarUseCase;

  ProfileBloc(
    this.pickImageUseCase,
    this.getProfileUseCase,
    this.signOutUseCase,
    this.updateProfileUseCase,
    this.uploadAvatarUseCase,
  ) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});
    on<PickAvatarEvent>(pickAvatar);
    on<LoadProfileEvent>(loadProfile);
    on<UpdateProfileEvent>(updateProfile);
    on<UploadAvatarEvent>(uploadAvatar);
    on<ChangeLanguageEvent>(changeLanguage);
    on<SignOutEvent>(signOut);
  }

  FutureOr<void> pickAvatar(
    PickAvatarEvent event,
    Emitter<ProfileState> emit,
  ) async {
    final result = await pickImageUseCase(
      PickImageParams(source: event.params.source),
    );
    result.fold((failure) => emit(ProfileFailure(message: failure.message)), (
      file,
    ) {
      emit(SelectedImageProfile(image: file));

      add(UploadAvatarEvent(imageFile: file));
    });
  }

  //Get Profile Data
  FutureOr<void> loadProfile(
    LoadProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    final result = await getProfileUseCase(GetProfileParam());
    result.fold(
      (failure) => emit(ProfileFailure(message: failure.message)),
      (profile) => emit(ProfileLoadedSuccess(profile: profile)),
    );
  }

  //Update Profile Data
  FutureOr<void> updateProfile(
    UpdateProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    log("here we gofff");
    emit(ProfileLoading());

    final result = await updateProfileUseCase(
      UpdateProfileParam(
        fullName: event.fullName,
        email: event.email,
        password: event.password,
        avatarUrl: event.avatarUrl,
      ),
    );
    result.fold((failure) => emit(ProfileFailure(message: failure.message)), (
      profile,
    ) {
      log("here we go:$profile");
      emit(ProfileLoadedSuccess(profile: profile));
    });
  }

  //upload Avatar(Image)
  FutureOr<void> uploadAvatar(
    UploadAvatarEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    final result = await uploadAvatarUseCase(
      UploadAvatarParam(imageFile: event.imageFile),
    );
    result.fold((failure) => emit(ProfileFailure(message: failure.message)), (
      profile,
    ) {
      log(profile.toString());
      emit(ProfileLoadedSuccess(profile: profile));
    });
  }

  //Change APP Language
  FutureOr<void> changeLanguage(
    ChangeLanguageEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    //  final result = await;
    //  result.fold(
    //   (failure) => emit(ProfileFailure(message: failure.message)),
    //   (profile) => emit(ProfileUpdateSuccess(profile: profile)),
    // );
  }

  //Sign Out from the account
  FutureOr<void> signOut(SignOutEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    final result = await signOutUseCase(SignOutParam());
    result.fold(
      (failure) => emit(ProfileFailure(message: failure.message)),
      (success) => emit(SignOutSuccess()),
    );
  }
}
