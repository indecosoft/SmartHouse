import 'dart:convert';

import 'package:Homey/add_device/domain/device_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'device.freezed.dart';
part 'device.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Device with _$Device {
  const factory Device({
    @Id() required int id,
    int? roomId,
    int? houseId,
    required String name,
    @Default(false) bool isOnline,
    required String macAddress,
    String? ip,
    @Default('{}') String data,
    @Default(10) int readingFrequency,
    @Default(DeviceType.unknown) DeviceType type,
  }) = _Device;

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
}

extension DeviceRawData on Device {
  Map<String, dynamic> get rawData => jsonDecode(data);
}
