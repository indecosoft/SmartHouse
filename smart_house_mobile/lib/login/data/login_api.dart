import 'package:Homey/core/error_wrapper.dart';
import 'package:Homey/core/network.dart';
import 'package:Homey/login/data/auth_response.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_api.g.dart';

@riverpod
AuthApi loginApi(LoginApiRef ref) => AuthApi(dio: ref.watch(dioProvider));

class AuthApi {
  final Dio dio;

  const AuthApi({required this.dio});

  Future<AuthResponse> login(String email, String password) async {
    return apiWrapper(
      callable: () => dio.post('/api/login',
          data: <String, String>{'email': email, 'password': password}),
      responseMapper: AuthResponse.fromJson,
    );
  }

  Future<AuthResponse> register(
      String firstName, String lastName, String email, String password) async {
    return apiWrapper(
      callable: () => dio.post('/api/register', data: <String, String>{
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password
      }),
      responseMapper: AuthResponse.fromJson,
    );
  }
}
