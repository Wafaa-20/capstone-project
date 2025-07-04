import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/core/constants/constants.dart';
import 'package:taleq/features/auth/domain/usecases/change_password_use_case.dart';
import 'package:taleq/features/auth/domain/usecases/forget_password_use_case.dart';
import 'package:taleq/features/auth/domain/usecases/login_use_case.dart';
import 'package:taleq/features/auth/domain/usecases/otp_use_case.dart';
import 'package:taleq/features/auth/domain/usecases/resend_otp_use_case.dart';
import 'package:taleq/features/auth/domain/usecases/signup_use_case.dart';
import 'package:taleq/features/auth/domain/usecases/signup_with_apple_usecase.dart';
import 'package:taleq/features/auth/domain/usecases/signup_with_google_usecase.dart';
import 'package:taleq/features/auth/presentation/bloc/auth_event.dart';
import 'package:taleq/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignupUseCase _signupUseCase;
  final OTPUseCase _otpUseCase;
  final SignupWithGoogleUseCase _signupWithGoogleUseCase;
  final SignupWithAppleUseCase _signupWithAppleUseCase;
  final LoginUseCase _loginUseCase;
  final ResendOTPUseCase _resendOTPUseCase;
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;

  final GlobalKey<FormFieldState> signUpNameKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> signUpEmailKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> signUpPasswordKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> loginEmailKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> loginPasswordKey =
      GlobalKey<FormFieldState>();

  final GlobalKey<FormFieldState> changePasswordPasswordKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> changePasswordConfrimKey =
      GlobalKey<FormFieldState>();

  final GlobalKey<FormState> signUpkey = GlobalKey<FormState>();
  final loginkey = GlobalKey<FormState>();
  final forgetPasswordkey = GlobalKey<FormState>();
  final changePasswordkey = GlobalKey<FormState>();

  final TextEditingController userNameSignupController =
      TextEditingController();
  final TextEditingController emailSignupController = TextEditingController();
  final TextEditingController passwordSignupController =
      TextEditingController();

  final TextEditingController emailLoginController = TextEditingController();
  final TextEditingController passwordLoginController = TextEditingController();

  final TextEditingController emailForgetPasswordController =
      TextEditingController();

  final TextEditingController passwordConfrimChangePasswordController =
      TextEditingController();
  final TextEditingController passwordChangePasswordController =
      TextEditingController();

  final RegExp usernameRegExp = Constants.usernameRegExp;
  final String usernameInputRules = Constants.usernameRules;

  final RegExp emailRegExp = Constants.emailRegExp;
  final String emailInputRules = Constants.emailRules;

  final RegExp passwordRegExp = Constants.passwordRegExp;
  final String passwordInputRules = Constants.passwordRules;

  @override
  Future<void> close() {
    userNameSignupController.dispose();
    emailSignupController.dispose();
    passwordSignupController.dispose();
    return super.close();
  }

  AuthBloc(
    this._signupUseCase,
    this._loginUseCase,
    this._signupWithGoogleUseCase,
    this._signupWithAppleUseCase,
    this._otpUseCase,
    this._resendOTPUseCase,
    this._forgetPasswordUseCase,
    this._changePasswordUseCase,
  ) : super(AuthInitial()) {
    on<ValidateFormEvent>(buttonValidate);
    on<SignUpEvent>(signUpEvent);
    on<ResendOTPEvent>(signUpEvent);
    on<OTPVervy>(otp);
    on<SignUpWithGoogleEvent>(signUpWithGoogle);
    on<SignUpWithAppleEvent>(signUpWithApple);
    on<LogInEvent>(logInEvent);
    on<TogglePasswordVisibility>(passwordVisibility);
    on<ForgetPasswordEvent>(forgetPassword);
    on<ChangePasswordEvent>(changePassword);
  }
  FutureOr<void> passwordVisibility(
    TogglePasswordVisibility event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  FutureOr<void> buttonValidate(
    ValidateFormEvent event,
    Emitter<AuthState> emit,
  ) {}

  FutureOr<void> signUpEvent(event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final String email = emailSignupController.text;
    final result = await _signupUseCase(
      SignupParams(
        name: userNameSignupController.text,
        email: emailSignupController.text,
        password: passwordSignupController.text,
      ),
    );
    result.fold(
      (failure) => emit(AuthFailure(message: failure.message)),
      (success) => emit(AuthSuccess(email: email)),
    );
  }

  FutureOr<void> resendOTPEvent(
    ResendOTPEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final String email = event.email;
    final result = await _resendOTPUseCase(ResendOTPParams(email: email));
    result.fold(
      (failure) => emit(AuthFailure(message: failure.message)),
      (success) => emit(AuthSuccess(email: email)),
    );
  }

  FutureOr<void> forgetPassword(
    ForgetPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final String email = emailForgetPasswordController.text;
    final result = await _forgetPasswordUseCase(
      ForgetPasswordParams(email: email),
    );
    result.fold(
      (failure) => emit(AuthFailure(message: failure.message)),
      (success) => emit(AuthSuccess(email: email)),
    );
  }

  FutureOr<void> changePassword(
    ChangePasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final String email = event.email;
    final String password = passwordChangePasswordController.text;
    log('in bloc $email');
    log('in bloc $password');
    final result = await _changePasswordUseCase(
      ChangePasswordParams(password: password, email: email),
    );
    result.fold(
      (failure) => emit(AuthFailure(message: failure.message)),
      (success) => emit(MoveState()),
    );
  }

  FutureOr<void> otp(OTPVervy event, Emitter<AuthState> emit) async {
    final String email = event.email;
    final String code = event.code;
    final result = await _otpUseCase(OTPParams(email: email, code: code));
    result.fold(
      (failure) => emit(AuthFailure(message: failure.message)),
      (success) => emit(OTPSuccess()),
    );
  }

  FutureOr<void> signUpWithGoogle(
    SignUpWithGoogleEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());
      final result = await _signupWithGoogleUseCase(SignupWithGoogleParams());
      result.fold(
        (failure) => emit(AuthFailure(message: failure.message)),
        (success) => emit(MoveState()),
      );
    } catch (e) {
      emit(AuthFailure(message: 'فشل تسجيل الدخول بـ Google'));
    }
  }

  FutureOr<void> signUpWithApple(
    SignUpWithAppleEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());
      final result = await _signupWithAppleUseCase(SignupWithAppleParams());
      result.fold(
        (failure) => emit(AuthFailure(message: failure.message)),
        (success) => emit(MoveState()),
      );
    } catch (e) {
      emit(AuthFailure(message: 'فشل تسجيل الدخول بـ Apple'));
    }
  }

  FutureOr<void> logInEvent(LogInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await _loginUseCase(
      LoginParams(
        email: emailLoginController.text,
        password: passwordLoginController.text,
      ),
    );
    result.fold(
      (failure) => emit(AuthFailure(message: failure.message)),
      (success) => emit(MoveState()),
    );
  }
}
