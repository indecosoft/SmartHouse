import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'room_type.freezed.dart';
part 'room_type.g.dart';

@freezed
@collection
class RoomType with _$RoomType {
  const factory RoomType({
    @Id() required int id,
    required int type,
    required String name,
  }) = _RoomType;

  factory RoomType.fromJson(Map<String, dynamic> json) =>
      _$RoomTypeFromJson(json);
}
