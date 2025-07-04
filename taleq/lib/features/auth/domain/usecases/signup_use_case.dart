import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/core/usecase/usecase.dart';
import 'package:taleq/features/auth/domain/entities/auth.dart';
import 'package:taleq/features/auth/domain/repositories/auth_repository.dart';

class SignupUseCase implements UseCase<AuthEntity, SignupParams> {
  final AuthRepository repository;

  SignupUseCase({required this.repository});

  @override
  Future<Either<Failure, AuthEntity>> call(
     SignupParams params,
  ) async {
    return await repository.signUpAuth(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class SignupParams {
  final String name;
  final String email;
  final String password;

  SignupParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
