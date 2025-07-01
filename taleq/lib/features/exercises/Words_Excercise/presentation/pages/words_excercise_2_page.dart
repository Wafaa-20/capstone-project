import 'package:flutter/material.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';

class WordsExcercise2Page extends StatelessWidget {
  const WordsExcercise2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.iosRed,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppText.talkExr, style: TextStyles.sf70020),

                Text(
                  AppText.talkExrSub,
                  style: TextStyles.sf70016.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppPalette.whitePrimary,
                  ),
                ),
                SizedBox(height: 24),
                Center(
                  child: CustomButton(
                    onPressed: () {},
                    color: AppPalette.whiteLight,
                    sideColor: AppPalette.whiteLight,
                    child: Text(AppText.start, style: TextStyles.sf70016),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
