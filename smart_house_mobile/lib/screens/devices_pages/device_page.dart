import 'package:Homey/add_device/domain/device.dart';
import 'package:Homey/add_device/domain/device_types.dart';
import 'package:Homey/core/router_helpers.dart';
import 'package:Homey/design/colors.dart';
import 'package:Homey/design/widgets/buttons/round_button.dart';
import 'package:Homey/design/widgets/device_list_item.dart';
import 'package:Homey/screens/devices_pages/devices_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DevicePage extends ConsumerWidget {
  const DevicePage({super.key, required this.deviceType});
  final DeviceType deviceType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devicesByType = ref.watch(devicesByTypeProvider(deviceType));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          deviceType.category,
          style: const TextStyle(fontSize: 18),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RoundButton(
            icon: Icon(MdiIcons.chevronLeft, color: Colors.black),
            padding: const EdgeInsets.all(8),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: Column(
        children: [
          if (ref.watch(refreshDevicesByTypeProvider(deviceType)).isLoading)
            const LinearProgressIndicator(),
          devicesByType.when(data: (devices) {
            return Flexible(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: <Widget>[
                  if (devices.isEmpty)
                    GestureDetector(
                      onTap: () => navigateToAddDevice(context),
                      child: AspectRatio(
                        aspectRatio: 21 / 9,
                        child: Card(
                          elevation: 10,
                          color: ColorsTheme.backgroundCard,
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 16, top: 16, right: 16, bottom: 10),
                            child: Stack(
                              children: <Widget>[
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'You don\'t have any device.\nAdd one now',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    MdiIcons.help,
                                    size: 50,
                                    color: ColorsTheme.background,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  for (final Device device in devices)
                    DeviceListItem(
                      device: device,
                      onPressed: () {
                        switch (device.type) {
                          case DeviceType.unknown:
                            break;
                          case DeviceType.light:
                          case DeviceType.contact:
                          case DeviceType.tempAndHumidity:
                          case DeviceType.uv:
                          case DeviceType.gasAndSmoke:
                            navigateToBroadcastingOnlyDevice(context, device);
                            break;
                          case DeviceType.plug:
                            navigateToSwitchDevice(context, device);
                            break;
                        }
                      },
                    ),
                ],
              ),
            );
          }, error: (error, stackTrace) {
            return Center(
              child: Text(error.toString()),
            );
          }, loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateToAddDevice(context),
        child: Icon(MdiIcons.plus),
      ),
    );
  }
}
