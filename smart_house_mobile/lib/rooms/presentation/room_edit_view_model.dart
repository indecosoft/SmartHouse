import 'package:Homey/add_device/data/device_repository.dart';
import 'package:Homey/rooms/data/room_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'room_edit_view_model.g.dart';

@riverpod
Future<void> removeDeviceFromRoom(
    RemoveDeviceFromRoomRef ref, String macAddress) {
  return ref.watch(deviceRepositoryProvider).addRemoveDeviceToRoom(macAddress);
}

@riverpod
Future<void> deleteRoom(DeleteRoomRef ref, int roomId) {
  return ref.watch(roomRepositoryProvider).deleteRoom(roomId);
}
