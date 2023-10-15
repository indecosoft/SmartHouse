import 'package:Homey/add_device/data/hardware_device_repository.dart';
import 'package:Homey/add_device/domain/device_details.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_config_view_model.g.dart';

@riverpod
Future<DeviceDetails> deviceDetails(
    DeviceDetailsRef ref, String deviceIp) async {
  final device = await ref
      .watch(hardwareDeviceRepositoryProvider)
      .getDeviceDetails(deviceIp);
  ref.watch(lastConfiguredDeviceProvider.notifier).device = device;
  return device;
}

@riverpod
class LastConfiguredDevice extends _$LastConfiguredDevice {
  @override
  DeviceDetails? build() {
    return null;
  }

  set device(DeviceDetails device) {
    state = device;
  }
}

@riverpod
class SaveDeviceDetails extends _$SaveDeviceDetails {
  @override
  FutureOr<String?> build() async {
    return null;
  }

  Future<void> saveConfiguration(String deviceIp, DeviceDetails details) async {
    state = const AsyncValue.loading();
    try {
      state = AsyncValue.data(await ref
          .watch(hardwareDeviceRepositoryProvider)
          .setDeviceDetails(deviceIp, details));
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
