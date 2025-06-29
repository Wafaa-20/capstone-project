import 'package:taleq/features/exercises/domain/entities/exercises.dart';

class ExercisesModel {
  final String id;
  final String name;

  ExercisesModel({
    required this.id,
    required this.name,
  });

  factory ExercisesModel.fromJson(Map<String, dynamic> json) {
    return ExercisesModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  Exercises toEntity() {
    return Exercises(
      id: id,
      name: name,
    );
  }
}
