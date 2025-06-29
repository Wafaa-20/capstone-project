import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/exercises/data/datasources/exercises_datasource.dart';
import 'package:taleq/features/exercises/domain/entities/exercises.dart';
import 'package:taleq/features/exercises/domain/repositories/exercises_repository.dart';

class ExercisesRepositoryImpl implements ExercisesRepository {
  final ExercisesDatasource datasource;

  ExercisesRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, Exercises>> getExercises() async {
    try {
      final result = await datasource.getExercises();
      return Right(result.toEntity());
    } on Exception {
      return Left(ServerFailure(message: "Something went wrong!"));
    }
  }
}
