import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/trainning/domain/entities/trainning.dart';
import 'package:taleq/features/trainning/domain/repositories/trainning_repository.dart';

class GetTrainning {
  final TrainningRepository repository;

  GetTrainning(this.repository);

  Future<Either<Failure, Trainning>> call() async {
    return await repository.getTrainning();
  }
}
