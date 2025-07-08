import 'dart:async';
import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taleq/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:taleq/features/splash/presentation/bloc/splash_event.dart';

final AppLinks appLinks = AppLinks();

Future<void> handleInitialDeepLink(BuildContext context) async {
  final initialUri = await appLinks.getInitialLink();
  if (context.mounted) {
    await handleAuthCallback(initialUri, context);
  }
}

Future<void> handleAuthCallback(Uri? uri, BuildContext context) async {
  final session = Supabase.instance.client.auth.currentSession;

  if (uri != null && uri.queryParameters.containsKey('code')) {
    try {
      if (session?.user != null && context.mounted) {
        context.read<SplashBloc>().add(
          AuthSuccessWithGoogleEvent(user: session!.user),
        );
      } else if (context.mounted) {
        context.read<SplashBloc>().add(CheckFirstTimeUserEvent());
      }
    } catch (e) {
      log("recoverSessionFromUrl failed: $e");
    }
  } else {
    await Future.delayed(Duration(seconds: 2));
    if (context.mounted) {
      if (session != null) {
        context.go('/navigation');
      } else {
        context.read<SplashBloc>().add(CheckFirstTimeUserEvent());
      }
    }
  }
}
