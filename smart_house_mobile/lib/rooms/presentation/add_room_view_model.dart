import 'package:Homey/add_device/data/device_repository.dart';
import 'package:Homey/add_device/domain/device.dart';
import 'package:Homey/rooms/data/room_repository.dart';
import 'package:Homey/rooms/domain/room.dart';
import 'package:Homey/rooms/domain/room_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_room_view_model.g.dart';

@riverpod
Stream<List<RoomType>> roomTypes(RoomTypesRef ref) async* {
  yield* ref.watch(roomRepositoryProvider).watchRoomTypes();
}

@riverpod
Stream<List<Device>> roomDevices(RoomDevicesRef ref, final int roomId) async* {
  yield* ref.watch(roomRepositoryProvider).watchRoomDevices(roomId);
}

@riverpod
Future<Room> createRoom(
  CreateRoomRef ref,
  final String roomName,
  final int typeId,
) =>
    ref.watch(roomRepositoryProvider).createRoom(roomName, typeId);

@riverpod
Future<void> deleteDevice(
  DeleteDeviceRef ref,
  final String macddress,
) =>
    ref.watch(deviceRepositoryProvider).removeDevice(macddress);

@riverpod
Future<void> removeDevice(
  RemoveDeviceRef ref,
  final String macddress,
) =>
    ref.watch(deviceRepositoryProvider).removeDevice(macddress);
