import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/core/usecase/usecase.dart';
import 'package:taleq/features/profile/domain/repositories/profile_repository.dart';

class SignOutUseCase extends UseCase<void, SignOutParam> {
  final ProfileRepository repository;

  SignOutUseCase({required this.repository});
  @override
  Future<Either<Failure, void>> call(SignOutParam params) {
    return repository.signOut();
  }
}

class SignOutParam {}
