import 'package:Homey/add_device/data/device_repository.dart';
import 'package:Homey/add_device/domain/device.dart';
import 'package:Homey/core/router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_selector_view_model.g.dart';

@riverpod
class SelectedDevices extends _$SelectedDevices {
  @override
  List<String> build() {
    return [];
  }

  void addRemoveDevice(String macAddress) {
    final list = List<String>.from(state);
    if (state.contains(macAddress)) {
      list.remove(macAddress);
    } else {
      list.add(macAddress);
    }
    state = list;
  }

  Future<void> addDevicesToRoom(final int roomId) =>
      ref.watch(deviceRepositoryProvider).addDevicesToRoom(state, roomId);
}

@riverpod
Stream<List<Device>> getUnassignedDevices(GetUnassignedDevicesRef ref) => ref
    .watch(deviceRepositoryProvider)
    .watchUnassignedDevices(ref.watch(defaultHouseProvider).value!.id);
