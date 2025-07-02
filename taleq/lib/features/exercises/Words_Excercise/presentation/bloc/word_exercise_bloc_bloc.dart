import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:taleq/core/constants/list_constants.dart';

part 'word_exercise_bloc_event.dart';
part 'word_exercise_bloc_state.dart';

class WordExerciseBloc extends Bloc<WordExerciseEvent, WordExerciseState> {
  final pageController = PageController();
  final  list = ListConstants.words;
  WordExerciseBloc() : super(WordExerciseInitial()) {
    on<WordExerciseEvent>((event, emit) {
      
    });
  }
}
