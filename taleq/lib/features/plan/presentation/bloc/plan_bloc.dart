import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/features/plan/data/models/plan_details/plan_details_model.dart';
import 'package:taleq/features/plan/presentation/bloc/plan_event.dart';
import 'package:taleq/features/plan/presentation/bloc/plan_state.dart';

class PlanBloc extends Bloc<PlanEvent, PlanState> {
  final controller = ScrollController();
  final totalExercises = planDetails.length - 1;
  int currentIndex = 0;
  PlanBloc() : super(PlanInitial()) {
    on<PlanEvent>((event, emit) {});
    on<SelectExerciseEvent>(selectExercise);
  }

  FutureOr<void> selectExercise(
    SelectExerciseEvent event,
    Emitter<PlanState> emit,
  ) {
    final newIndex = event.currentExercise;
    //back to Previous Exercise
    if (newIndex < currentIndex) {
      emit(PreviousExercise(previousIndex: newIndex));
      //Go to Current Exercise
    } else if (newIndex == currentIndex) {
      emit(CurrentExercise(currentIndex: newIndex));
      //Go to Next Exercise
    } else if (newIndex > currentIndex && newIndex < totalExercises) {
      emit(NextExercise(nextIndex: newIndex));
    } else {
      emit(ExerciseComplete());
    }
    emit(CurrentExercise(currentIndex: newIndex));
    currentIndex = newIndex;
  }
}
