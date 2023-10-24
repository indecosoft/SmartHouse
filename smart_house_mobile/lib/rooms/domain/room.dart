import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'room.freezed.dart';
part 'room.g.dart';

@Embedded(ignore: {'copyWith'})
@freezed
class Room with _$Room {
  const factory Room({
    @Id() required int id,
    required String name,
    // required RoomType type,
  }) = _Room;
  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}
