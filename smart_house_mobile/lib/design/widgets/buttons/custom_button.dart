import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.isSecondary = false});
  final String text;
  final VoidCallback? onPressed;
  final bool isSecondary;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      // shape: RoundedRectangleBorder(
      //   side: isSecondary
      //       ? const BorderSide(color: ColorsTheme.primary, width: 2)
      //       : BorderSide.none,
      //   borderRadius: const BorderRadius.all(Radius.circular(5)),
      // ),
      // color: isSecondary ? ColorsTheme.background : ColorsTheme.primary,
      // textColor: Colors.white,
      // disabledColor: Colors.grey,
      // disabledTextColor: Colors.black,
      // padding: const EdgeInsets.all(10.0),
      // splashColor: ColorsTheme.accent,
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
