import 'package:Homey/core/helpers/utils.dart';
import 'package:Homey/design/colors.dart';
import 'package:Homey/design/widgets/buttons/round_rectangle_button.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LocationReceivedPage extends StatelessWidget {
  const LocationReceivedPage(
      {super.key,
      required this.onManualAddress,
      required this.buttonIcon,
      this.buttonText = '',
      this.buttonColor = ColorsTheme.primary,
      this.backgroundColor = ColorsTheme.background,
      this.hasButton = true,
      required this.onAddressCorrect,
      required this.animationWidthFactor,
      required this.animationHeightFactor,
      required this.animationPath,
      required this.animationName,
      required this.title,
      required this.address});

  final Function() onManualAddress;
  final Function() onAddressCorrect;
  final bool hasButton;
  final Icon buttonIcon;
  final Color buttonColor, backgroundColor;
  final double animationWidthFactor, animationHeightFactor;
  final String animationPath, title, buttonText, animationName;
  final Placemark? address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: FractionallySizedBox(
                widthFactor: animationWidthFactor,
                heightFactor: animationHeightFactor,
                child: FlareActor.asset(
                  AssetFlare(bundle: rootBundle, name: animationPath),
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  animation: animationName,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: Utils.getPercentValueFromScreenWidth(5, context),
              ),
            ),
            Text(
              '${address?.street}, ${address?.subThoroughfare}\n${address?.subAdministrativeArea}, ${address?.locality}',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Utils.getPercentValueFromScreenWidth(7, context)),
            ),
            const SizedBox(
              height: 30,
            ),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              spacing: 10,
              runSpacing: 10,
              children: <Widget>[
                RoundRectangleButton(
                  onPressed: onManualAddress,
                  label: 'I will complete it manually',
                  icon: Icon(MdiIcons.pencil),
                ),
                RoundRectangleButton(
                  onPressed: onAddressCorrect,
                  label: 'This is correct',
                  icon: Icon(MdiIcons.check),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
