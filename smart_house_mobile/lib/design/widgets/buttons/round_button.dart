import 'package:Homey/design/colors.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {super.key,
      this.widthFactor = 11,
      this.heightFactor = 11,
      this.icon,
      this.backgroundColor = Colors.white,
      this.padding = const EdgeInsets.all(12),
      required this.onPressed});

  final int widthFactor, heightFactor;
  final Icon? icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        elevation: 16.0,
        color: backgroundColor, // button color
        child: InkWell(
          splashColor: ColorsTheme.backgroundDarker,
          onTap: onPressed, // inkwell color
          child: Container(
            padding: padding,
            child: icon,
          ),
        ),
      ),
    );
  }
}
