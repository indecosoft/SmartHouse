import 'package:Homey/add_device/data/device_repository.dart';
import 'package:Homey/add_device/domain/device.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_info_view_model.g.dart';

@riverpod
class DeviceInfoViewModel extends _$DeviceInfoViewModel {
  @override
  Stream<Device?> build(String macAddress) {
    return ref
        .watch(deviceRepositoryProvider)
        .watchDeviceByMacAddress(macAddress);
  }

  Future<void> reboot() {
    return ref.watch(deviceRepositoryProvider).rebootDevice(macAddress);
  }

  Future<void> removeDevice() {
    return ref.watch(deviceRepositoryProvider).removeDevice(macAddress);
  }
}
