import 'dart:async';

import 'package:Homey/add_device/data/device_repository.dart';
import 'package:Homey/add_device/domain/device.dart';
import 'package:Homey/core/location_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:esp_smartconfig/esp_smartconfig.dart';
import 'package:esptouch_smartconfig/esptouch_smartconfig.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_device_view_model.g.dart';

@riverpod
Connectivity connectivity(ConnectivityRef ref) => Connectivity();
@riverpod
NetworkInfo networkInfo(NetworkInfoRef ref) => NetworkInfo();
@riverpod
Provisioner espProvisioner(EspProvisionerRef ref) {
  final provisioner = Provisioner.espTouch();
  provisioner.listen((response) {
    print('Device $response connected to WiFi!');
    ref.watch(currentConfiguredDeviceProvider.notifier).device = response;
    provisioner.stop();
  });
  return provisioner;
}

@riverpod
Stream<ConnectivityResult> connectivitResult(ConnectivitResultRef ref) {
  return ref.watch(connectivityProvider).onConnectivityChanged;
}

@riverpod
Future<({String wifiName, String bssid})?> networkDetails(
    NetworkDetailsRef ref) async {
  if (ref.watch(requestLocationPermissionProvider).value == false) {
    return null;
  }
  if (ref.watch(connectivitResultProvider).value != ConnectivityResult.wifi) {
    return null;
  }
  final networkInfo = ref.watch(networkInfoProvider);

  final bssid = await networkInfo.getWifiBSSID();
  final ssid = await networkInfo.getWifiName();
  return (wifiName: ssid?.replaceAll('"', '') ?? '', bssid: bssid ?? '');
}

@riverpod
class AsyncConfigDevice extends _$AsyncConfigDevice {
  @override
  FutureOr<ESPTouchResult?> build() async {
    return null;
  }

  Future<void> start(String ssid, String bssid, String password) async {
    state = const AsyncValue.loading();
    try {
      final device = await EsptouchSmartconfig.run(
        ssid: ssid,
        bssid: bssid,
        password: password,
      )?.first;
      state = AsyncValue.data(device);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

@riverpod
class AddDeviceToRoom extends _$AddDeviceToRoom {
  @override
  FutureOr<Device?> build() async {
    return null;
  }

  Future<void> addDeviceToRoom(String macAddress, int? roomId) async {
    state = const AsyncValue.loading();
    try {
      state = AsyncValue.data(await ref
          .watch(deviceRepositoryProvider)
          .addRemoveDeviceToRoom(macAddress, roomId: roomId));
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

@riverpod
class WifiPasswordToggle extends _$WifiPasswordToggle {
  @override
  bool build() {
    return true;
  }

  void toggle() {
    state = !state;
  }
}

@riverpod
class CurrentConfiguredDevice extends _$CurrentConfiguredDevice {
  @override
  ProvisioningResponse? build() {
    return null;
  }

  set device(ProvisioningResponse device) {
    state = device;
  }
}

@riverpod
class CurrentConfiguredDeviceIp extends _$CurrentConfiguredDeviceIp {
  @override
  String? build() {
    return null;
  }

  set ip(String? ip) {
    state = ip;
  }
}
