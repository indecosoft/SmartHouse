import 'package:Homey/add_device/data/device_repository.dart';
import 'package:Homey/add_device/domain/device.dart';
import 'package:Homey/core/helpers/mqtt.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'temp_device_page_view_model.g.dart';

@riverpod
class BroadcastingOnlyDeviceState extends _$BroadcastingOnlyDeviceState {
  @override
  Stream<Device?> build(String macAddress) {
    ref.watch(mqttProvider(macAddress, (payload) {
      ref.watch(deviceRepositoryProvider).updateDeviceData(payload, macAddress);
    }, (payload) {
      ref
          .watch(deviceRepositoryProvider)
          .updateDeviceState(payload, macAddress);
    }));
    ref.watch(deviceRepositoryProvider).getDeviceLastState(macAddress);
    return ref
        .watch(deviceRepositoryProvider)
        .watchDeviceByMacAddress(macAddress);
  }
}
