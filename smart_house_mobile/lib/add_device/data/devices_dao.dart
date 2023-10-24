import 'dart:convert';

import 'package:Homey/add_device/domain/device.dart';
import 'package:Homey/add_device/domain/device_types.dart';
import 'package:Homey/core/helpers/sql_helper/database.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'devices_dao.g.dart';

@riverpod
DevicesDao devicesDao(DevicesDaoRef ref) => DevicesDao(ref.watch(isarProvider));

class DevicesDao {
  final Isar _isar;

  const DevicesDao(this._isar);

  Stream<List<Device>> watchAll() async* {
    yield _isar.devices.where().findAll();
    yield* _isar.devices.where().watch();
  }

  Stream<List<Device>> watchByType(
      final DeviceType type, final int houseId) async* {
    yield _isar.devices
        .where()
        .typeEqualTo(type)
        .and()
        .houseIdEqualTo(houseId)
        .findAll();
    yield* _isar.devices
        .where()
        .typeEqualTo(type)
        .and()
        .houseIdEqualTo(houseId)
        .watch();
  }

  Stream<Device?> watchByMacAddress(final String macAddress) async* {
    yield _isar.devices.where().macAddressEqualTo(macAddress).findFirst();
    yield* _isar.devices
        .where()
        .macAddressEqualTo(macAddress)
        .watch(limit: 1)
        .map((e) => e.firstOrNull);
  }

  Device? getDeviceByMacAddress(final String macAddress) {
    return _isar.devices.where().macAddressEqualTo(macAddress).findFirst();
  }

  Stream<List<Device>> watchUnassignedDevices(int houseId) async* {
    yield _isar.devices
        .where()
        .roomIdEqualTo(null)
        .and()
        .houseIdEqualTo(houseId)
        .findAll();
    yield* _isar.devices
        .where()
        .roomIdEqualTo(null)
        .and()
        .houseIdEqualTo(houseId)
        .watch();
  }

  Stream<List<Device>> watchByRoom(final int id) async* {
    yield _isar.devices.where().roomIdEqualTo(id).findAll();
    yield* _isar.devices.where().roomIdEqualTo(id).watch();
  }

  Future<Device> addDevice(Device device) async {
    _isar.write((isar) => _isar.devices.put(device));
    return device;
  }

  Future<List<Device>> addDevices(List<Device> devices) async {
    _isar.write((isar) => _isar.devices.putAll(devices));
    return devices;
  }

  Future<void> updateDevice(String name, bool isOnline,
      Map<String, dynamic> data, String macAddress) async {
    _isar.write((isar) {
      _isar.devices
          .where()
          .macAddressEqualTo(macAddress)
          .updateFirst(name: name, isOnline: isOnline, data: jsonEncode(data));
    });
  }

  Future<void> updateDeviceData(
      Map<String, dynamic> data, String macAddress) async {
    _isar.write((isar) {
      _isar.devices
          .where()
          .macAddressEqualTo(macAddress)
          .updateFirst(data: jsonEncode(data));
    });
  }

  Future<void> updateDeviceState(bool isOnline, String macAddress) async {
    _isar.write((isar) {
      _isar.devices
          .where()
          .macAddressEqualTo(macAddress)
          .updateFirst(isOnline: isOnline);
    });
  }

  Future<void> removeDevice(final String macAddress) async {
    _isar.write((isar) =>
        _isar.devices.where().macAddressEqualTo(macAddress).deleteAll());
  }
}
