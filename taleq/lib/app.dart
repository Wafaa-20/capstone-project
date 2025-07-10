import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:taleq/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:taleq/features/navigation/presentation/bloc/navigation_bloc.dart';
import 'package:taleq/features/plan/presentation/bloc/plan_bloc.dart';
import 'core/config/routes/app_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => PlanBloc()),BlocProvider(create: (_) => NavigationBloc())],
      child: MaterialApp.router(
        title: 'Flutter App',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: AppTheme.theme,
        darkTheme: AppTheme.theme,
        themeMode: ThemeMode.system,
        routerConfig: router,
      ),
    );
  }
}
