import 'package:Homey/core/resource.dart';

class RegisterModel {
  RegisterModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.onResult});

  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final OnResult onResult;

  Map<String, String> toMap() {
    return <String, String>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password
    };
  }
}
