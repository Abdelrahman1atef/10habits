import 'package:easy_localization/easy_localization.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:habits10/core/Router/app_router.dart';
import 'package:habits10/core/common/widgets/layout/Habits_responsive_wrapper.dart';
import 'package:habits10/core/config/flavor_config.dart';
import 'package:habits10/core/theme/theme_manager.dart';

class Habits10 extends StatelessWidget {
  const Habits10({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: AppThemeManager.instance.themeNotifier,
      builder: (context, themeMode, child) {
        return MaterialApp.router(
          title: FlavorConfig.instance.appTitle,
          debugShowCheckedModeBanner: false,
          theme: AppThemeManager.getThemeData(Brightness.light, context.locale),
          darkTheme: AppThemeManager.getThemeData(Brightness.dark, context.locale),
          themeMode: themeMode,
          routerConfig: AppRouter.router,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          builder: (context, child) {
            child = BotToastInit()(context, child);
            child = FlutterSmartDialog.init()(context, child);
            return AppResponsiveWrapper(child: child);
          },
        );
      },
    );
  }
}
