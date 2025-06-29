import 'package:equatable/equatable.dart';

sealed class ExercisesState extends Equatable {
  const ExercisesState();

  @override
  List<Object> get props => [];
}

final class ExercisesInitial extends ExercisesState {}
