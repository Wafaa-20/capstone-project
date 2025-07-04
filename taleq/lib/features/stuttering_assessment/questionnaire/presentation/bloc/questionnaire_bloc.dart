import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/core/constants/list_constants.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/domain/usecases/save_answers_use_case.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/presentation/bloc/questionnaire_event.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/presentation/bloc/questionnaire_state.dart';

class QuestionnaireBloc extends Bloc<QuestionnaireEvent, QuestionnaireState> {
  final SaveAnswersUseCase saveAnswersUseCase;
  final pageController = PageController();
  int currentPage = 0;
  final Map<String, int> userAnswers = {};
  QuestionnaireBloc(this.saveAnswersUseCase) : super(QuestionnaireInitial()) {
    on<NextPageEvent>(nextPage);
    on<PreviousPageEvent>(previousPage);
    on<UpdatePageEvent>(currentPageMethod);
    on<AnswerSelectedEvent>(answerSelected);
    on<SubmitAnswersEvent>(submitAnswers);
  }

  FutureOr<void> nextPage(
    NextPageEvent event,
    Emitter<QuestionnaireState> emit,
  ) {
    ListConstants.visitedPages.add(currentPage);

    pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  FutureOr<void> previousPage(
    PreviousPageEvent event,
    Emitter<QuestionnaireState> emit,
  ) {
    ListConstants.visitedPages.removeLast();
    pageController.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  FutureOr<void> currentPageMethod(
    UpdatePageEvent event,
    Emitter<QuestionnaireState> emit,
  ) {
    currentPage = event.pageIndex;

    emit(QuestionnairePageState(currentPage: currentPage));
  }

  FutureOr<void> answerSelected(
    AnswerSelectedEvent event,
    Emitter<QuestionnaireState> emit,
  ) {
    userAnswers[event.question] = event.answerIndex;
    emit(AnswerSelectedState(answers: userAnswers));
  }

  FutureOr<void> submitAnswers(
    SubmitAnswersEvent event,
    Emitter<QuestionnaireState> emit,
  ) async {
    emit(SubmitLoadingState());
    final result = await saveAnswersUseCase(
       AnswerParams(answer: userAnswers),
    );
    result.fold(
      (failure) => emit(SubmitFailureState(message: failure.message)),
      (success) => emit(SubmitSuccessState()),
    );
  }

 

  

 
}
