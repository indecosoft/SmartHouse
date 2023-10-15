import 'package:Homey/house/domain/house.dart';
import 'package:Homey/login/domain/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

@freezed
class AuthResponse with _$AuthResponse {
  factory AuthResponse({
    required String token,
    required User user,
    House? defaultHouse,
    @Default([]) List<House> houses,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}
