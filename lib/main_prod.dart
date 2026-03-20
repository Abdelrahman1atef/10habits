import 'package:habits10/core/config/flavor_config.dart';
import 'package:habits10/main_common.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.PROD,
    name: "PROD",
    apiBaseUrl: "https://api.example.com", // Replace with actual Prod API
    appTitle: "10Habits",
  );
  mainCommon();
}
