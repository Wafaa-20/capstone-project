import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/features/exercises/presentation/bloc/cubit/task_success_cubit.dart';
import 'package:taleq/features/exercises/presentation/confetti_effect_widget.dart';

class TaskSuccessPage extends StatelessWidget {
  const TaskSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskSuccessCubit()..triggerConfetti(),
      child: BlocConsumer<TaskSuccessCubit, TaskSuccessState>(
        listener: (context, state) {
          if (state is TaskSuccessNavigate) {
            context.go('/navigation');
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  ConfettiEffectWidget(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: AppPalette.greenSuccess,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check,
                          color: AppPalette.whitePrimary,
                          weight: 10,
                          size: 70,
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(AppText.taskSuccessTitle, style: TextStyles.sf60018),
                      SizedBox(height: 49),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
