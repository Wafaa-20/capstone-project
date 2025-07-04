import 'package:equatable/equatable.dart';

sealed class PlanEvent extends Equatable {
  const PlanEvent();

  @override
  List<Object> get props => [];
}

class SelectExerciseEvent extends PlanEvent {
  final int currentExercise;
  const SelectExerciseEvent({required this.currentExercise});

  @override
  List<Object> get props => [currentExercise];
}
