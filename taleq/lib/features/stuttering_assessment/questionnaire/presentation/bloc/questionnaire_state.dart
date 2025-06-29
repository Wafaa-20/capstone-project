import 'package:equatable/equatable.dart';

sealed class QuestionnaireState extends Equatable {
  const QuestionnaireState();

  @override
  List<Object> get props => [];
}

final class QuestionnaireInitial extends QuestionnaireState {}

final class QuestionnairePageState extends QuestionnaireState {
  final int currentPage;

  const QuestionnairePageState({required this.currentPage});
  @override
  List<Object> get props => [currentPage];
}

final class AnswerSelectedState extends QuestionnaireState {
  final Map<String, int> answers;

  const AnswerSelectedState({required this.answers});
  @override
  List<Object> get props => [answers];
}

final class SubmitLoadingState extends QuestionnaireState {}

final class SubmitSuccessState extends QuestionnaireState {}

final class SubmitFailureState extends QuestionnaireState {
  final String message;

  const SubmitFailureState({required this.message});
  @override
  List<Object> get props => [message];
}

final class QuestionnaireCompleted extends QuestionnaireState {}
