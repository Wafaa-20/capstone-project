import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';

class CustomButtonText extends StatelessWidget {
  const CustomButtonText({
    super.key,
    this.text,
    this.clickableText,
    this.clickFunction,
  });
  final String? text;
  final String? clickableText;
  final void Function()? clickFunction;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text,

        style: TextStyles.sf50016.copyWith(color: AppPalette.black),
        children: [
          TextSpan(
            text: clickableText,
            style: TextStyles.sf50016.copyWith(color: AppPalette.bluePrimary),
            recognizer: TapGestureRecognizer()..onTap = clickFunction,
          ),
        ],
      ),
    );
  }
}
