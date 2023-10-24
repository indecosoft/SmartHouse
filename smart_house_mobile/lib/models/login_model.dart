import 'package:Homey/core/resource.dart';

class LoginModel {
  LoginModel(
      {required this.email, required this.password, required this.onResult});

  final String email;
  final String password;
  final OnResult onResult;

  Map<String, String> toMap() {
    return <String, String>{'email': email, 'password': password};
  }
}
