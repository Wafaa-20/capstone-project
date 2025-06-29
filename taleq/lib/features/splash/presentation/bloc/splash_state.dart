import 'package:equatable/equatable.dart';

sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

final class SplashInitial extends SplashState {}

final class FirstTimeUseApp extends SplashState {}

final class NotFirstTimeUseApp extends SplashState {}

final class AuthSuccess extends SplashState {}
