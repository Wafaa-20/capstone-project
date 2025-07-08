import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';
import 'package:taleq/core/widget/button/top_nav_actions.dart';

class AssessmentResultPage extends StatelessWidget {
  const AssessmentResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              TopNavActions(
                showSkip: false,
                onPressedBack: () {
                  context.go('/questionnaire');
                },
              ),
              SizedBox(height: 29),
              Text(AppText.testDoneTitle1.tr(), style: TextStyles.sf60036),
              SizedBox(height: 24),
              Text(
                textAlign: TextAlign.center,
                AppText.testDoneSubTitle1.tr(),
                style: TextStyles.sf40018.copyWith(
                  color: AppPalette.blackPrimary,
                ),
              ),
              SizedBox(height: 24),

              Image.asset("assets/image/assessmentResult.png"),
              SizedBox(height: 24),
              Row(
                children: [
                  Text(
                    AppText.testResultTitle.tr(),
                    style: TextStyles.sf40018.copyWith(color: AppPalette.black),
                  ),
                  Container(
                    height: 36,
                    width: 71,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppPalette.blueTransparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      AppText.testResult.tr(),
                      style: TextStyles.sf40018.copyWith(
                        color: AppPalette.iosBlue,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 52),
              CustomButton(
                width: 265,
                onPressed: () {
                  context.go('/plan');
                },
                child: Text(AppText.startExercises.tr(), style: TextStyles.sf70020),
              ),
              SizedBox(height: 13),
              CustomButton(
                width: 265,
                color: AppPalette.whitePrimary,
                sideColor: AppPalette.grayPrimary,
                onPressed: () {
                  context.go('/home');
                },
                child: Text(
                  AppText.gotoHome.tr(),
                  style: TextStyles.sf70020.copyWith(
                    color: AppPalette.grayLight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
