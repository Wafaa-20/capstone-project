import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/features/exercises/Words_Excercise/presentation/bloc/word_exercise_bloc_bloc.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  const CustomSmoothPageIndicator({super.key, required this.bloc});
  final WordExerciseBloc bloc;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: bloc.pageController, // PageController
      count: bloc.list.length,
      effect: WormEffect(
        dotHeight: 10,
        dotWidth: 10,
        activeDotColor: AppPalette.orangePrimary,
        dotColor: AppPalette.whiteLight2,
      ), // your preferred effect
      onDotClicked: (index) {},
    );
  }
}
