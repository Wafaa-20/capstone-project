import 'package:equatable/equatable.dart';

sealed class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class NextPageEvent extends OnboardingEvent {}

class PreviousPageEvent extends OnboardingEvent {}

class UpdateCurrentPageEvent extends OnboardingEvent {
  final int pageIndex;

  const UpdateCurrentPageEvent({required this.pageIndex});
  @override
  List<Object> get props => [pageIndex];
}

class CompleteOnboardingEvent extends OnboardingEvent {}
