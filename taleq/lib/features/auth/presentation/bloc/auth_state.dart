import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final bool isPasswordVisible;

  const AuthState({this.isPasswordVisible = false});

  AuthState copyWith({bool? isPasswordVisible}) {
    return AuthState(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }

  @override
  List<Object> get props => [isPasswordVisible];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}
final class OTPSuccess extends AuthState {}

final class AuthSuccess extends AuthState {
  final String email;
  const AuthSuccess({required this.email});
}
final class MoveState extends AuthState {
  
  const MoveState();
}
final class AuthFailure extends AuthState {
  final String message;
  const AuthFailure({required this.message});
}
