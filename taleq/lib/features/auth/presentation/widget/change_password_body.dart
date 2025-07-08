import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({
    super.key,
    required this.bloc,
    required this.email,
  });
  final AuthBloc bloc;
  final String email;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.getWidth() * 0.08),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Form(
            key: bloc.changePasswordkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: context.getWidth(),
                  height: context.getHeight() * 0.12,
                ),
                Text(
                  AppText.resetPassword.tr(),
                  style: TextStyles.sf70020.copyWith(
                    color: AppPalette.blackPrimary,
                    fontSize: 26,
                  ),
                ),
                SizedBox(height: 15),
                CustomTextField(
                  controller: bloc.passwordChangePasswordController,
                  labelText: AppText.nowPassword.tr(),
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
                  fieldKey: bloc.changePasswordPasswordKey,
                  validator: (p0) {
                    return FormValidation.validateInput(
                      p0,
                      bloc.passwordRegExp,
                      bloc.passwordInputRules.tr(),
                    );
                  },
                  onChanged: (p0) {
                    if (bloc.changePasswordPasswordKey.currentState!
                        .validate()) {}
                  },
                ),
                CustomTextField(
                  controller: bloc.passwordConfrimChangePasswordController,
                  labelText: AppText.confrimPassword.tr(),
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
                  fieldKey: bloc.changePasswordConfrimKey,
                  validator: (p0) {
                    return FormValidation.confirmPassword(
                      password:
                          bloc.passwordConfrimChangePasswordController.text,
                      confirmPassword:
                          bloc.passwordChangePasswordController.text,
                      patternRules: bloc.passwordInputRules.tr(),
                    );
                  },
                  onChanged: (p0) {
                    if (bloc.changePasswordConfrimKey.currentState!
                        .validate()) {}
                  },
                ),

                SizedBox(height: 50),
                Center(
                  child: CustomButton(
                    onPressed: () {
                      bloc.add(ChangePasswordEvent(email: email));
                    },
                    child: Text(
                      AppText.resetPassword.tr(),
                      style: TextStyles.sf70016.copyWith(
                        color: AppPalette.whitePrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
