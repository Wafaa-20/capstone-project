import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/core/usecase/usecase.dart';
import 'package:taleq/features/auth/domain/repositories/auth_repository.dart';

class ForgetPasswordUseCase
    implements UseCase<String, ForgetPasswordParams> {
  final AuthRepository repository;

  ForgetPasswordUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(
     ForgetPasswordParams params,
  ) async {
    return await repository.forgetPassword(email: params.email);
  }
}

class ForgetPasswordParams {
  final String email;

  ForgetPasswordParams({required this.email});
}
