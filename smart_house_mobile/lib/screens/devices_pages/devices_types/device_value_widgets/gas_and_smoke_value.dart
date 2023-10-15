import 'package:Homey/design/colors.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GasAndSmokeValue extends StatelessWidget {
  const GasAndSmokeValue({super.key, this.gas = 0, this.smoke = 0});

  final int gas;
  final int smoke;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: ClipOval(
        child: Container(
          color: ColorsTheme.backgroundDarker.withOpacity(0.7),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  gas > 50 || smoke > 50
                      ? MdiIcons.alertOutline
                      : MdiIcons.emoticonHappyOutline,
                  size: 32,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Smoke: $smoke',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sriracha',
                          fontSize: 32),
                    ),
                    Text(
                      'Gas: $gas',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sriracha',
                          fontSize: 32),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
