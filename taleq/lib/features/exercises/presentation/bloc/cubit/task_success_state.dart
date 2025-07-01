part of 'task_success_cubit.dart';

@immutable
sealed class TaskSuccessState {}

final class TaskSuccessInitial extends TaskSuccessState {}

final class TaskSuccessWithConfetti extends TaskSuccessState {}
final class TaskSuccessNavigate extends TaskSuccessState {}
