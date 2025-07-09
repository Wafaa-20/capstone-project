import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/lives/domain/entities/lives.dart';

abstract class LivesRepository {
  Future<Either<Failure, Lives>> getLives();
}
