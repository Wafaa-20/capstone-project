import 'dart:async';
import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
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
    _sub = appLinks.uriLinkStream.listen((uri) async {
      await _handleAuthCallback(uri);
    });
    _handleInitialDeepLink();
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  Future<void> _handleInitialDeepLink() async {
    final initialUri = await appLinks.getInitialLink();
    await _handleAuthCallback(initialUri);
  }

  Future<void> _handleAuthCallback(Uri? uri) async {
    if (uri != null && uri.queryParameters.containsKey('code')) {
      try {
        final session = await Supabase.instance.client.auth.currentSession;
        log(session.toString());
        if (session == null || session.user == null) {
          // لم يتم تسجيل الدخول
          context.read<SplashBloc>().add(CheckFirstTimeUserEvent());
          return;
        }
        final user = session?.user;

        if (user != null && mounted) {
          context.read<SplashBloc>().add(
            AuthSuccessWithGoogleEvent(user: user),
          );
          return;
        }
      } catch (e) {
        print(" recoverSessionFromUrl failed: $e");
      }
    }

    if (mounted) {
      context.read<SplashBloc>().add(CheckFirstTimeUserEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is FirstTimeUseApp) {
          context.go('/onboarding');
        } else if (state is NotFirstTimeUseApp) {
          context.go('/signup');
        } else if (state is AuthSuccess) {
          context.go('/home');
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
