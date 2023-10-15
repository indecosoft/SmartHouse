import 'package:Homey/core/router_helpers.dart';
import 'package:Homey/design/colors.dart';
import 'package:Homey/design/widgets/network_status.dart';
import 'package:Homey/screens/devices_pages/device_info_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DeviceInfo extends ConsumerWidget {
  const DeviceInfo({super.key, required this.macAddress});

  final String macAddress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsTheme.backgroundCard,
      ),
      body: Consumer(builder: (context, ref, widget) {
        final device = ref.watch(deviceInfoViewModelProvider(macAddress));
        return device.when(
            data: (device) {
              if (device == null) {
                return const Center(
                  child: Text('Device not found'),
                );
              }
              return Column(
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      color: ColorsTheme.backgroundCard,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            device.type.icon,
                            size: 100,
                          ),
                          Text(
                            device.name,
                            style: const TextStyle(fontSize: 35),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 8,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: const Alignment(1, -0.1),
                            child: ListView(
//                    mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(MdiIcons.wifi),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text('Network information'),
                                      const Spacer(),
                                      Expanded(
                                        flex: 1,
                                        child: AnimatedCrossFade(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          crossFadeState: device.isOnline
                                              ? CrossFadeState.showFirst
                                              : CrossFadeState.showSecond,
                                          secondChild: const NetworkStatusLabel(
                                              online: false),
                                          firstChild: const NetworkStatusLabel(
                                              online: true),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(MdiIcons.ip),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          device.ip ?? 'IP unset',
                                          style: TextStyle(
                                              color: device.ip == null
                                                  ? Colors.red
                                                  : Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(MdiIcons.developerBoard),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          device.macAddress,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            loading: () => const LinearProgressIndicator(),
            error: (error, stack) {
              return Center(
                child: Text(error.toString()),
              );
            });
      }),
      bottomNavigationBar: BottomAppBar(
        color: ColorsTheme.backgroundDarker,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        elevation: 20,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: Icon(MdiIcons.restart),
              onPressed: () {
                ref
                    .read(deviceInfoViewModelProvider(macAddress).notifier)
                    .reboot();
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          ref
              .read(deviceInfoViewModelProvider(macAddress).notifier)
              .removeDevice();
          returnHome(context);
        },
        child: Icon(
          MdiIcons.trashCanOutline,
          color: Colors.white,
        ),
      ),
    );
  }
}
