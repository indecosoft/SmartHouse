import 'package:Homey/add_device/domain/device_details.dart';
import 'package:Homey/core/error_wrapper.dart';
import 'package:Homey/core/network.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hardware_device_api.g.dart';

@riverpod
HardwareDeviceApi hardwareDeviceApi(HardwareDeviceApiRef ref) =>
    HardwareDeviceApi(ref.watch(dioProvider));

class HardwareDeviceApi {
  final Dio _dio;

  const HardwareDeviceApi(this._dio);

  Future<DeviceDetails> getDeviceDetails(String deviceIp) async {
    final Dio dio = Dio()..options.baseUrl = 'http://$deviceIp:80';
    return apiWrapper<DeviceDetails, Map<String, dynamic>>(
      callable: () => dio.get(
        '/api/getConfig',
      ),
      responseMapper: DeviceDetails.fromJson,
    );
  }

  Future<String> setDeviceDetails(
      String deviceIp, DeviceDetails details, String account) async {
    final Dio dio = Dio()..options.baseUrl = 'http://$deviceIp:80';

    return apiWrapper<String, Map<String, dynamic>>(
      callable: () => dio.post(
        '/api/config',
        data: {
          'account': account,
          ...details.toJson(),
        },
      ),
      responseMapper: (response) => response['message'],
    );
  }
}
