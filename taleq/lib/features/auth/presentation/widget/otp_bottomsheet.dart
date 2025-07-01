import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';
import 'package:taleq/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:taleq/features/auth/presentation/bloc/auth_event.dart';
import 'package:taleq/features/auth/presentation/widget/display_veirfy_auth.dart';

class OtpBottomSheet extends StatelessWidget {
  const OtpBottomSheet({super.key, required this.email, required this.bloc});
  final String email;
  final AuthBloc bloc;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.65,
      minChildSize: 0.5,
      expand: false,
      builder: (_, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: AppPalette.blueSoft,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.all(24),
            children: [
              const SizedBox(height: 20),
              Text(AppText.otpTitle, style: TextStyles.sf60024),
              const SizedBox(height: 12),
              Text(AppText.otpSubTitle, style: TextStyles.sf40018),
              const SizedBox(height: 20),
              VerifyOtpSheet(
                emailOrPhone: email,
                onCompleted: (code) {
                  bloc.add(OTPVervy(email: email, code: code));
                },
                timerFunction: () {
                  bloc.add(ResendOTPEvent(email));
                },
                timeResend: 30,
              ),
              const SizedBox(height: 32),
              Center(
                child: CustomButton(
                  width: 200,
                  height: 44,
                  color: AppPalette.bluePrimary,
                  onPressed: () {},
                  child: Text(AppText.ok.tr(), style: TextStyles.sf70018),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
