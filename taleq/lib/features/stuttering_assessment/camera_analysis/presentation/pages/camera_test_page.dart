import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';
import 'package:taleq/core/widget/button/top_nav_actions.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/presentation/bloc/camera_analysis_bloc.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/presentation/bloc/camera_analysis_event.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/presentation/widgets/text_test_widget.dart';

class CameraTestPage extends StatelessWidget {
  const CameraTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            GetIt.I<CameraAnalysisBloc>()..add(StartCameraAnalysis()),
        child: SafeArea(
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
                Center(
                  child: Container(
                    height: 344,
                    width: 351,
                    decoration: BoxDecoration(
                      color: AppPalette.greySurface,
                      borderRadius: BorderRadius.circular(6),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset("assets/image/camera_Icon.png"),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(AppText.cameraRule.tr(), style: TextStyles.sf30016),
                Text(AppText.micRule.tr(), style: TextStyles.sf30016),
                SizedBox(height: 29),
                Text(AppText.readRule.tr(), style: TextStyles.sf40016),
                SizedBox(height: 21),
                TextTestWidget(),
                SizedBox(height: 51),
                Center(
                  child: CustomButton(
                    onPressed: () {
                      context.go('/assessmentResult');
                    },
                    child: Text(AppText.startTest.tr(), style: TextStyles.sf70020),
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
