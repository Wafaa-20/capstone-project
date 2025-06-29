import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';
import 'package:taleq/features/onboarding/data/models/onboarding_model.dart';
import 'package:taleq/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:taleq/features/onboarding/presentation/bloc/onboarding_event.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({
    super.key,
    required this.bloc,
    required this.onboardingModel,
    required this.isLastPage,
  });
  final OnboardingBloc bloc;
  final OnboardingModel onboardingModel;
  final bool isLastPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 42),
        CustomButton(
          onPressed: () {
            isLastPage
                ? bloc.add(CompleteOnboardingEvent())
                : bloc.add(NextPageEvent());
          },
          child: Text(onboardingModel.btnText.tr(), style: TextStyles.sf70020),
        ),
        SizedBox(height: 13),
        isLastPage
            ? CustomButton(
                color: AppPalette.whitePrimary,
                sideColor: AppPalette.grayPrimary,
                onPressed: () {
                  bloc.add(CompleteOnboardingEvent());
                },
                child: Text(
                  AppText.skip.tr(),
                  style: TextStyles.sf70020.copyWith(
                    color: AppPalette.grayLight,
                  ),
                ),
              )
            : SizedBox(height: 52),
      ],
    );
  }
}
