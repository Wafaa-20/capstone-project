import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taleq/core/dependency_injection/setup.dart';
import 'package:taleq/core/service/supabase_connect.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  log('finsh WidgetsFlutterBinding');
  await EasyLocalization.ensureInitialized();
  log('finsh EasyLocalization');
  await SupabaseConnect.init();
  log('finsh SupabaseConnect');
  await setup();
  log('finsh setup');

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('ar'), Locale('en')],
      path: 'lib/core/text/translations',
      fallbackLocale: Locale('ar'),
      startLocale: Locale('ar'),
      child: MyApp(),
    ),
  );
}
