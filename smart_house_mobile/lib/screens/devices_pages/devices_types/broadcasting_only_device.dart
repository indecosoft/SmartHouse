import 'package:Homey/add_device/domain/device.dart';
import 'package:Homey/add_device/domain/device_types.dart';
import 'package:Homey/core/helpers/utils.dart';
import 'package:Homey/core/router_helpers.dart';
import 'package:Homey/design/colors.dart';
import 'package:Homey/design/widgets/buttons/round_button.dart';
import 'package:Homey/screens/devices_pages/devices_types/device_value_widgets/contact_value.dart';
import 'package:Homey/screens/devices_pages/devices_types/device_value_widgets/gas_and_smoke_value.dart';
import 'package:Homey/screens/devices_pages/devices_types/device_value_widgets/light_value.dart';
import 'package:Homey/screens/devices_pages/devices_types/device_value_widgets/temp_and_humidity_value.dart';
import 'package:Homey/screens/devices_pages/devices_types/device_value_widgets/uv_value.dart';
import 'package:Homey/screens/devices_pages/devices_types/temp_device_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BroadcastingOnlyDevice extends HookConsumerWidget {
  const BroadcastingOnlyDevice({super.key, required this.device});

  final Device device;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RoundButton(
            icon: Icon(MdiIcons.chevronLeft, color: Colors.black),
            padding: const EdgeInsets.all(8),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  device.name,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const Spacer(),
            RoundButton(
              icon: Icon(
                MdiIcons.informationOutline,
                color: Colors.black,
                size: 16,
              ),
              padding: const EdgeInsets.all(12),
              onPressed: () {
                navigateToDeviceInfo(context, device.macAddress);
              },
            ),
            const SizedBox(
              width: 10,
            ),
            RoundButton(
              icon: Icon(
                MdiIcons.pencil,
                color: Colors.black,
                size: 16,
              ),
              padding: const EdgeInsets.all(12),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: SizedBox(
              height: Utils.getPercentValueFromScreenHeight(100, context),
              child: AnimatedCrossFade(
                duration: const Duration(seconds: 1),
                firstChild: SizedBox(
                  height: Utils.getPercentValueFromScreenHeight(100, context),
                  child: Image.asset(
                    'assets/images/hall.jpg',
                    fit: BoxFit.cover,
                    color: ColorsTheme.backgroundDarker.withOpacity(0.7),
                    colorBlendMode: BlendMode.multiply,
                  ),
                ),
                secondChild: SizedBox(
                  height: Utils.getPercentValueFromScreenHeight(100, context),
                  child: ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.grey,
                      BlendMode.saturation,
                    ),
                    child: Image.asset(
                      'assets/images/hall.jpg',
                      fit: BoxFit.cover,
                      color: ColorsTheme.backgroundDarker.withOpacity(0.8),
                      colorBlendMode: BlendMode.multiply,
                    ),
                  ),
                ),
                crossFadeState: device.isOnline
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
            ),
          ),
          Consumer(
            builder: (context, ref, widget) {
              final device = ref.watch(
                  broadcastingOnlyDeviceStateProvider(this.device.macAddress));
              return switch (this.device.type) {
                DeviceType.tempAndHumidity => Center(
                    child: FractionallySizedBox(
                      widthFactor: 0.6,
                      heightFactor: 0.3,
                      child: TempAndHumidityValueWidget(
                        temperature:
                            device.value?.rawData['temperature']?.toString() ??
                                'NaN',
                        humidity: '${device.value?.rawData['humidity']}%',
                      ),
                    ),
                  ),
                DeviceType.contact => Center(
                      child: FractionallySizedBox(
                    widthFactor: 0.6,
                    heightFactor: 0.3,
                    child: ContactValue(
                      isClossed: device.value?.rawData['state'] ?? false,
                    ),
                  )),
                DeviceType.light => Center(
                    child: FractionallySizedBox(
                      widthFactor: 0.6,
                      heightFactor: 0.3,
                      child: LightValue(
                        lightIntensity: double.parse(
                            device.value?.rawData['light']?.toString() ??
                                '0.0'),
                      ),
                    ),
                  ),
                DeviceType.uv => Center(
                    child: FractionallySizedBox(
                      widthFactor: 0.6,
                      heightFactor: 0.3,
                      child: UVValue(
                        uvIndex: int.parse(
                            device.value?.rawData['UVIndex']?.toString() ??
                                '0'),
                      ),
                    ),
                  ),
                DeviceType.gasAndSmoke => Center(
                    child: FractionallySizedBox(
                      widthFactor: 0.6,
                      heightFactor: 0.3,
                      child: GasAndSmokeValue(
                        gas: int.parse(
                            device.value?.rawData['methane']?.toString() ??
                                '0'),
                        smoke: int.parse(
                            device.value?.rawData['smoke']?.toString() ?? '0'),
                      ),
                    ),
                  ),
                _ => Container(),
              };
            },
          ),
        ],
      ),
    );
  }
}
