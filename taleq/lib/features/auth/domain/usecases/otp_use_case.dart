import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/core/usecase/usecase.dart';
import 'package:taleq/features/auth/domain/entities/auth.dart';
import 'package:taleq/features/auth/domain/entities/otp.dart';
import 'package:taleq/features/auth/domain/repositories/auth_repository.dart';

class OTPUseCase implements UseCase<OTPEntity, OTPParams> {
  final AuthRepository repository;

  OTPUseCase({required this.repository});

  @override
  Future<Either<Failure, OTPEntity>> call({required OTPParams params}) async {
    return await repository.otpAuth(email: params.email, code: params.code);
  }
}

class OTPParams {
  final String email;
  final String code;

  OTPParams({required this.code, required this.email});
}
