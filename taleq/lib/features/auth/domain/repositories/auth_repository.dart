import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/auth/domain/entities/auth.dart';
import 'package:taleq/features/auth/domain/entities/otp.dart';
import 'package:taleq/features/auth/domain/entities/signup_with_apple_entity.dart';
import 'package:taleq/features/auth/domain/entities/signup_with_google.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> loginAuth({
    required String email,
    required String password,
  });
  Future<Either<Failure, AuthEntity>> signUpAuth({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, SignupWithGoogleEntity>> signupWithGoogleAuth();
  Future<Either<Failure, SignupWithAppleEntity>> signupWithAppleAuth();
  Future<Either<Failure, OTPEntity>> otpAuth({
    required String email,
    required String code,
  });
  Future<Either<Failure, String>> resendotpAuth({required String email});
  Future<Either<Failure, String>> forgetPassword({required String email});
  Future<Either<Failure, String>> changePassword({
    required String password,
    required String email,
  });
}
