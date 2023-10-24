import 'package:Homey/design/colors.dart';
import 'package:flutter/material.dart';

class EmptyListItem extends StatelessWidget {
  const EmptyListItem({
    required this.title,
    required this.onPressed,
    required this.icon,
  });

  final String title;
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AspectRatio(
        aspectRatio: 21 / 9,
        child: Card(
          elevation: 10,
          color: ColorsTheme.backgroundCard,
          child: InkWell(
            splashColor: ColorsTheme.backgroundDarker,
            onTap: onPressed,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      icon,
                      size: 50,
                      color: ColorsTheme.background,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
