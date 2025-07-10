import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taleq/features/plan/data/models/plan_details/plan_details_model.dart';
import 'package:taleq/features/plan/presentation/bloc/plan_event.dart';
import 'package:taleq/features/plan/presentation/bloc/plan_state.dart';

class PlanBloc extends Bloc<PlanEvent, PlanState> {
  final controller = ScrollController();
  final totalExercises = planDetails.length - 1;
  double progress = 0;
  int currentIndex = 0;
  PlanBloc() : super(PlanInitial()) {
    on<PlanEvent>((event, emit) {});
    on<SelectExerciseEvent>(selectExercise);
  }

  Future<void> selectExercise(
    SelectExerciseEvent event,
    Emitter<PlanState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    final bool? questunereDone = prefs.getBool('questunereDone');

    if (questunereDone == true) {
      emit(QuestnereState());
      return;
    }
    final newIndex = event.currentExercise;
    //back to Previous Exercise
    if (newIndex < currentIndex) {
      log("EMIT PreviousExercise NI ${newIndex.toString()}");
      log("EMIT PreviousExercise CI${currentIndex.toString()}");
      emit(PreviousExercise(previousIndex: newIndex));
      //Go to Current Exercise
    } else if (newIndex == currentIndex) {
      log("EMIT CurrentExercise NI ${newIndex.toString()}");
      log("EMIT CurrentExercise CI${currentIndex.toString()}");
      emit(CurrentExercise(currentIndex: newIndex));
      //Go to Next Exercise
    } else if (newIndex > currentIndex && newIndex < totalExercises) {
      log("EMIT NextExercise NI ${newIndex.toString()}");
      log("EMIT NextExercise CI${currentIndex.toString()}");
      progress = progress + 0.33;
      emit(NextExercise(nextIndex: newIndex));
    } else {
      log("EMIT ExerciseComplete NI ${newIndex.toString()}");
      log("EMIT ExerciseComplete CI${currentIndex.toString()}");
      if (progress < 0.99) {
        progress = progress + 0.33;
      }
      emit(ExerciseComplete());
    }
    emit(CurrentExercise(currentIndex: newIndex));
    currentIndex = newIndex;
  }
}
