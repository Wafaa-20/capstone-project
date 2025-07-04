import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/core/usecase/usecase.dart';
import 'package:taleq/features/auth/domain/entities/signup_with_google.dart';
import 'package:taleq/features/auth/domain/repositories/auth_repository.dart';

class SignupWithGoogleUseCase
    implements UseCase<SignupWithGoogleEntity, SignupWithGoogleParams> {
  final AuthRepository repository;

  SignupWithGoogleUseCase({required this.repository});

  @override
  Future<Either<Failure, SignupWithGoogleEntity>> call(
    SignupWithGoogleParams params,
  ) async {
    return await repository.signupWithGoogleAuth();
  }
}

class SignupWithGoogleParams {
  SignupWithGoogleParams();
}
