import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call({required Params params});
}
