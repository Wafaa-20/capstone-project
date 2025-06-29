import 'package:flutter/material.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';

class TopNavActions extends StatelessWidget {
  const TopNavActions({
    super.key,
    this.onPressedBack,
    this.onPressedSkip,
    this.showBack = true,
    this.showSkip = true,
  });
  final void Function()? onPressedBack;
  final void Function()? onPressedSkip;
  final bool showBack;
  final bool showSkip;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        showBack
            ? TextButton(
                onPressed: onPressedBack,
                child: Text(AppText.back, style: TextStyles.sf40018),
              )
            : const SizedBox(),

        showSkip
            ? TextButton(
                onPressed: onPressedSkip,
                child: Text(AppText.skip, style: TextStyles.sf40018),
              )
            : const SizedBox(),
      ],
    );
  }
}
