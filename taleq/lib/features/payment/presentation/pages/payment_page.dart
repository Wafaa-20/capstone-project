import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:taleq/features/payment/presentation/widgets/payment_button.dart';
import 'package:taleq/features/payment/presentation/widgets/payment_text.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentBloc(),
      child: Builder(
        builder: (context) {
          final PaymentBloc bloc = context.read<PaymentBloc>();
          return Scaffold(
            backgroundColor: AppPalette.bluePrimary,
            body: SafeArea(
              bottom: false,
              top: false,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 90, 40, 37),
                          child: Image.asset("assets/image/stars.png"),
                        ),
                        Text(AppText.todayTaskTitle, style: TextStyles.sf70020),
                        const SizedBox(height: 16),
                        Text(
                          AppText.todayTaskSubtitle,
                          style: TextStyles.sf50016.copyWith(
                            color: AppPalette.whitePrimary,
                          ),
                        ),
                        SizedBox(height: 33),
                        PaymentText(),
                        SizedBox(height: 32),
                        Center(child: PaymentButton()),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      "assets/image/Rocket.png",
                      width: context.getWidth(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
