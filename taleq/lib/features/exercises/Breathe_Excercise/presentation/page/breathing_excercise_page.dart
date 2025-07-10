// lib/breathing_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';
import 'package:taleq/features/exercises/Breathe_Excercise/presentation/bloc/breath_bloc.dart';
import 'package:taleq/features/exercises/Breathe_Excercise/presentation/bloc/breath_event.dart';
import 'package:taleq/features/exercises/Breathe_Excercise/presentation/bloc/breath_state.dart';
import 'package:taleq/features/exercises/Breathe_Excercise/presentation/widget/breathing_circle.dart';
import 'package:taleq/features/exercises/Breathe_Excercise/presentation/widget/enum.dart';

class BreathingPage extends StatelessWidget {
  const BreathingPage({Key? key}) : super(key: key);

  String _formatTime(int totalSeconds) {
    final m = totalSeconds ~/ 60;
    final s = totalSeconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
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
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final durations = ['دقيقة', 'دقيقتان', '3 دقائق'];

    return BlocProvider(
      create: (_) => BreathingBloc(),
      child: Scaffold(
        backgroundColor: AppPalette.iosBlue,
        appBar: AppBar(
          backgroundColor: AppPalette.iosBlue,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => context.go('/navigation'),
          ),
        ),
        body: BlocBuilder<BreathingBloc, BreathingState>(
          builder: (context, state) {
            final isRunning = state is BreathingRunningState;

            // بدل القيمة الافتراضية هنا
            final scaleValue = isRunning
                ? (state).scaleValue
                : 0.9; // أولي: حجم أكبر
            final opacityValue = isRunning
                ? (state).opacityValue
                : 1.0; // أولي: شفافية كاملة

            final remaining = isRunning ? (state).remainingSeconds : 0;
            final phase = isRunning ? (state).phase : BreathingPhase.initial;
            final text = isRunning ? _getBreathingText(phase) : '';
            final selected = state is BreathingInitialState
                ? state.selectedDurationIndex
                : 0;

            return Column(
              children: [
                SizedBox(height: context.getHeight() * 0.06),

                if (isRunning) ...[
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _formatTime(remaining),
                    style: TextStyles.sf40016.copyWith(
                      color: AppPalette.whitePrimary,
                    ),
                  ),
                ],

                if (!isRunning && state is BreathingInitialState) ...[
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(durations.length, (i) {
                      final sel = i == selected;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: TextButton(
                          onPressed: () => context.read<BreathingBloc>().add(
                            SetDurationEvent(i),
                          ),
                          child: Text(
                            durations[i],
                            style: TextStyles.sf40018.copyWith(
                              color: sel
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.6),
                              fontWeight: sel
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],

                SizedBox(height: context.getHeight() * 0.10),

                // هنا الدائرة الآن أكبر في البداية
                BreathingCircle(
                  scaleValue: scaleValue,
                  opacityValue: opacityValue,
                ),
                SizedBox(height: context.getHeight() * 0.15),

                if (!isRunning)
                  CustomButton(
                    color: AppPalette.whitePrimary,
                    sideColor: AppPalette.whitePrimary,
                    onPressed: () => context.read<BreathingBloc>().add(
                      StartBreathingEvent(selected + 1),
                    ),
                    child: Text(
                      AppText.startExercise,
                      style: TextStyles.sf40016.copyWith(
                        color: AppPalette.black,
                      ),
                    ),
                  ),

                if (isRunning) ...[
                  const SizedBox(height: 16),
                  CustomButton(
                    color: AppPalette.iosBlue,
                    sideColor: AppPalette.whitePrimary,
                    onPressed: () =>
                        context.read<BreathingBloc>().add(StopBreathingEvent()),
                    child: Text(
                      AppText.endExercise,
                      style: TextStyles.sf40016.copyWith(
                        color: AppPalette.whitePrimary,
                      ),
                    ),
                  ),
                ],

                const SizedBox(height: 24),
              ],
            );
          },
        ),
      ),
    );
  }
}
