import 'package:flutter/material.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.dividerText=''});
  final String dividerText;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: context.getWidth(),
          height: 2,
          decoration: BoxDecoration(color: AppPalette.black),
        ),
        Positioned(
          top: -context.getHeight() * 0.03,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: context.getWidth() * 0.35,
              height: context.getHeight() * 0.06,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: AppPalette.whitePrimary),
              child: Text(
                dividerText,
                style: TextStyles.sf70016.copyWith(color: AppPalette.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
