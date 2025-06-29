import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/features/exercises/presentation/bloc/exercises_event.dart';
import 'package:taleq/features/exercises/presentation/bloc/exercises_state.dart';

class ExercisesBloc extends Bloc<ExercisesEvent, ExercisesState> {
  ExercisesBloc() : super(ExercisesInitial()) {
    on<ExercisesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
