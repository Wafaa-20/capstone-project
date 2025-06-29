import 'package:equatable/equatable.dart';

sealed class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];
}

final class OnboardingInitial extends OnboardingState {}

final class OnboardingPageState extends OnboardingState {
  final int currentPage;

  const OnboardingPageState({required this.currentPage});
  @override
  List<Object> get props => [currentPage];
}

final class OnboardingCompleted extends OnboardingState {}
