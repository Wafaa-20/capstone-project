import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/features/exercises/Words_Excercise/presentation/bloc/word_exercise_bloc_bloc.dart';
import 'package:taleq/features/exercises/Words_Excercise/presentation/widget/custom_smoth_page_indicator.dart';
import 'package:taleq/features/exercises/Words_Excercise/presentation/widget/voice_excercise.dart';

class WordsExercisePage extends StatelessWidget {
  const WordsExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WordExerciseBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<WordExerciseBloc>();
          return Scaffold(
            backgroundColor: AppPalette.iosRed,
            body: PageView.builder(
              controller: bloc.pageController,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      bloc.list[index],
                      style: TextStyles.sf60020.copyWith(
                        color: AppPalette.whitePrimary,
                      ),
                    ),
                    SizedBox(height: 59),
                    VoiceExercise(),
                    SizedBox(height: 105),
                    CustomSmoothPageIndicator(bloc: bloc),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
