import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/butterflay.dart';
import 'package:taleq/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:taleq/features/auth/presentation/bloc/auth_state.dart';
import 'package:taleq/features/auth/presentation/widget/otp_bottomsheet.dart';
import 'package:taleq/features/auth/presentation/widget/signup_body.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<AuthBloc>(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<AuthBloc>();
          return BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                final otpEmail = state.email;
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => OtpBottomSheet(email: otpEmail, bloc: bloc),
                );
              } else if (state is AuthFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              } else if (state is OTPSuccess) {
                context.go('/login');
              }
            },
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              behavior: HitTestBehavior.translucent,
              child: Scaffold(
                backgroundColor: AppPalette.blueSoft,
                body: SafeArea(
                  bottom: false,
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: context.getWidth(),
                      height: context.getHeight(),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: context.getWidth()),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: context.getWidth() * 0.04,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: context.getWidth(),
                                      height: context.getHeight() * 0.03,
                                    ),

                                    TextButton(
                                      onPressed: () {
                                        context.go('/navigation');
                                      },
                                      child: Text(
                                        AppText.continueAsGuest.tr(),
                                        style: TextStyles.sf70018.copyWith(
                                          color: AppPalette.bluePrimary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: context.getHeight() * 0.10),
                              SignUpBody(bloc: bloc),
                            ],
                          ),
                          ButterflyWidget(
                            top: -context.getHeight() * 0.04,
                            right: -context.getWidth() * 0.17,
                            angle: 1.83 * pi,
                            height: context.getHeight() * 0.15,
                            width: context.getWidth() * 0.37,
                          ),

                          Positioned(
                            top: context.getHeight() * 0.07,
                            right: context.getWidth() * 0.03,
                            child: Text(
                              AppText.welcome.tr(),
                              style: TextStyles.sf70020.copyWith(
                                color: AppPalette.black,
                                fontSize: 32,
                              ),
                            ),
                          ),
                          ButterflyWidget(
                            top: context.getHeight() * 0.09,
                            left: -context.getWidth() * 0.12,
                            angle: 0.61,
                            height: context.getHeight() * 0.15,
                            width: context.getWidth() * 0.33,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
