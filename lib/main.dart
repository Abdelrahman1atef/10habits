import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habits10/core/locator/service_locator.dart';
import 'package:habits10/core/theme/theme_manager.dart';
import 'package:habits10/src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await AppThemeManager.instance.initialize();
  await ServiceLocator.init(); // <- Add this

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/translation', // Path must match the folder name exactly
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      child: const Habits10(),
    ),
  );
}
