import 'package:Homey/add_device/domain/device_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_details.freezed.dart';
part 'device_details.g.dart';

@freezed
class DeviceState with _$DeviceState {
  factory DeviceState({
    required String name,
    @Default(false) bool isOnline,
    @Default({}) Map<String, dynamic> state,
    required String timestamp,
  }) = _DeviceState;

  factory DeviceState.fromJson(Map<String, dynamic> json) =>
      _$DeviceStateFromJson(json);
}

@freezed
class DeviceDetails with _$DeviceDetails {
  factory DeviceDetails({
    required String sensorName,
    required int freqMinutes,
    @Default(DeviceType.unknown) DeviceType sensorType,
    String? server,
    @Default(1883) int port,
    required String macAddress,
  }) = _DeviceDetails;

  factory DeviceDetails.fromJson(Map<String, dynamic> json) =>
      _$DeviceDetailsFromJson(json);
}
