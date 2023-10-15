import 'package:Homey/core/extensions.dart';
import 'package:Homey/core/helpers/sql_helper/database.dart';
import 'package:Homey/house/domain/house.dart';
import 'package:Homey/rooms/domain/room.dart';
import 'package:Homey/rooms/domain/room_type.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'room_dao.g.dart';

@riverpod
RoomDao roomDao(RoomDaoRef ref) => RoomDao(ref.watch(isarProvider));

class RoomDao {
  final Isar _isar;

  const RoomDao(this._isar);

  Room addRoom(int houseId, Room room) {
    _isar.write((isar) {
      final defaultHouse = isar.houses.where().idEqualTo(houseId).findFirst();
      defaultHouse?.let((it) {
        isar.houses.put(it.copyWith(rooms: [
          ...it.rooms,
          room,
        ]));
      });
    });
    return room;
  }

  bool deleteRoom(int houseId, int roomId) {
    _isar.write((isar) {
      final defaultHouse = isar.houses.where().idEqualTo(houseId).findFirst();
      defaultHouse?.let((it) {
        final newRooms = List<Room>.from(it.rooms)
          ..removeWhere((element) => element.id == roomId);
        isar.houses.put(it.copyWith(rooms: newRooms));
      });
    });
    return true;
  }

  void addRoomTypes(final List<RoomType> roomTypes) {
    _isar.write((isar) {
      isar.roomTypes.putAll(roomTypes);
    });
  }

  Stream<List<RoomType>> watchRoomTypes() async* {
    yield _isar.roomTypes.where().sortByName().findAll();
    yield* _isar.roomTypes.where().sortByName().watch();
  }
}
