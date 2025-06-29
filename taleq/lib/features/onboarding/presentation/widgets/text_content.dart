import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/features/onboarding/data/models/onboarding_model.dart';

class TextContent extends StatelessWidget {
  const TextContent({super.key, required this.onboardingModel});
  final OnboardingModel onboardingModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(onboardingModel.title.tr(), style: TextStyles.sf60036),
          SizedBox(height: 24),
          Text(
            onboardingModel.subTitle.tr(),
            style: TextStyles.sf40018.copyWith(color: AppPalette.blackPrimary),
          ),
        ],
      ),
    );
  }
}
