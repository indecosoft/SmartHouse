import 'package:flutter/material.dart';

class FormHelpers {
  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void  clearField(TextEditingController controller) {
    WidgetsBinding.instance.addPostFrameCallback((_) => controller.clear());
  }
}
