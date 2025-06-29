import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/exercises/domain/entities/exercises.dart';

abstract class ExercisesRepository {
  Future<Either<Failure, Exercises>> getExercises();
}
