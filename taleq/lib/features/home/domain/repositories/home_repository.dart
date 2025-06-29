import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/home/domain/entities/home.dart';

abstract class HomeRepository {
  Future<Either<Failure, Home>> getHome();
}
