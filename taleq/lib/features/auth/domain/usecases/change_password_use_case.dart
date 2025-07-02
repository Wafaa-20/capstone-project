import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/core/usecase/usecase.dart';

import 'package:taleq/features/auth/domain/repositories/auth_repository.dart';

class ChangePasswordUseCase implements UseCase<String, ChangePasswordParams> {
  final AuthRepository repository;

  ChangePasswordUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call({
    required ChangePasswordParams params,
  }) async {
    return await repository.changePassword(
      password: params.password,
      email: params.email,
    );
  }
}

class ChangePasswordParams {
  final String password;
  final String email;
  ChangePasswordParams({required this.email, required this.password});
}
