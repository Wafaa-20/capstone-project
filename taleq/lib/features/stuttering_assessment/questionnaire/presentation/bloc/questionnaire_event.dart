import 'package:equatable/equatable.dart';

sealed class QuestionnaireEvent extends Equatable {
  const QuestionnaireEvent();

  @override
  List<Object> get props => [];
}

class NextPageEvent extends QuestionnaireEvent {}

class PreviousPageEvent extends QuestionnaireEvent {}

class UpdatePageEvent extends QuestionnaireEvent {
  final int pageIndex;

  const UpdatePageEvent({required this.pageIndex});

  @override
  List<Object> get props => [pageIndex];
}

class AnswerSelectedEvent extends QuestionnaireEvent {
  final String question;
  final int answerIndex;

  const AnswerSelectedEvent({
    required this.question,
    required this.answerIndex,
  });

  @override
  List<Object> get props => [question, answerIndex];
}

class SubmitAnswersEvent extends QuestionnaireEvent {}
