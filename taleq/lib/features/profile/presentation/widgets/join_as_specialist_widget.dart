import 'package:flutter/material.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';
import 'package:taleq/core/widget/custom_icon.dart';

class JoinAsSpecialistWidget extends StatelessWidget {
  const JoinAsSpecialistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      height: 61,
      width: 351,
      radius: 15,
      color: AppPalette.blueLight,
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Image.asset("assets/image/specialist2.png"),
            SizedBox(width: 15),
            Text(
              AppText.joinAsSpecialist,
              style: TextStyles.sf40016.copyWith(
                color: AppPalette.whitePrimary,
              ),
            ),
            Spacer(),
            CustomIcon(icon: Icons.arrow_forward_ios, size: 15),
          ],
        ),
      ),
    );
  }
}
