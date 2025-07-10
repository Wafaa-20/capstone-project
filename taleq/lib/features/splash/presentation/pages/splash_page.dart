import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:taleq/core/service/deep_link_service.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:taleq/features/splash/presentation/bloc/splash_event.dart';
import 'package:taleq/features/splash/presentation/bloc/splash_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final AppLinks appLinks = AppLinks();
  late final StreamSubscription<Uri?> _sub;
  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(InitAppEvent());
    _sub = appLinks.uriLinkStream.listen((uri) {
      if (mounted) {
        handleAuthCallback(uri, context);
      }
    });
    handleInitialDeepLink(context);
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is FirstTimeUseApp) {
          context.go('/onboarding');
        } else if (state is NotFirstTimeUseApp) {
          context.go('/login');
        } else if (state is AuthSuccess) {
          context.go('/navigation');
        }
      },
      child: Scaffold(
        backgroundColor: AppPalette.bluePrimary,
        body: Center(
          child: Lottie.asset(
            'assets/json/logo_splash.json',
            width: 130,
            height: 76,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
