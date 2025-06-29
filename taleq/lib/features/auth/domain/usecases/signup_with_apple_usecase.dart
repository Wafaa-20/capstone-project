import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/core/usecase/usecase.dart';
import 'package:taleq/features/auth/domain/entities/auth.dart';
import 'package:taleq/features/auth/domain/entities/signup_with_apple_entity.dart';
import 'package:taleq/features/auth/domain/repositories/auth_repository.dart';
class SignupWithAppleUseCase implements UseCase<SignupWithAppleEntity, SignupWithAppleParams> {
  final AuthRepository repository;

  SignupWithAppleUseCase({required this.repository});

  @override
  Future<Either<Failure, SignupWithAppleEntity>> call({
    required SignupWithAppleParams params,
  }) async {
    return await repository.signupWithAppleAuth();
  }
}

class SignupWithAppleParams {
  

  SignupWithAppleParams();
}
