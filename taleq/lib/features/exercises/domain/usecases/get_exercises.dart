import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/exercises/domain/entities/exercises.dart';
import 'package:taleq/features/exercises/domain/repositories/exercises_repository.dart';

class GetExercises {
  final ExercisesRepository repository;

  GetExercises(this.repository);

  Future<Either<Failure, Exercises>> call() async {
    return await repository.getExercises();
  }
}
