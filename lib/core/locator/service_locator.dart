import 'package:abher/src/feature/anchors/di/anchors_di.dart';
import 'package:get_it/get_it.dart';

import '../network/impl/dio_consumer.dart';
import '../network/config/network_config.dart';
import '../network/interceptors/auth_interceptor.dart';
import '../network/interfaces/api_consumer.dart';
import '../network/interfaces/network_info.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../cache/hive_service.dart';
import '../cache/init_hive.dart';
import '../cache/cache_helper.dart';

// Import feature DI setups
import 'package:abher/src/feature/intro/di/intro_di.dart';
import 'package:abher/src/feature/auth/di/auth_di.dart';
import 'package:abher/src/feature/home/di/home_di.dart';
import 'package:abher/src/feature/chat/di/chat_di.dart';
import 'package:abher/src/feature/favourites/di/favourites_di.dart';
import 'package:abher/src/feature/notifications/di/notifications_di.dart';
import 'package:abher/src/feature/profile/di/profile_di.dart';
import 'package:abher/src/feature/my_orders/di/my_orders_di.dart';
import 'package:abher/src/feature/order_details/di/order_details_di.dart';

/// Global service locator instance
final GetIt sl = GetIt.instance;

/// Service locator setup class
class ServiceLocator {
  /// Initialize all core services
  static Future<void> init() async {
    // Initialize Hive and Cache first
    await HiveInit.init();
    await CacheHelper.init();

    // Register core services
    sl.registerLazySingleton<HiveService>(() => HiveService());

    // Register network services
    sl.registerLazySingleton<NetworkConfig>(() => NetworkConfig.development);

    sl.registerLazySingleton<AuthInterceptor>(() => AuthInterceptor());

    sl.registerLazySingleton<DioConsumer>(
      () => DioConsumer(
        config: sl<NetworkConfig>(),
        authInterceptor: sl<AuthInterceptor>(),
        networkInfo: sl<NetworkInfo>(),
      ),
    );

    sl.registerLazySingleton<ApiConsumer>(() => sl<DioConsumer>());

    // Register NetworkInfo
    sl.registerLazySingleton<InternetConnection>(() => InternetConnection());
    sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(sl<InternetConnection>()),
    );

    // Register feature services
    IntroDI.setup();
    AuthDI.setup();
    HomeDI.setup();
    ChatDI.setup();
    FavouritesDI.setup();
    NotificationsDI.setup();
    AnchorsDI.setup();
    ProfileDI.setup();
    MyOrdersDI.setup();
    OrderDetailsDI.setup();
  }
}
