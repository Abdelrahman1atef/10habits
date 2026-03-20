import 'package:abher/core/utils/extensions.dart';
import 'package:abher/src/feature/anchors/router/anchors_router.dart';
import 'package:abher/src/feature/home/router/home_router.dart';
import 'package:abher/src/feature/order_and_checkout/router/order_and_checkout_router.dart';
import 'package:abher/src/feature/private_order/router/private_order_router.dart';
import 'package:abher/src/feature/section/router/section_router.dart';
import 'package:abher/src/feature/chat/router/chat_router.dart';
import 'package:abher/src/feature/favourites/router/favourites_router.dart';
import 'package:abher/src/feature/notifications/router/notifications_router.dart';
import 'package:abher/src/feature/profile/router/profile_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:abher/src/feature/auth/router/auth_router.dart';
import 'package:abher/src/feature/intro/router/intro_router.dart';
import '../../src/feature/boat_details/router/boat_details_router.dart';
import '../../src/feature/book_now/router/book_now_router.dart';
import '../../src/feature/order_now/router/order_now_router.dart';
import '../../src/feature/reservation/router/reservation_router.dart';
import '../../src/feature/my_orders/router/my_orders_router.dart';
import '../../src/feature/order_details/router/order_details_router.dart';
import 'router_names.dart';

/// GoRouter configuration
class AppRouter {
  static String initialRoute = AppRoutes.orderDetails;

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: initialRoute,
    debugLogDiagnostics: true,
    observers: [BotToastNavigatorObserver(), FlutterSmartDialog.observer],
    routes: [
      // Feature Routers
      ...IntroRouter.routes,
      ...AuthRouter.routes,
      ...HomeRouter.routes,
      ...AnchorsRouter.routes,
      ...BoatDetailsRouter.routes,
      ...ReservationRouter.routes,
      ...OrderNowRouter.routes,
      ...OrderAndCheckoutRouter.routes,
      ...SectionRouter.routes,
      ...BookNowRouter.routes,
      ...PrivateOrderRouter.routes,
      ...ChatRouter.routes,
      ...FavouritesRouter.routes,
      ...NotificationsRouter.routes,
      ...ProfileRouter.routes,
      ...MyOrdersRouter.routes,
      ...OrderDetailsRouter.routes,
    ],

    // Error page
    errorPageBuilder: (context, state) {
      final ThemeData theme = Theme.of(context);
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          appBar: AppBar(title: Text('error'.tr())),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 80, color: Colors.red),
                16.ph,
                Text(
                  'page_not_found'.tr(),
                  style: theme.textTheme.headlineSmall,
                ),
                8.ph,
                Text(state.uri.toString(), style: theme.textTheme.bodySmall),
                24.ph,
                ElevatedButton(
                  onPressed: () => context.go(AppRoutes.splash),
                  child: Text('back_to_home'.tr()),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
