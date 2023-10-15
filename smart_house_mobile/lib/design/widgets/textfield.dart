import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.placeholder = '',
    this.controller,
    this.isPassword = false,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.focusNode,
    this.enabled = true,
    this.onChanged,
    this.onSubmitted,
    this.icon,
    this.suffix,
    this.validator,
    this.textLength,
    this.autoValidate,
  });

  final String placeholder;
  final TextEditingController? controller;
  final bool isPassword;
  final Icon? icon;
  final TextInputAction inputAction;
  final TextInputType inputType;
  final Widget? suffix;
  final Function()? onSubmitted;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final AutovalidateMode? autoValidate;
  final bool enabled;
  final int? textLength;

  Widget generateTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
        cursorRadius: const Radius.circular(16.0),
        onChanged: onChanged,
        enabled: enabled,
        controller: controller,
        obscureText: isPassword,
        textInputAction: inputAction,
        focusNode: focusNode,
        validator: validator,
        autovalidateMode: autoValidate,
        onEditingComplete: onSubmitted,
        maxLength: textLength,
        //onSubmitted: onSubmitted,
        keyboardType: inputType,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 3.0),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 13),
          prefixIcon: icon,
          suffixIcon: suffix,
          labelText: placeholder,
          alignLabelWithHint: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return generateTextField();
  }
}
