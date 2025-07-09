import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/features/exercises/Breathe_Excercise/presentation/bloc/breath_bloc.dart';
import 'package:taleq/features/exercises/Breathe_Excercise/presentation/bloc/breath_event.dart';
import 'package:taleq/features/exercises/Breathe_Excercise/presentation/bloc/breath_state.dart';
import 'package:taleq/features/exercises/Breathe_Excercise/presentation/widget/breathing_circle.dart';
import 'package:taleq/features/exercises/Breathe_Excercise/presentation/widget/enum.dart';

class BreathingPage extends StatelessWidget {
  const BreathingPage({super.key});

  String _formatTime(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  String _getBreathingText(BreathingPhase phase) {
    switch (phase) {
      case BreathingPhase.inhale:
        return 'استرخِ، وخذ نفسًا عميقًا';
      case BreathingPhase.hold:
        return 'احتفظ به للحظة';
      case BreathingPhase.exhale:
        return 'أزفر ببطء';
      case BreathingPhase.initial:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> durations = ['دقيقة', 'دقيقتان', '3 دقائق'];

    return BlocProvider(
      create: (context) => BreathingBloc(),
      child: Scaffold(
        backgroundColor: AppPalette.iosBlue,
        appBar: AppBar(
          backgroundColor: AppPalette.iosBlue,
          elevation: 0,
          leading: BlocBuilder<BreathingBloc, BreathingState>(
            builder: (context, state) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  /*
                  if (state is BreathingRunningState ||
                      state is BreathingCompletedState) {
                    context.read<BreathingBloc>().add(StopBreathingEvent());

                  }*/
                  context.go('/navigation');
                },
              );
            },
          ),
        ),
        body: BlocBuilder<BreathingBloc, BreathingState>(
          builder: (context, state) {
            bool isExerciseActive = state is BreathingRunningState;
            String currentBreathingText = '';
            int remainingSeconds = 0;
            double scaleValue = 0.5;
            double opacityValue = 0.2;
            int selectedDurationIndexFromBloc = 0;

            if (state is BreathingRunningState) {
              currentBreathingText = _getBreathingText(state.phase);
              remainingSeconds = state.remainingSeconds;
              scaleValue = state.scaleValue;
              opacityValue = state.opacityValue;
            } else if (state is BreathingInitialState) {
              currentBreathingText = _getBreathingText(BreathingPhase.initial);
              selectedDurationIndexFromBloc = state.selectedDurationIndex;
            } else if (state is BreathingCompletedState) {
              currentBreathingText = 'اكتمل التمرين! أحسنت.';
            }

            return Column(
              children: [
                if (isExerciseActive)
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      _formatTime(remainingSeconds),
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ),

                if (!isExerciseActive && state is BreathingInitialState)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(durations.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 19,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  context.read<BreathingBloc>().add(
                                    SetDurationEvent(index),
                                  );
                                },
                                child: Text(
                                  durations[index],
                                  style: TextStyles.sf40018.copyWith(
                                    color:
                                        selectedDurationIndexFromBloc == index
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.6),
                                    fontWeight:
                                        selectedDurationIndexFromBloc == index
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            context.read<BreathingBloc>().add(
                              StartBreathingEvent(
                                selectedDurationIndexFromBloc + 1,
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.blue.shade900,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 60,
                              vertical: 12,
                            ),
                          ),
                          child: const Text(
                            'ابدأ التمرين',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentBreathingText,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 50),
                      BreathingCircle(
                        scaleValue: scaleValue,
                        opacityValue: opacityValue,
                      ),
                    ],
                  ),
                ),

                if (isExerciseActive)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<BreathingBloc>().add(StopBreathingEvent());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue.shade900,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 80,
                          vertical: 15,
                        ),
                      ),
                      child: const Text(
                        'إنهاء التمرين',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
