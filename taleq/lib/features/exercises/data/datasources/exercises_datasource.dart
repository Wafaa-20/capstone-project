import 'package:taleq/features/exercises/data/models/exercises_model.dart';

abstract class ExercisesDatasource {
  Future<ExercisesModel> getExercises();
}

class ExercisesDatasourceImpl implements ExercisesDatasource {
  @override
  Future<ExercisesModel> getExercises() async {
    // TODO: implement actual data source logic
    // This is just a placeholder implementation
    return ExercisesModel(
      id: '1',
      name: 'Exercises Name',
    );
  }
}
