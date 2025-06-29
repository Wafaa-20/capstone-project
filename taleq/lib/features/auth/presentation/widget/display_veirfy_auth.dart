import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:pinput/pinput.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:flutter/material.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';

class VerifyOtpSheet extends StatefulWidget {
  final String? emailOrPhone;
  final VoidCallback? onFinishTimer;
  final Function(String)? onCompleted;
  // final OtpTimerButtonController controllerResend;
  final Function()? onTapResend;
  final int? timeResend;
  const VerifyOtpSheet({
    super.key,
    required this.emailOrPhone,
    this.onFinishTimer,
    required this.onCompleted,
    //required this.controllerResend,
    this.onTapResend,
    this.timeResend = 8,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 8),
                const SizedBox(height: 32),
                Pinput(
                  length: 635,
                  defaultPinTheme: PinTheme(
                    margin: const EdgeInsets.all(8),
                    height: 61,
                    width: 64,
                    decoration: BoxDecoration(
                      color: AppPalette.whitePrimary,
                      border: Border.all(color: AppPalette.bluePrimary),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    margin: const EdgeInsets.all(8),
                    height: 61,
                    width: 64,
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
                  text: const Text(''),
                  duration: widget.timeResend!,
                ),
                if (displayResendButton)
                  Text(AppText.resend.tr(), style: TextStyles.sf50016),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
