import 'package:camera/camera.dart';
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
import 'package:taleq/features/stuttering_assessment/camera_analysis/presentation/bloc/camera_analysis_state.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/presentation/widgets/text_test_widget.dart';

class CameraTestPage extends StatelessWidget {
  const CameraTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CameraAnalysisBloc>(
      create: (_) =>
        GetIt.I<CameraAnalysisBloc>()..add(InitCamera()),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<CameraAnalysisBloc, CameraAnalysisState>(
            listener: (ctx, state) {
              if (state is RecordingCompleted) {
                // بمجرد ما يوقف التسجيل نرسل الفيديو
                ctx.read<CameraAnalysisBloc>().add(UploadVideo(state.videoFile));
              }
            },
            builder: (ctx, state) {
              // 1) الكاميرا
              Widget cameraPreview = Container(
                height: 344,
                width: 351,
                decoration: BoxDecoration(
                  color: AppPalette.greySurface,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Icon(
                    Icons.videocam_off,
                    size: 64,
                    color: Colors.white38,
                  ),
                ),
              );

              if (state is CameraReady) {
                cameraPreview = Container(
                  height: 344,
                  width: 351,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: CameraPreview(state.controller),
                  ),
                );
              }

              // 2) زرّ التسجيل/الإيقاف
              final isRecording = state is RecordingInProgress;
              final buttonLabel = isRecording ? 'إنهاء' : 'ابدأ التسجيل';
              final buttonAction = () {
                if (isRecording) {
                  ctx.read<CameraAnalysisBloc>().add(StopVideoRecording());
                } else {
                  ctx.read<CameraAnalysisBloc>().add(StartVideoRecording());
                }
              };

              return Padding(
                padding: const EdgeInsets.all(21.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopNavActions(
                      onPressedSkip: () => context.go('/navigation'),
                      onPressedBack: () => context.go('/questionnaire'),
                    ),
                    const SizedBox(height: 21),
                    Center(child: cameraPreview),
                    const SizedBox(height: 5),
                    Text(AppText.cameraRule, style: TextStyles.sf30016),
                    Text(AppText.micRule, style: TextStyles.sf30016),
                    const SizedBox(height: 29),
                    Text(AppText.readRule, style: TextStyles.sf40016),
                    const SizedBox(height: 21),
                    const TextTestWidget(),
                    const Spacer(),
                    Center(
                      child: CustomButton(
                        onPressed: buttonAction,
                        child: Text(buttonLabel, style: TextStyles.sf70020),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
