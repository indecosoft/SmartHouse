import 'package:Homey/add_device/domain/device.dart';
import 'package:Homey/add_device/domain/device_details.dart';
import 'package:Homey/add_device/domain/device_types.dart';
import 'package:Homey/core/error_wrapper.dart';
import 'package:Homey/core/network.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_api.g.dart';

@riverpod
DeviceApi deviceApi(DeviceApiRef ref) => DeviceApi(ref.watch(dioProvider));

class DeviceApi {
  final Dio _dio;
  const DeviceApi(this._dio);

  Future<List<Device>> getDevices(DeviceType type, int houseId) async {
    return apiWrapper<List<Device>, List<dynamic>>(
      callable: () => _dio.get('/api/get/devicesByType',
          queryParameters: {'type': type.id, 'houseId': houseId}),
      responseMapper: (response) =>
          response.map((device) => Device.fromJson(device)).toList(),
    );
  }

  Future<List<Device>> getUnassignedDevices(int houseId) async {
    return apiWrapper<List<Device>, List<dynamic>>(
      callable: () => _dio.get('/api/get/unassignedDevices',
          queryParameters: {'houseId': houseId}),
      responseMapper: (response) =>
          response.map((device) => Device.fromJson(device)).toList(),
    );
  }

  Future<DeviceState> getDeviceLastState(String macAddress) async {
    return apiWrapper<DeviceState, Map<String, dynamic>>(
      callable: () => _dio.get('/api/get/device/lastState',
          queryParameters: {'macAddress': macAddress}),
      responseMapper: (response) => DeviceState.fromJson(response),
    );
  }

  Future<String> changeState(bool state, String macAddress) {
    return apiWrapper<String, Map<String, dynamic>>(
      callable: () => _dio.post('/api/sendEventToSensor',
          data: {'macAddress': macAddress, 'event': state ? 'on' : 'off'}),
      responseMapper: (response) => response['message'],
    );
  }

  Future<String> reboot(String macAddress) {
    return apiWrapper<String, Map<String, dynamic>>(
      callable: () => _dio.post('/api/sendEventToSensor',
          data: {'macAddress': macAddress, 'event': 'reboot'}),
      responseMapper: (response) => response['message'],
    );
  }

  Future<Device> addDeviceToRoom(int? roomId, String macAddress) {
    return apiWrapper<Device, Map<String, dynamic>>(
      callable: () => _dio.post('/api/add/deviceToRoom',
          data: {'macAddress': macAddress, 'roomId': roomId}),
      responseMapper: (response) {
        return Device.fromJson(response);
      },
    );
  }

  Future<List<Device>> addDevicesToRoom(int roomId, List<String> macAddresses) {
    return apiWrapper<List<Device>, List<dynamic>>(
      callable: () => _dio.post('/api/add/devicesToRoom',
          data: {'macAddresses': macAddresses, 'roomId': roomId}),
      responseMapper: (response) =>
          response.map((device) => Device.fromJson(device)).toList(),
    );
  }

  Future<bool> removeDevice(final String macAddress) {
    return apiWrapper<bool, Map<String, dynamic>>(
      callable: () => _dio.post('/api/remove/device', data: {
        'macAddress': macAddress,
      }),
      responseMapper: (response) {
        return true;
      },
    );
  }
}
