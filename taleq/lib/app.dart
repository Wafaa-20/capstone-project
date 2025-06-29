import 'package:app_links/app_links.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taleq/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:taleq/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:taleq/features/auth/presentation/bloc/auth_event.dart';

import 'config/routes/app_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // final appLinks = AppLinks();
  // void initDeepLinks(BuildContext context) {
  //   appLinks.uriLinkStream.listen((Uri? uri) async {
  //     if (uri != null && uri.toString().contains('code=')) {
  //       try {
  //         final response = await Supabase.instance.client.auth
  //             .getSessionFromUrl(uri);
  //         final user = response.session.user;

  //         if (context.mounted) {
  //           context.read<AuthBloc>().add(
  //             AuthSuccessWithGoogleEvent(user: user),
  //           );
  //         }
  //       } catch (e) {
  //         if (context.mounted) {
  //           context.read<AuthBloc>().add(
  //             AuthFailureWithGoogleEvent(message: e.toString()),
  //           );
  //         }
  //       }
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppTheme.theme,
      darkTheme: AppTheme.theme,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
