import 'package:Homey/add_device/data/device_api.dart';
import 'package:Homey/add_device/data/devices_dao.dart';
import 'package:Homey/add_device/domain/device.dart';
import 'package:Homey/add_device/domain/device_details.dart';
import 'package:Homey/add_device/domain/device_types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_repository.g.dart';

@riverpod
DeviceRepository deviceRepository(DeviceRepositoryRef ref) => DeviceRepository(
    ref.watch(deviceApiProvider), ref.watch(devicesDaoProvider));

class DeviceRepository {
  final DeviceApi _deviceApi;
  final DevicesDao _devicesDao;

  const DeviceRepository(this._deviceApi, this._devicesDao);

  // Future<Device> getDevice(String id) async {
  //   return await deviceApiClient.getDevice(id);
  // }

  Future<List<Device>> getDevicesByType(DeviceType type, int houseId) async {
    final devices = await _deviceApi.getDevices(type, houseId);
    return await _devicesDao.addDevices(devices);
  }

  Future<List<Device>> getUnassignedDevices(int houseId) async {
    final devices = await _deviceApi.getUnassignedDevices(houseId);
    return await _devicesDao.addDevices(devices);
  }

  Stream<List<Device>> watchDevicesByType(
      DeviceType type, final int houseId) async* {
    yield* _devicesDao.watchByType(type, houseId);
  }

  Future<DeviceState> getDeviceLastState(String macAddress) async {
    final lastState = await _deviceApi.getDeviceLastState(macAddress);
    await _devicesDao.updateDevice(
        lastState.name, lastState.isOnline, lastState.state, macAddress);
    return lastState;
  }

  Future<void> updateDeviceData(
      Map<String, dynamic> data, String macAddress) async {
    await _devicesDao.updateDeviceData(data, macAddress);
  }

  Future<void> updateDeviceState(bool isOnline, String macAddress) async {
    await _devicesDao.updateDeviceState(isOnline, macAddress);
  }

  Future<String> changeState(bool status, String macAddress) {
    return _deviceApi.changeState(status, macAddress);
  }

  Future<Device> addRemoveDeviceToRoom(String macAddress, {int? roomId}) async {
    final device = await _deviceApi.addDeviceToRoom(roomId, macAddress);
    return await _devicesDao.addDevice(device);
  }

  Future<List<Device>> addDevicesToRoom(
      List<String> macAddresses, int roomId) async {
    final devices = await _deviceApi.addDevicesToRoom(roomId, macAddresses);
    return await _devicesDao.addDevices(devices);
  }

  Future<void> removeDevice(final String macAddress) async {
    await _deviceApi.removeDevice(macAddress);
    await _devicesDao.removeDevice(macAddress);
  }

  Future<void> rebootDevice(final String macAddress) async {
    await _deviceApi.reboot(macAddress);
  }

  Stream<Device?> watchDeviceByMacAddress(final String macAddress) =>
      _devicesDao.watchByMacAddress(macAddress);

  Device? getDeviceByMacAddress(final String macAddress) =>
      _devicesDao.getDeviceByMacAddress(macAddress);

  Stream<List<Device>> watchUnassignedDevices(int houseId) =>
      _devicesDao.watchUnassignedDevices(houseId);
}
