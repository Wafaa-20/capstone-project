import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/lives/domain/entities/lives.dart';
import 'package:taleq/features/lives/domain/repositories/lives_repository.dart';

class GetLives {
  final LivesRepository repository;

  GetLives(this.repository);

  Future<Either<Failure, Lives>> call() async {
    return await repository.getLives();
  }
}
