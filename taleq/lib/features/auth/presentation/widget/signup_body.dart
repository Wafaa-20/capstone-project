import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/helper/form_validation.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_button.dart';
import 'package:taleq/core/widget/custom_text_field.dart';
import 'package:taleq/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:taleq/features/auth/presentation/bloc/auth_event.dart';
import 'package:taleq/features/auth/presentation/bloc/auth_state.dart';
import 'package:taleq/features/auth/presentation/widget/custom_button_text.dart';
import 'package:taleq/features/auth/presentation/widget/custom_divider.dart';
import 'package:taleq/features/auth/presentation/widget/social_auth.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key, required this.bloc});
  final AuthBloc bloc;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.getWidth() * 0.06,
              ),
              child: Form(
                key: bloc.signUpkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: context.getHeight() * 0.02),
                    Text(
                      AppText.createAccount.tr(),
                      style: TextStyles.sf70020.copyWith(
                        fontSize: 24,
                        color: AppPalette.black,
                      ),
                    ),
                    SizedBox(height: context.getHeight() * 0.01),

                    CustomTextField(
                      controller: bloc.userNameSignupController,
                      labelText: AppText.username.tr(),
                      hintText: AppText.username.tr(),
                      hintstyle: TextStyles.sf50016.copyWith(
                        color: AppPalette.grayPrimary,
                      ),
                      labelstyle: TextStyles.sf50016.copyWith(
                        color: AppPalette.black,
                      ),
                      prefixIcon: Icon(Icons.person_2),
                      validator: (p0) {
                        return FormValidation.validateInput(
                          p0,
                          bloc.usernameRegExp,
                          bloc.usernameInputRules.tr(),
                        );
                      },
                      fieldKey: bloc.signUpNameKey,
                      onChanged: (p0) {
                        if (bloc.signUpNameKey.currentState!.validate()) {}
                      },
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      controller: bloc.emailSignupController,
                      labelText: AppText.email.tr(),
                      hintText: AppText.email.tr(),
                      hintstyle: TextStyles.sf50016.copyWith(
                        color: AppPalette.grayPrimary,
                      ),
                      labelstyle: TextStyles.sf50016.copyWith(
                        color: AppPalette.black,
                      ),
                      prefixIcon: Icon(Icons.email),
                      validator: (p0) {
                        return FormValidation.validateInput(
                          p0,
                          bloc.emailRegExp,
                          bloc.emailInputRules.tr(),
                        );
                      },
                      fieldKey: bloc.signUpEmailKey,
                      onChanged: (p0) {
                        if (bloc.signUpEmailKey.currentState!.validate()) {}
                      },
                    ),
                    SizedBox(height: 10),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return CustomTextField(
                          controller: bloc.passwordSignupController,
                          labelText: AppText.password.tr(),
                          hintText: AppText.password.tr(),
                          hintstyle: TextStyles.sf50016.copyWith(
                            color: AppPalette.grayPrimary,
                          ),
                          labelstyle: TextStyles.sf50016.copyWith(
                            color: AppPalette.black,
                          ),
                          prefixIcon: Icon(Icons.lock),
                          obscureText: !state.isPasswordVisible,
                          suffixIcon: IconButton(
                            onPressed: () {
                              bloc.add(TogglePasswordVisibility());
                            },
                            icon: Icon(Icons.visibility_outlined),
                          ),
                          fieldKey: bloc.signUpPasswordKey,
                          validator: (p0) {
                            return FormValidation.validateInput(
                              p0,
                              bloc.passwordRegExp,
                              bloc.passwordInputRules.tr(),
                            );
                          },
                          onChanged: (p0) {
                            if (bloc.signUpPasswordKey.currentState!
                                .validate()) {}
                          },
                        );
                      },
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(width: context.getWidth()),
                        TextButton(
                          onPressed: () {
                            context.push('/forget_password');
                          },
                          child: Text(
                            AppText.forgetMyPassword.tr(),
                            style: TextStyles.sf70016.copyWith(
                              color: AppPalette.bluePrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: context.getWidth(),
                          height: context.getHeight() * 0.03,
                        ),

                        CustomButton(
                          width: context.getWidth() * 0.50,
                          height: context.getHeight() * 0.04,
                          color: AppPalette.bluePrimary,
                          onPressed: () {
                            if (bloc.signUpkey.currentState!.validate()) {
                              bloc.add(SignUpEvent());
                            }
                          },
                          child: Text(
                            AppText.registertion.tr(),
                            style: TextStyles.sf70020.copyWith(
                              color: AppPalette.whitePrimary,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        SizedBox(height: context.getHeight() * 0.03),
                        CustomButtonText(
                          clickableText: AppText.login.tr(),
                          text: AppText.doYouHaveAccount.tr(),
                          clickFunction: () {
                            context.go('/login');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: context.getHeight() * 0.07),
            CustomDivider(dividerText: AppText.registertionBy.tr()),
            SizedBox(height: 40),
            SocialAuth(
              icons: [
                Image.asset(
                  'assets/image/apple.png',
                  width: context.getEqualedWidthHeight(90),
                  height: context.getEqualedWidthHeight(90),
                ),
                Image.asset(
                  'assets/image/Google.webp',
                  width: context.getEqualedWidthHeight(90),
                  height: context.getEqualedWidthHeight(90),
                ),
              ],
              onPressedList: [
                () {
                  //bloc.add(SignUpWithAppleEvent());
                },
                () {
                  bloc.add(SignUpWithGoogleEvent());
                },
              ],
              spacing: 40,
            ),
          ],
        ),
      ),
    );
  }
}
