import 'package:Homey/add_device/data/device_repository.dart';
import 'package:Homey/add_device/domain/device.dart';
import 'package:Homey/add_device/domain/device_types.dart';
import 'package:Homey/core/router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'devices_page_view_model.g.dart';

@riverpod
Future<List<Device>> refreshDevicesByType(
    RefreshDevicesByTypeRef ref, DeviceType type) async {
  return await ref
      .watch(deviceRepositoryProvider)
      .getDevicesByType(type, ref.watch(defaultHouseProvider).value!.id);
}

@riverpod
Stream<List<Device>> devicesByType(DevicesByTypeRef ref, DeviceType type) {
  ref.watch(refreshDevicesByTypeProvider(type));
  return ref
      .watch(deviceRepositoryProvider)
      .watchDevicesByType(type, ref.watch(defaultHouseProvider).value!.id);
}
