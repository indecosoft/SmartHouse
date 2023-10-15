import 'package:Homey/design/colors.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LightValue extends StatelessWidget {
  const LightValue({super.key, this.lightIntensity = 0});

  final double lightIntensity;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: ClipOval(
        child: Container(
          color: ColorsTheme.backgroundDarker.withOpacity(0.7),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  lightIntensity.toStringAsFixed(2),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sriracha',
                      fontSize: 32),
                ),
                const SizedBox(
                  width: 1,
                ),
                Icon(
                  lightIntensity < 500
                      ? MdiIcons.moonWaxingCrescent
                      : MdiIcons.brightness7,
                  size: 32,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
