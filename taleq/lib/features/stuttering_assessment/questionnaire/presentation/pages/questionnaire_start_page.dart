import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';
import 'package:taleq/core/widget/button/custom_text_button.dart';

class QuestionnaireStartPage extends StatelessWidget {
  const QuestionnaireStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: CustomTextButton(onPressed: () {}, text: AppText.back),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppText.questionnaireTitle, style: TextStyles.sf60036),
                    SizedBox(height: 24),
                    Text(
                      AppText.questionnaireSubTitle,
                      style: TextStyles.sf40018.copyWith(
                        color: AppPalette.blackPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 53),
              Image.asset("assets/image/questionnaire_start.png"),
              SizedBox(height: context.getHeight() * 0.12),
              CustomButton(
                onPressed: () {
                  context.go('/questionnaire');
                },
                child: Text(AppText.startNow, style: TextStyles.sf70020),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
