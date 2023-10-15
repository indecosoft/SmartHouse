import 'package:Homey/design/colors.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UVValue extends StatelessWidget {
  const UVValue({super.key, this.uvIndex = 0});

  final int uvIndex;
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
                  uvIndex < 6
                      ? MdiIcons.emoticonHappyOutline
                      : uvIndex > 5 && uvIndex < 8
                          ? MdiIcons.emoticonNeutralOutline
                          : uvIndex > 7 && uvIndex < 11
                              ? MdiIcons.emoticonSadOutline
                              : MdiIcons.alertOutline,
                  size: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'UV index: $uvIndex',
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
