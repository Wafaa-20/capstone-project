import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/auth/data/datasources/supabase_datasource.dart';
import 'package:taleq/features/auth/domain/entities/auth.dart';
import 'package:taleq/features/auth/domain/entities/otp.dart';
import 'package:taleq/features/auth/domain/entities/signup_with_apple_entity.dart';
import 'package:taleq/features/auth/domain/entities/signup_with_google.dart';
import 'package:taleq/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource datasource;

  AuthRepositoryImpl({required this.datasource});
  @override
  Future<Either<Failure, AuthEntity>> loginAuth({
    required String email,
    required String password,
  }) async {
    try {
      final result = await datasource.login(email: email, password: password);
      log(email);
      log(password);
      return Right(result);
    } catch (e) {
      log(email);
      log(password);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> signUpAuth({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final result = await datasource.signUp(
        name: name,
        email: email,
        password: password,
      );

      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SignupWithGoogleEntity>> signupWithGoogleAuth() async {
    try {
      final result = await datasource.signupWithGoogleAuth();

      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SignupWithAppleEntity>> signupWithAppleAuth() async {
    try {
      final result = await datasource.signupWithAppleAuth();

      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, OTPEntity>> otpAuth({
    required String email,
    required String code,
  }) async {
    try {
      final result = await datasource.otpAuth(email: email, code: code);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
  @override
  Future<Either<Failure, String>> resendotpAuth({
    required String email,
    
  }) async {
    try {
      final result = await datasource.resendotpAuth(email: email);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
  @override
  Future<Either<Failure, String>> forgetPassword({
    required String email,
    
  }) async {
    try {
      final result = await datasource.forgetPassword(email: email);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
   @override
  Future<Either<Failure, String>> changePassword({
    required String password,
    required String email,
    
  }) async {
    try {
      final result = await datasource.changePassword(password: password ,email:email);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
