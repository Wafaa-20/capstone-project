import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';
import 'package:taleq/core/widget/custom_bottom_sheet.dart';
import 'package:taleq/features/payment/presentation/widgets/add_new_card.dart';
import 'package:taleq/features/payment/presentation/widgets/select_payment.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppText.selectPaymentMethod, style: TextStyles.sf70035),
          SizedBox(height: 30),
          SelectPayment(
            text: AppText.applePay,
            image: 'assets/image/pay.png',
            onTap: () {
              log("APPLE PAY");
            },
          ),
          SizedBox(height: 20),
          SelectPayment(
            text: AppText.addNewCard,
            textStyle: TextStyles.sf50018.copyWith(color: AppPalette.black),
            image: 'assets/image/add_card.png',
            withIcon: true,
            onTap: () {
              customBottomSheet(
                context,
                height: context.getHeight() * 0.55,
                AddNewCard(),
              );
              log("PAY");
            },
          ),

          SizedBox(height: 60),
          CustomButton(
            height: 50,
            radius: 12,
            width: context.getWidth(),
            onPressed: () {},

            child: Text(
              AppText.payNow,
              style: TextStyles.sf60018.copyWith(
                color: AppPalette.whitePrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
