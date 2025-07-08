import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/trainning/domain/entities/trainning.dart';

abstract class TrainningRepository {
  Future<Either<Failure, Trainning>> getTrainning();
}
