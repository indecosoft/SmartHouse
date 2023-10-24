import 'package:Homey/rooms/domain/room.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'house.freezed.dart';
part 'house.g.dart';

@freezed
@collection
class House with _$House {
  const factory House({
    @Id() required int id,
    required String name,
    required String address,
    @Default(false) bool isDefault,
    @Default([]) List<Room> rooms,
  }) = _House;

  factory House.fromJson(Map<String, dynamic> json) => _$HouseFromJson(json);
}
