import 'package:habits10/core/config/flavor_config.dart';
import 'package:habits10/main_common.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.DEV,
    name: "DEV",
    apiBaseUrl: "https://dev-api.example.com", // Replace with actual Dev API
    appTitle: "10Habits Dev",
  );
  mainCommon();
}
