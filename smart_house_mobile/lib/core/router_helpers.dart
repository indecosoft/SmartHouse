import 'dart:convert';

import 'package:Homey/add_device/domain/device.dart';
import 'package:Homey/add_device/domain/device_types.dart';
import 'package:Homey/core/router.dart';
import 'package:Homey/rooms/domain/room.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void navigateToRegister(BuildContext context) {
  GoRouter.of(context).pushNamed(AppRoutes.register.name);
}

void returnHome(BuildContext context) {
  GoRouter.of(context).goNamed(AppRoutes.home.name);
}

void navigateToAddHouse(BuildContext context) {
  GoRouter.of(context).pushNamed(AppRoutes.addHouse.name);
}

void navigateToAddRoom(BuildContext context) {
  GoRouter.of(context).pushNamed(AppRoutes.addRoom.name);
}

void navigateToAddDevice(BuildContext context) {
  GoRouter.of(context).pushNamed(AppRoutes.addDevice.name);
}

void navigateToDevices(BuildContext context,
    {DeviceType deviceType = DeviceType.unknown}) {
  GoRouter.of(context).pushNamed(AppRoutes.devices.name, queryParameters: {
    'type': [deviceType.id.toString()]
  });
}

void navigateToUnassignedDevices(BuildContext context,
    {DeviceType? deviceType}) {
  GoRouter.of(context).pushNamed(
    AppRoutes.unassignedDevices.name,
  );
}

void navigateToSwitchDevice(BuildContext context, Device device) {
  GoRouter.of(context).pushNamed(AppRoutes.switchDevice.name, queryParameters: {
    'device': [json.encode(device.toJson())]
  });
}

void navigateToBroadcastingOnlyDevice(BuildContext context, Device device) {
  GoRouter.of(context)
      .pushNamed(AppRoutes.broadcastingOnlyDevice.name, queryParameters: {
    'device': [json.encode(device.toJson())]
  });
}

void navigateToDeviceInfo(BuildContext context, String macAddress) {
  GoRouter.of(context).pushNamed(AppRoutes.deviceInfo.name, queryParameters: {
    'device': [macAddress]
  });
}

void navigateToRoom(BuildContext context, Room room) {
  GoRouter.of(context).pushNamed(AppRoutes.room.name, queryParameters: {
    'room': [json.encode(room.toJson())]
  });
}

void navigateToEditRoom(BuildContext context, Room room) {
  GoRouter.of(context).pushNamed(AppRoutes.editRoom.name, queryParameters: {
    'room': [json.encode(room.toJson())]
  });
}

void navigateToDeviceSelector(BuildContext context, int roomId) {
  GoRouter.of(context)
      .pushNamed(AppRoutes.deviceSelector.name, queryParameters: {
    'roomId': [roomId.toString()]
  });
}
