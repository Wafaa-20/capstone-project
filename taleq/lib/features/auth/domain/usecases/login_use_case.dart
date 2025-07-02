import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/core/usecase/usecase.dart';
import 'package:taleq/features/auth/domain/entities/auth.dart';
import 'package:taleq/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase implements UseCase<AuthEntity, LoginParams> {
  final AuthRepository repository;

  LoginUseCase({required this.repository});
  @override
  Future<Either<Failure, AuthEntity>> call({
    required LoginParams params,
  }) async {
    return await repository.loginAuth(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
