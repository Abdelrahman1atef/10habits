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

  static FlavorConfig get instance {
    return _instance!;
  }

  static bool get isProduction => _instance?.flavor == Flavor.PROD;
  static bool get isDevelopment => _instance?.flavor == Flavor.DEV;
}
