import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:moyasar/moyasar.dart';
import 'package:taleq/core/extension/navigation.dart';
import 'package:taleq/core/service/notification_service.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/widget/button/custom_icon_button.dart';
import 'package:taleq/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:taleq/features/payment/presentation/bloc/payment_event.dart';

class AddNewCard extends StatelessWidget {
  const AddNewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentBloc bloc = context.read<PaymentBloc>();
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
            config: paymentConfig(4799),
            onPaymentResult: (PaymentResponse result) async {
              log(result.status.toString());
              showToast(context, result.status.name);
              switch (result.status) {
                case PaymentStatus.paid:
                  bloc.add(SendNotification());
                  break;
                case PaymentStatus.failed:
                  log('hereo');
                  context.read<PaymentBloc>().add(SendNotification());
                  break;
                case PaymentStatus.authorized:
                  context.read<PaymentBloc>().add(SendNotification());
                  break;
                default:
              }
            },
          ),
        ],
      ),
    );
  }
}

PaymentConfig paymentConfig(int amount) {
  return PaymentConfig(
    publishableApiKey: dotenv.env['publishableApiKey'].toString(),
    amount: amount,
    description: 'order #1324',
  );
}

void showToast(context, status) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("Status: $status", style: const TextStyle(fontSize: 20)),
    ),
  );
}
