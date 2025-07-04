import 'package:equatable/equatable.dart';

sealed class PlanState extends Equatable {
  const PlanState();

  @override
  List<Object> get props => [];
}

final class PlanInitial extends PlanState {}

final class PreviousExercise extends PlanState {
  final int previousIndex;

  const PreviousExercise({required this.previousIndex});
  @override
  List<Object> get props => [previousIndex];
}

final class CurrentExercise extends PlanState {
  final int currentIndex;

  const CurrentExercise({required this.currentIndex});
  @override
  List<Object> get props => [currentIndex];
}

final class NextExercise extends PlanState {
  final int nextIndex;

  const NextExercise({required this.nextIndex});
  @override
  List<Object> get props => [nextIndex];
}

final class ExerciseComplete extends PlanState {}
