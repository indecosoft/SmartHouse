import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

@JsonEnum(valueField: 'id')
enum DeviceType {
  unknown(0, 'Undefined devices', 'Undefined device'),
  uv(1, 'UV Sensors', 'UV Sensor'),
  plug(2, 'Switches', 'Switch'),
  tempAndHumidity(
      3, 'Temperature and Humidity Sensors', 'Temperature and Humidity Sensor'),
  light(4, 'Light Sensors', 'Light Sensor'),
  gasAndSmoke(5, 'Gas and Smoke Detectors', 'Gas and Smoke Detector'),
  contact(6, 'Contact Sensors', 'Contact Sensor');

  const DeviceType(this.id, this.category, this.typeName);

  final int id;
  final String category;
  final String typeName;
  static DeviceType fromId(int id) =>
      DeviceType.values.firstWhereOrNull((element) => element.id == id) ??
      DeviceType.unknown;

  IconData get icon => switch (this) {
        DeviceType.uv => MdiIcons.weatherSunny,
        DeviceType.plug => MdiIcons.powerSocketEu,
        DeviceType.tempAndHumidity => MdiIcons.thermometer,
        DeviceType.light => MdiIcons.themeLightDark,
        DeviceType.gasAndSmoke => MdiIcons.smokeDetector,
        DeviceType.contact => MdiIcons.doorOpen,
        _ => MdiIcons.devices
      };
}
