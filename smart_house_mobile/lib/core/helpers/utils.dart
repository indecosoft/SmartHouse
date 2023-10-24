import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_cache.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/services.dart';

const List<String> _filesToWarmUp = <String>[
  'assets/flare/home_settings.flr',
  'assets/flare/search_location.flr',
  'assets/flare/add_room.flr',
  'assets/flare/no_wifi.flr',
];

/// Ensure all Flare assets used by this app are cached and ready to
/// be displayed as quickly as possible.
Future<void> warmUpFlare() async {
  for (final String filename in _filesToWarmUp) {
    await cachedActor(AssetFlare(bundle: rootBundle, name: filename));
  }
}
class Utils {
  static double getPercentValueFromScreenWidth(
      int percent, BuildContext context) {
    return percent / 100 * MediaQuery.of(context).size.width;
  }

  static double getPercentValueFromScreenHeight(
      int percent, BuildContext context) {
    return percent / 100 * MediaQuery.of(context).size.height;
  }
}
