import 'package:habits10/core/config/flavor_config.dart';
import 'package:habits10/main_common.dart';

Future<void> main() async {
  FlavorConfig(
    flavor: Flavor.DEV,
    name: "DEV",
    apiBaseUrl: "https://dev-api.example.com", // Replace with actual Dev API
    appTitle: "10Habits Dev",
  );
  await mainCommon();
}
