import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:pinput/pinput.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:flutter/material.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/butterflay.dart';
import 'package:taleq/core/widget/button/custom_text_button.dart';

class VerifyOtpSheet extends StatefulWidget {
  final String? emailOrPhone;
  final VoidCallback? onFinishTimer;
  final Function(String)? onCompleted;

  final Function()? onTapResend;
  final int? timeResend;
  final void Function() timerFunction;
  const VerifyOtpSheet({
    super.key,
    required this.emailOrPhone,
    this.onFinishTimer,
    required this.onCompleted,

    this.onTapResend,
    this.timeResend = 8,
    required this.timerFunction,
  });

  @override
  State<VerifyOtpSheet> createState() => _VerifyOtpSheetState();
}

class _VerifyOtpSheetState extends State<VerifyOtpSheet> {
  bool displayResendButton = false;

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: widget.timeResend! + 1), (value) {
      displayResendButton = true;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ButterflyWidget(
            top: context.getHeight() * 0.07,
            left: -context.getWidth() * 0.13,
            angle: 5.92,
            height: context.getHeight() * 0.15,
            width: context.getWidth() * 0.33,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: context.getHeight() * 0.01),
                    SizedBox(height: context.getHeight() * 0.03),
                    Pinput(
                      length: 6,
                      defaultPinTheme: PinTheme(
                        margin: const EdgeInsets.all(0.5),
                        height: context.getHeight() * 0.07,
                        width: context.getHeight() * 0.07,
                        decoration: BoxDecoration(
                          color: AppPalette.opicityWhite,
                          border: Border.all(color: AppPalette.bluePrimary),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      focusedPinTheme: PinTheme(
                        margin: const EdgeInsets.all(0.5),
                        height: context.getHeight() * 0.08,
                        width: context.getHeight() * 0.10,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppPalette.blackPrimary),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onCompleted: widget.onCompleted,
                    ),
                    const SizedBox(height: 38),
                    OtpTimerButton(
                      buttonType: ButtonType.text_button,
                      onPressed: () {},
                      text: const Text(' '),
                      duration: widget.timeResend!,
                    ),
                    if (displayResendButton)
                      CustomTextButton(
                        text: AppText.resend.tr(),
                        onPressed: widget.timerFunction,
                        styles: TextStyles.sf50016,
                      ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
          ButterflyWidget(
            top: -context.getHeight() * 0.14,
            left: -context.getWidth() * 0.12,
            angle: 0.61,
            height: context.getHeight() * 0.1125,
            width: context.getWidth() * 0.2475,
          ),
          ButterflyWidget(
            bottom: -context.getHeight() * 0.26,
            right: -context.getWidth() * 0.14,
            angle: 5.71,
            height: context.getHeight() * 0.2063,
            width: context.getWidth() * 0.454,
          ),
        ],
      ),
    );
  }
}
