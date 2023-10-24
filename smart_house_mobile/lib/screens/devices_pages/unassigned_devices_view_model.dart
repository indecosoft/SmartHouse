import 'package:Homey/add_device/data/device_repository.dart';
import 'package:Homey/add_device/domain/device.dart';
import 'package:Homey/core/router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'unassigned_devices_view_model.g.dart';

@riverpod
Future<List<Device>> refreshUnassignedDevices(
    RefreshUnassignedDevicesRef ref) async {
  return await ref
      .watch(deviceRepositoryProvider)
      .getUnassignedDevices(ref.watch(defaultHouseProvider).value!.id);
}

@riverpod
Stream<List<Device>> unassignedDevices(
  UnassignedDevicesRef ref,
) {
  ref.watch(refreshUnassignedDevicesProvider);
  return ref
      .watch(deviceRepositoryProvider)
      .watchUnassignedDevices(ref.watch(defaultHouseProvider).value!.id);
}
