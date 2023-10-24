import 'package:Homey/add_device/add_device_view_model.dart';
import 'package:Homey/add_device/pages/device_config_page.dart';
import 'package:Homey/add_device/pages/device_config_view_model.dart';
import 'package:Homey/add_device/pages/esp_touch_config_page.dart';
import 'package:Homey/add_device/pages/rooms_selector.dart';
import 'package:Homey/core/extensions.dart';
import 'package:Homey/design/widgets/buttons/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddDevicePage extends HookConsumerWidget {
  const AddDevicePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController controller = usePageController();
    ref
      ..listen(saveDeviceDetailsProvider, (prev, next) {
        if (next.value != null) {
          controller.nextPage(
            duration: kTabScrollDuration,
            curve: Curves.ease,
          );
        }
      })
      ..listen(addDeviceToRoomProvider, (prev, next) {
        if (next.value != null) {
          GoRouter.of(context).pop();
        }
      });
    final device = ref.watch(lastConfiguredDeviceProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a device'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RoundButton(
            icon: Icon(MdiIcons.chevronLeft, color: Colors.black),
            padding: const EdgeInsets.all(8),
            onPressed: GoRouter.of(context).pop,
          ),
        ),
      ),
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          EspTouchConfigPage(onSmartConfigDone: () async {
            await Future.delayed(const Duration(seconds: 1));
            await controller.nextPage(
              duration: kTabScrollDuration,
              curve: Curves.ease,
            );
          }),
          Consumer(builder: (context, ref, widget) {
            final deviceIp = ref.watch(asyncConfigDeviceProvider);
            return deviceIp.value?.ip.let((it) => DeviceConfig(
                      submit: (device) {
                        ref
                            .read(saveDeviceDetailsProvider.notifier)
                            .saveConfiguration(it, device);
                      },
                      deviceIp: it,
                    )) ??
                const SizedBox.shrink();
          }),
          Consumer(builder: (context, ref, widget) {
            return RoomSelectorPage(
              onSubmit: (roomId) {
                ref
                    .read(addDeviceToRoomProvider.notifier)
                    .addDeviceToRoom(device?.macAddress ?? '', roomId);
              },
            );
          }),
        ],
      ),
    );
  }
}
