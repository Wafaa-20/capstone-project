import 'package:bloc/bloc.dart';
import 'package:confetti/confetti.dart';
import 'package:meta/meta.dart';

part 'task_success_state.dart';

class TaskSuccessCubit extends Cubit<TaskSuccessState> {
  final confettiController = ConfettiController();
  TaskSuccessCubit() : super(TaskSuccessInitial());

  void triggerConfetti() async {
    emit(TaskSuccessWithConfetti());

    await Future.delayed(const Duration(seconds: 4), () {
      emit(TaskSuccessNavigate());
    });
  }
}
