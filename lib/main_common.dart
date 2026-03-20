import 'package:habits10/core/theme/theme_manager.dart';
import 'package:habits10/core/locator/service_locator.dart';
import 'package:habits10/src/app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<void> mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await AppThemeManager.instance.initialize();
  await ServiceLocator.init();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/translation',
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      child: const Habits10(),
    ),
  );
}
