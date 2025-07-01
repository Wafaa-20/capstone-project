import 'package:flutter/material.dart';
import 'package:moyasar/moyasar.dart';
import 'package:taleq/core/extension/navigation.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/widget/button/custom_icon_button.dart';

class AddNewCard extends StatelessWidget {
  const AddNewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Row(
            children: [
              CustomIconButton(
                icon: Icons.arrow_back_ios,
                onPressed: () => context.customPop(),
              ),

              Text(AppText.addNewCard, style: TextStyles.sf70030),
            ],
          ),
          const SizedBox(height: 35),

          CreditCard(
            locale: const Localization.ar(),
            config: paymentConfig(47),
            onPaymentResult: (PaymentResponse value) async {},
          ),
        ],
      ),
    );
  }
}

PaymentConfig paymentConfig(int amount) {
  return PaymentConfig(
    publishableApiKey: 'pk_test_jWGJ6kmumCx5FwyJVPDknDr5qP3VsWFJFsGWxY1Y',
    amount: amount,
    description: 'order #1324',
  );
}
