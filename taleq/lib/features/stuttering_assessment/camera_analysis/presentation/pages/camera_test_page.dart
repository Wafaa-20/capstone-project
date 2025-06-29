import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/widget/button/custom_button.dart';
import 'package:taleq/core/widget/button/top_nav_actions.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/presentation/widgets/text_test_widget.dart';

class CameraTestPage extends StatelessWidget {
  const CameraTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(21.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopNavActions(
                onPressedSkip: () {
                  context.go('/');
                },
                onPressedBack: () {
                  context.go('/questionnaire');
                },
              ),
              SizedBox(height: 21),
              Placeholder(fallbackHeight: 344, fallbackWidth: 351),
              SizedBox(height: 5),
              Text(AppText.cameraRule, style: TextStyles.sf30016),
              Text(AppText.micRule, style: TextStyles.sf30016),
              SizedBox(height: 29),
              Text(AppText.readRule, style: TextStyles.sf40016),
              SizedBox(height: 21),
              TextTestWidget(),
              SizedBox(height: 51),
              Center(
                child: CustomButton(
                  onPressed: () {
                    context.go('/assessmentResult');
                  },
                  child: Text(AppText.startTest, style: TextStyles.sf70020),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
