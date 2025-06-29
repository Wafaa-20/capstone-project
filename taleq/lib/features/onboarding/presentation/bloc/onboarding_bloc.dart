import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:taleq/core/constants/list_constants.dart';
import 'package:taleq/core/service/local_storage.dart';
import 'package:taleq/features/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:taleq/features/onboarding/presentation/bloc/onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final pageController = PageController();
  int currentPage = 0;

  final getItData = GetIt.I.get<LocalStorage>();
  OnboardingBloc() : super(OnboardingInitial()) {
    on<OnboardingEvent>((event, emit) {});
    on<NextPageEvent>(moveToNextPage);
    on<PreviousPageEvent>(backToPreviousPage);
    on<UpdateCurrentPageEvent>(currentPageMethod);
    on<CompleteOnboardingEvent>(completeOnboarding);
  }

  FutureOr<void> moveToNextPage(
    NextPageEvent event,
    Emitter<OnboardingState> emit,
  ) {
    ListConstants.visitedPages.add(currentPage);
    pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  FutureOr<void> backToPreviousPage(
    PreviousPageEvent event,
    Emitter<OnboardingState> emit,
  ) {
    ListConstants.visitedPages.removeLast();
    pageController.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  FutureOr<void> currentPageMethod(
    UpdateCurrentPageEvent event,
    Emitter<OnboardingState> emit,
  ) {
    currentPage = event.pageIndex;
    emit(OnboardingPageState(currentPage: currentPage));
  }

  FutureOr<void> completeOnboarding(
    CompleteOnboardingEvent event,
    Emitter<OnboardingState> emit,
  ) {
    getItData.saveData(key: 'isOnboardingVisited', value: true);
    emit(OnboardingCompleted());
  }
}
