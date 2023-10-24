import 'package:Homey/add_device/data/hardware_device_api.dart';
import 'package:Homey/add_device/domain/device_details.dart';
import 'package:Homey/core/router.dart';
import 'package:Homey/login/domain/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hardware_device_repository.g.dart';

@riverpod
HardwareDeviceRepository hardwareDeviceRepository(
        HardwareDeviceRepositoryRef ref) =>
    HardwareDeviceRepository(ref.watch(hardwareDeviceApiProvider),
        ref.watch(currentUserProvider).value!);

class HardwareDeviceRepository {
  final HardwareDeviceApi _deviceApi;
  final User _currentUser;

  const HardwareDeviceRepository(this._deviceApi, this._currentUser);

  Future<DeviceDetails> getDeviceDetails(String deviceIp) {
    return _deviceApi.getDeviceDetails(deviceIp);
  }

  Future<String> setDeviceDetails(String deviceIp, DeviceDetails details) {
    return _deviceApi.setDeviceDetails(deviceIp, details, _currentUser.email);
  }
}
