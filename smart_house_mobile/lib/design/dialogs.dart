import 'package:flutter/material.dart';

class Dialogs {
  static void showSimpleDialog(
      String title, String message, BuildContext context) {
    // flutter defined function
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          elevation: 24,
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FilledButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  static void showProgressDialog(String message, BuildContext context) {
//    final ProgressDialog pr = ProgressDialog(context,
//        type: ProgressDialogType.Normal, isDismissible: true)
//      ..style(
//        message: message,
//        insetAnimCurve: Curves.easeInOut,
//        backgroundColor: ColorsTheme.backgroundCard,
//        messageTextStyle: TextStyle(color: Colors.white),
//        progressWidget: Container(
//            padding: const EdgeInsets.all(10.0),
//            child: const CircularProgressIndicator()),
//      );
//    return pr;
    showDialog<AlertDialog>(
//      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          contentPadding: const EdgeInsets.all(32),
          content: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const CircularProgressIndicator(),
              const SizedBox(
                width: 10,
              ),
              Text(message)
            ],
          ),
          elevation: 24,
        );
      },
    );
  }
}
