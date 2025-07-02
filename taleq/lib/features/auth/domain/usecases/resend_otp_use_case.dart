import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/core/usecase/usecase.dart';
import 'package:taleq/features/auth/domain/repositories/auth_repository.dart';

class ResendOTPUseCase implements UseCase<String, ResendOTPParams> {
  final AuthRepository repository;

  ResendOTPUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call({
    required ResendOTPParams params,
  }) async {
    return await repository.resendotpAuth(email: params.email);
  }
}

class ResendOTPParams {
  final String email;

  ResendOTPParams({required this.email});
}
