
import 'package:flutter/material.dart';

class NetworkStatusLabel extends StatelessWidget {
  const NetworkStatusLabel({this.online = false});

  final bool online;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipOval(
            child: Container(
              width: 10,
              height: 10,
              color: online ? Colors.green : Colors.red,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            online ? 'Online' : 'Offline',
            textAlign: TextAlign.center,
            style: TextStyle(color: online ? Colors.green : Colors.red),
          )
        ],
      ),
    );
  }
}
