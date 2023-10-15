import 'package:Homey/add_device/data/devices_dao.dart';
import 'package:Homey/add_device/domain/device.dart';
import 'package:Homey/house/data/houses_dao.dart';
import 'package:Homey/rooms/data/room_api.dart';
import 'package:Homey/rooms/data/room_dao.dart';
import 'package:Homey/rooms/domain/room.dart';
import 'package:Homey/rooms/domain/room_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'room_repository.g.dart';

@riverpod
RoomRepository roomRepository(RoomRepositoryRef ref) => RoomRepository(
      ref.watch(roomApiProvider),
      ref.watch(roomDaoProvider),
      ref.watch(housesDaoProvider),
      ref.watch(devicesDaoProvider),
    );

class RoomRepository {
  final RoomApi _roomApi;
  final RoomDao _roomDao;
  final DevicesDao _devicesDao;
  final HousesDao _housesDao;
  RoomRepository(
      this._roomApi, this._roomDao, this._housesDao, this._devicesDao) {
    _init();
  }
  Future<void> _init() async {
    final types = await _roomApi.getRoomTypes();
    _roomDao.addRoomTypes(types);
  }

  Future<Room> createRoom(final String roomName, final int typeId) async {
    final houseId = _housesDao.defaultHouse?.id;
    if (houseId == null) {
      throw Exception('No default house');
    }
    final room = await _roomApi.createRoom(houseId, roomName, typeId);

    return _roomDao.addRoom(houseId, room);
  }

  Future<bool> deleteRoom(
    final int roomId,
  ) async {
    final houseId = _housesDao.defaultHouse?.id;
    if (houseId == null) {
      throw Exception('No default house');
    }
    await _roomApi.deleteRoom(roomId);

    return _roomDao.deleteRoom(houseId, roomId);
  }

  Stream<List<RoomType>> watchRoomTypes() {
    return _roomDao.watchRoomTypes();
  }

  Stream<List<Device>> watchRoomDevices(final int roomId) {
    return _devicesDao.watchByRoom(roomId);
  }
}
