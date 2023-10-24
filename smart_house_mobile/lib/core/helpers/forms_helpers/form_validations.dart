class FormValidation {
  static const String _required = 'Field required';

  static String? simpleValidator(String? value) {
    return value == null || value.isEmpty ? _required : null;
  }

  static String? emailValidator(String? value) {
    const String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    if (value == null || value.isEmpty || !RegExp(pattern).hasMatch(value)) {
      return 'Invalid email';
    } else {
      return null;
    }
  }

  static String? passwordValidator(String? value) {
    if (value == null ||
        value.isEmpty ||
        !RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$')
            .hasMatch(value)) {
      return 'Password must be minimum 8 characters long and include at least one uppercase letter, one lowercase letter and one number';
    } else {
      return null;
    }
  }
}
