import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class ValidateFormEvent extends AuthEvent {
  final GlobalKey<FormState> formKey;

  const ValidateFormEvent({required this.formKey});
  @override
  List<Object> get props => [formKey];
}

class SignUpEvent extends AuthEvent {}

class ResendOTPEvent extends AuthEvent {
  final String email;
  const ResendOTPEvent(this.email);
}

class ChangePasswordEvent extends AuthEvent {
  final String email;
  const ChangePasswordEvent({required this.email});
}

class ForgetPasswordEvent extends AuthEvent {
  const ForgetPasswordEvent();
}

class LogInEvent extends AuthEvent {}

class TogglePasswordVisibility extends AuthEvent {}

class SignUpWithGoogleEvent extends AuthEvent {}

class AuthFailureWithGoogleEvent extends AuthEvent {
  final String message;
  const AuthFailureWithGoogleEvent({required this.message});
}

class SignUpWithAppleEvent extends AuthEvent {}

class AuthFailureWithAppleEvent extends AuthEvent {
  final String message;
  const AuthFailureWithAppleEvent({required this.message});
}

class OTPVervy extends AuthEvent {
  final String email;
  final String code;

  const OTPVervy({required this.code, required this.email});
}
