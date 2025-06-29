import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/custom_text_field.dart';
import 'package:taleq/features/auth/presentation/bloc/auth_bloc.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<AuthBloc>(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<AuthBloc>();
          return Scaffold(
            backgroundColor: AppPalette.blueSoft,
            body: SafeArea(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.getWidth() * 0.08,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: context.getWidth(),
                          height: context.getHeight() * 0.15,
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
                        SizedBox(height: 50),
                        CustomTextField(
                          controller: bloc.emailForgetPasswordController,
                          labelText: AppText.email.tr(),
                          labelstyle: TextStyles.sf70018.copyWith(
                            color: AppPalette.blackPrimary,
                          ),
                        ),
                      ],
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
