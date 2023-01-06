import 'package:app/app.dart';
import 'package:app/flavors/flavor.dart';
import 'package:app/flavors/flavor_config.dart';
import 'package:app/flavors/flavor_values.dart';
import 'package:app/secrets/app_secrets.dart';

void main() {
  FlavorConfig.initialize(
    flavor: Flavor.prod,
    values: const FlavorValues(
      apiBaseUrl: "https://v2.jokeapi.dev/joke/",
      secrets: AppSecrets.appSecretsProd,
    ),
  );
  startApp();
}
