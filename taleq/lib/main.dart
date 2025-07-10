import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taleq/core/dependency_injection/setup.dart';
import 'package:taleq/core/service/supabase_connect.dart';
import 'package:taleq/features/profile/data/models/user_profile/user_profile_model.dart';
import 'package:taleq/features/specialists/data/models/specialists_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();
  await SupabaseConnect.init();
  await setup();
  SpecialistsModelMapper.ensureInitialized();
  UserProfileModelMapper.ensureInitialized();

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
