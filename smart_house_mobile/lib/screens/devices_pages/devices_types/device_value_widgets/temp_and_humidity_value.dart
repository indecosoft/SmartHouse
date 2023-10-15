import 'package:Homey/design/colors.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TempAndHumidityValueWidget extends StatelessWidget {
  const TempAndHumidityValueWidget(
      {super.key, required this.temperature, required this.humidity});

  final String temperature;
  final String humidity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: ClipOval(
              child: Container(
                color: ColorsTheme.backgroundDarker.withOpacity(0.7),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        temperature,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Sriracha',
                            fontSize: 32),
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                      Icon(
                        MdiIcons.temperatureCelsius,
                        size: 32,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: const Alignment(1, -1.3),
          child: FractionallySizedBox(
            widthFactor: 0.4,
            heightFactor: 0.4,
            child: Align(
              alignment: Alignment.center,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: ClipOval(
                  child: Container(
                    color: ColorsTheme.primary.withOpacity(0.9),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            humidity,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Sriracha',
                                fontSize: 18),
                          ),
                          const SizedBox(
                            width: 1,
                          ),
                          Icon(
                            MdiIcons.water,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
