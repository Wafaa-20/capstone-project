import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';
import 'package:taleq/core/widget/button/top_nav_actions.dart';

class CameraStartPage extends StatelessWidget {
  const CameraStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TopNavActions(
                onPressedSkip: () {
                  context.go('/navigation');
                },
                onPressedBack: () {
                  context.go('/cameraAnalysis');
                },
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 29),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppText.cameraTestTitle.tr(),
                      style: TextStyles.sf60036,
                    ),
                    SizedBox(height: 24),
                    Text(
                      AppText.cameraTestSubTitle.tr(),
                      style: TextStyles.sf40018.copyWith(
                        color: AppPalette.blackPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 53),
              Image.asset("assets/image/camera.png"),
              SizedBox(height: context.getHeight() * 0.12),
              CustomButton(
                onPressed: () {
                  context.go('/cameraAnalysis');
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
