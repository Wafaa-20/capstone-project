import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/helper/form_validation.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/butterflay.dart';
import 'package:taleq/core/widget/button/custom_button.dart';
import 'package:taleq/core/widget/custom_text_field.dart';
import 'package:taleq/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:taleq/features/auth/presentation/bloc/auth_event.dart';
import 'package:taleq/features/auth/presentation/bloc/auth_state.dart';
import 'package:taleq/features/auth/presentation/widget/otp_bottomsheet.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

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
                context.go(
                  '/change_password?email=${bloc.emailForgetPasswordController.text}',
                );
              }
            },
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              behavior: HitTestBehavior.translucent,
              child: Scaffold(
                backgroundColor: AppPalette.blueSoft,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: AppPalette.black,
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: SizedBox(
                    width: context.getWidth(),
                    height: context.getHeight() - (context.getSafeHeight() * 2),
                    child: SafeArea(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.getWidth() * 0.08,
                            ),
                            child: Form(
                              key: bloc.forgetPasswordkey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: context.getWidth(),
                                    height: context.getHeight() * 0.12,
                                  ),
                                  Text(
                                    AppText.resetPassword,
                                    style: TextStyles.sf70020.copyWith(
                                      color: AppPalette.blackPrimary,
                                      fontSize: 26,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    AppText.resetPasswordInfo,
                                    style: TextStyles.sf40018.copyWith(
                                      color: AppPalette.blackPrimary,
                                      fontSize: 22,
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomTextField(
                                    controller:
                                        bloc.emailForgetPasswordController,
                                    labelText: AppText.email.tr(),
                                    labelstyle: TextStyles.sf70018.copyWith(
                                      color: AppPalette.blackPrimary,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: AppPalette.grayPrimary,
                                    ),
                                    hintText: AppText.email.tr(),
                                    onChanged: (p0) {
                                      if (bloc.forgetPasswordkey.currentState!
                                          .validate()) {}
                                    },
                                    validator: (p0) {
                                      return FormValidation.validateInput(
                                        p0,
                                        bloc.emailRegExp,
                                        bloc.emailInputRules.tr(),
                                      );
                                    },
                                  ),
                                  SizedBox(height: 50),
                                  Center(
                                    child: CustomButton(
                                      onPressed: () {
                                        if (bloc.forgetPasswordkey.currentState!
                                            .validate()) {
                                          bloc.add(ForgetPasswordEvent());
                                        }
                                      },
                                      child: Text(
                                        AppText.resetPassword,
                                        style: TextStyles.sf70016.copyWith(
                                          color: AppPalette.whitePrimary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ButterflyWidget(
                            top: -context.getHeight() * 0.04,
                            left: -context.getWidth() * 0.17,
                            angle: 0.23 * pi,
                            height: context.getHeight() * 0.15,
                            width: context.getWidth() * 0.37,
                          ),
                          ButterflyWidget(
                            bottom: context.getHeight() * 0.04,
                            right: context.getWidth() * 0.07,
                            angle: 1.83 * pi,
                            height: context.getEqualedWidthHeight(550),
                            width: context.getEqualedWidthHeight(500),
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
