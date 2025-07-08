import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';
import 'package:taleq/core/widget/custom_bottom_sheet.dart';
import 'package:taleq/features/payment/presentation/widgets/bottom_sheet_body.dart'
    show BottomSheetBody;

class PaymentButton extends StatelessWidget {
  const PaymentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          color: AppPalette.whiteLight,
          onPressed: () {
            customBottomSheet(context, BottomSheetBody());
          },
          child: Text(
            AppText.startFree.tr(),
            style: TextStyles.sf60018.copyWith(color: AppPalette.black),
          ),
        ),
        SizedBox(height: 16),
        CustomButton(
          sideColor: AppPalette.whiteLight,
          onPressed: () {},
          child: Text(
            AppText.backHome.tr(),
            style: TextStyles.sf40016.copyWith(color: AppPalette.whitePrimary),
          ),
        ),
      ],
    );
  }
}
