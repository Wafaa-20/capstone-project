import 'package:flutter/material.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/features/exercises/Words_Excercise_start/presentation/widget/voice_analysis.dart';

class IntroWordsExercisePage extends StatelessWidget {
  const IntroWordsExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.bluePrimary,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 90, 40, 37),
                    child: Image.asset("assets/image/stars.png"),
                  ),
                  Text(AppText.readyToStart, style: TextStyles.sf70020),
                  const SizedBox(height: 8),
                  Text(
                    AppText.readyToStartSub,
                    style: TextStyles.sf50016.copyWith(
                      color: AppPalette.whitePrimary,
                    ),
                  ),
                  SizedBox(height: 33),
                  Center(child: VoiceAnalysis()),
                  Spacer(),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/image/Rocket.png",
                width: context.getWidth(),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
