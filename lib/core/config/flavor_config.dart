enum Flavor { DEV, PROD }

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final String apiBaseUrl;
  final String appTitle;

  static FlavorConfig? _instance;

  factory FlavorConfig({
    required Flavor flavor,
    required String name,
    required String apiBaseUrl,
    required String appTitle,
  }) {
    _instance ??= FlavorConfig._internal(flavor, name, apiBaseUrl, appTitle);
    return _instance!;
  }

  FlavorConfig._internal(
    this.flavor,
    this.name,
    this.apiBaseUrl,
    this.appTitle,
  );

  static bool get isInitialized => _instance != null;

  static FlavorConfig get instance {
    if (_instance == null) {
      // Return a safe default instead of crashing with !
      return FlavorConfig._internal(
        Flavor.DEV,
        'DEV',
        'https://api.example.com',
        '10Habits',
      );
    }
    return _instance!;
  }

  static bool get isProduction => _instance?.flavor == Flavor.PROD;
  static bool get isDevelopment => _instance?.flavor == Flavor.DEV;
}
