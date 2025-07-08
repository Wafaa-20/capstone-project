import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';

class WordsExerciseStartPage extends StatelessWidget {
  const WordsExerciseStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.iosRed,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppText.talkExrTitle.tr(), style: TextStyles.sf70020),
              SizedBox(height: 16),
              Text(
                AppText.talkExrSub.tr(),
                style: TextStyles.sf50016.copyWith(
                  color: AppPalette.whitePrimary,
                ),
              ),
              SizedBox(height: 80),
              Center(
                child: CustomButton(
                  onPressed: () {
                    context.go('/words');
                  },

                  color: AppPalette.whiteLight,
                  sideColor: AppPalette.whiteLight,
                  child: Text(AppText.start.tr(), style: TextStyles.sf70016),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
