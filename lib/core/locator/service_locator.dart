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
import 'package:habits10/src/features/intro/di/intro_di.dart';

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
  }
}
