import 'package:Homey/design/colors.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ContactValue extends StatelessWidget {
  const ContactValue({super.key, this.isClossed = false});

  final bool isClossed;
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
                  isClossed ? 'Closed' : 'Open',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sriracha',
                      fontSize: 32),
                ),
                const SizedBox(
                  width: 1,
                ),
                Icon(
                  isClossed ? MdiIcons.doorClosed : MdiIcons.doorOpen,
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
