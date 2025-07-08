import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';

class PaymentText extends StatelessWidget {
  const PaymentText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
      height: 87,
      width: context.getWidth(),
      decoration: BoxDecoration(
        color: AppPalette.bluePrimary,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppPalette.whiteLight, width: 3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppText.taskSuccessBilling.tr(),
                style: TextStyles.sf60018.copyWith(
                  color: AppPalette.whitePrimary,
                ),
              ),
              SizedBox(height: 8),
              Text(
                AppText.taskSuccessTrial.tr(),
                style: TextStyles.sf50014.copyWith(
                  color: AppPalette.whitePrimary,
                ),
              ),
            ],
          ),
          Text(
            AppText.taskSuccessPrice.tr(),
            style: TextStyles.sf60018.copyWith(color: AppPalette.whitePrimary),
          ),
        ],
      ),
    );
  }
}
