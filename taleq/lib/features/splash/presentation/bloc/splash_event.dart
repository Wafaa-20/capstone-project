import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

sealed class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

class CheckFirstTimeUserEvent extends SplashEvent {}

class AuthSuccessWithGoogleEvent extends SplashEvent {
  final User user;
  const AuthSuccessWithGoogleEvent({required this.user});
}
