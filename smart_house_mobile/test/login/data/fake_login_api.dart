import 'dart:convert';

import 'package:Homey/login/data/auth_response.dart';
import 'package:Homey/login/data/login_api.dart';
import 'package:flutter/services.dart';

class FakeLoginApi extends AuthApi {
  FakeLoginApi({required super.dio});

  String? jsonPath;
  @override
  Future<AuthResponse> login(String email, String password) async {
    final String json =
        await rootBundle.loadString('assets/mocks/login_api_response.json');
    return AuthResponse.fromJson(jsonDecode(json));
  }
}
