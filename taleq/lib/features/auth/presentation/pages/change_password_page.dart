import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/butterflay.dart';

import 'package:taleq/features/auth/presentation/bloc/auth_bloc.dart';

import 'package:taleq/features/auth/presentation/bloc/auth_state.dart';
import 'package:taleq/features/auth/presentation/widget/change_password_body.dart';

class ChangePasswordPage extends StatelessWidget {
  final String email;
  const ChangePasswordPage({super.key, required this.email});

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
              } else if (state is AuthFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
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
                          ChangePasswordBody(bloc: bloc, email: email),
                          ButterflyWidget(
                            top: context.getHeight() * 0.05,
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
