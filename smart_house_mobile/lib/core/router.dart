import 'dart:convert';

import 'package:Homey/add_device/add_device_page.dart';
import 'package:Homey/add_device/domain/device.dart';
import 'package:Homey/add_device/domain/device_types.dart';
import 'package:Homey/dashboard/presentation/dashboard_page.dart';
import 'package:Homey/house/data/house_repository.dart';
import 'package:Homey/house/domain/house.dart';
import 'package:Homey/house/presentation/add_house/add_house_page.dart';
import 'package:Homey/login/data/auth_repository.dart';
import 'package:Homey/login/domain/user.dart';
import 'package:Homey/login/presentation/login/login_page.dart';
import 'package:Homey/login/presentation/register/register_page.dart';
import 'package:Homey/rooms/domain/room.dart';
import 'package:Homey/rooms/presentation/add_room_page.dart';
import 'package:Homey/rooms/presentation/device_selector.dart';
import 'package:Homey/rooms/presentation/room_edit.dart';
import 'package:Homey/rooms/presentation/room_page.dart';
import 'package:Homey/screens/devices_pages/device_info.dart';
import 'package:Homey/screens/devices_pages/device_page.dart';
import 'package:Homey/screens/devices_pages/devices_types/broadcasting_only_device.dart';
import 'package:Homey/screens/devices_pages/devices_types/switch_device_page.dart';
import 'package:Homey/screens/devices_pages/unassigned_devices_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
Stream<User?> currentUser(CurrentUserRef ref) {
  ref.keepAlive();
  return ref.watch(authRepositoryProvider).watchCurrentUser();
}

@riverpod
Stream<House?> defaultHouse(DefaultHouseRef ref) {
  ref.keepAlive();
  return ref.watch(houseRepositoryProvider).watchDefaultHouse();
}

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: AppRoutes.home.name,
        path: AppRoutes.home.path,
        builder: (context, state) {
          return const DashboardPage();
        },
        redirect: (context, state) {
          final currentUser = ref.watch(currentUserProvider);
          final defaultHouse = ref.watch(defaultHouseProvider);
          return currentUser.when(
            data: (data) async {
              if (data == null || defaultHouse.isLoading) {
                return AppRoutes.login.path;
              }

              if (defaultHouse.hasValue) {
                return defaultHouse.value == null
                    ? AppRoutes.addHouse.path
                    : AppRoutes.home.path;
              }

              return AppRoutes.home.path;
            },
            error: (_, error) {
              return '${AppRoutes.error.path}/?error=${error.toString()}';
            },
            loading: () {
              return AppRoutes.loading.path;
            },
          );
        },
      ),
      GoRoute(
        name: AppRoutes.login.name,
        path: AppRoutes.login.path,
        builder: (context, state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        name: AppRoutes.register.name,
        path: AppRoutes.register.path,
        builder: (context, state) {
          return const RegisterPage();
        },
      ),
      GoRoute(
        name: AppRoutes.error.name,
        path: AppRoutes.error.path,
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Text(state.uri.queryParameters['error'].toString()),
            ),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.loading.name,
        path: AppRoutes.loading.path,
        builder: (context, state) {
          return const Scaffold(
            body: Center(
              child: Text('Loading'),
            ),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.addHouse.name,
        path: AppRoutes.addHouse.path,
        builder: (context, state) {
          return const AddHousePage();
        },
      ),
      GoRoute(
        name: AppRoutes.addRoom.name,
        path: AppRoutes.addRoom.path,
        builder: (context, state) {
          return const AddRoomPage();
        },
      ),
      GoRoute(
        name: AppRoutes.addDevice.name,
        path: AppRoutes.addDevice.path,
        builder: (context, state) {
          return const AddDevicePage();
        },
      ),
      GoRoute(
        name: AppRoutes.devices.name,
        path: AppRoutes.devices.path,
        builder: (context, state) {
          print(state.uri.queryParameters['type']);
          return DevicePage(
            deviceType: DeviceType.fromId(
                int.parse(state.uri.queryParameters['type'] ?? '0')),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.unassignedDevices.name,
        path: AppRoutes.unassignedDevices.path,
        builder: (context, state) {
          return const UnassignedDevicesPage();
        },
      ),
      GoRoute(
        name: AppRoutes.switchDevice.name,
        path: AppRoutes.switchDevice.path,
        builder: (context, state) {
          return SwitchDevicePage(
            device: Device.fromJson(
              json.decode(state.uri.queryParameters['device']!),
            ),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.broadcastingOnlyDevice.name,
        path: AppRoutes.broadcastingOnlyDevice.path,
        builder: (context, state) {
          return BroadcastingOnlyDevice(
            device: Device.fromJson(
              json.decode(state.uri.queryParameters['device']!),
            ),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.room.name,
        path: AppRoutes.room.path,
        builder: (context, state) {
          return RoomPage(
            room: Room.fromJson(
              json.decode(state.uri.queryParameters['room']!),
            ),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.editRoom.name,
        path: AppRoutes.editRoom.path,
        builder: (context, state) {
          return RoomEditPage(
            room: Room.fromJson(
              json.decode(state.uri.queryParameters['room']!),
            ),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.deviceInfo.name,
        path: AppRoutes.deviceInfo.path,
        builder: (context, state) {
          return DeviceInfo(
            macAddress: state.uri.queryParameters['device'] ?? '',
          );
        },
      ),
      GoRoute(
        name: AppRoutes.deviceSelector.name,
        path: AppRoutes.deviceSelector.path,
        builder: (context, state) {
          return DeviceSelectorPage(
            roomId: int.parse(state.uri.queryParameters['roomId'] ?? '0'),
          );
        },
      ),
    ],
  );
}

enum AppRoutes {
  home('/', 'home'),
  login('/login', 'login'),
  register('/register', 'register'),
  addHouse('/addHouse', 'addHouse'),
  addRoom('/addRoom', 'addRoom'),
  room('/room', 'room'),
  editRoom('/editRoom', 'editRoom'),
  deviceSelector('/deviceSelector', 'deviceSelector'),
  addDevice('/addDevice', 'addDevice'),
  deviceInfo('/deviceInfo', 'deviceInfo'),
  devices('/devices', 'devices'),
  unassignedDevices('/unassignedDevices', 'unassignedDevices'),
  switchDevice('/switchDevice', 'switchDevice'),
  broadcastingOnlyDevice('/broadcastingOnlyDevice', 'broadcastingOnlyDevice'),
  error('/error', 'error'),
  loading('/loading', 'loading');

  final String path;
  final String name;
  const AppRoutes(this.path, this.name);

  @override
  String toString() {
    return name;
  }
}
