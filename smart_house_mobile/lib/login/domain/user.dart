import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
@collection
class User with _$User {
  const factory User({
    @Id() required int id,
    required String firstName,
    required String lastName,
    required String email,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
