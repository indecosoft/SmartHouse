import 'package:Homey/add_device/domain/device.dart';
import 'package:Homey/core/helpers/utils.dart';
import 'package:Homey/core/router_helpers.dart';
import 'package:Homey/design/colors.dart';
import 'package:Homey/design/widgets/buttons/round_button.dart';
import 'package:Homey/screens/devices_pages/devices_types/switch_device_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SwitchDevicePage extends HookConsumerWidget {
  const SwitchDevicePage({super.key, required this.device});
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
                // StreamBuilder<DeviceSwitchModel>(
                //     stream: _state.dataStream$,
                //     builder: (context, snapshot) {
                //       return NetworkStatusLabel(
                //         online: device.isOnline,
                //       );
                //     }),
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
        fit: StackFit.expand,
        children: <Widget>[
          Consumer(builder: (context, ref, widget) {
            final deviceState =
                ref.watch(deviceStateViewModelProvider(device.macAddress));

            return Positioned.fill(
              child: AnimatedCrossFade(
                duration: const Duration(seconds: 1),
                firstChild: SizedBox(
                  height: Utils.getPercentValueFromScreenHeight(100, context),
                  child: Image.asset(
                    'assets/images/light.jpg',
                    fit: BoxFit.cover,
                    color: Colors.black.withOpacity(0.2),
                    colorBlendMode: BlendMode.screen,
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
                      'assets/images/light.jpg',
                      fit: BoxFit.cover,
                      color: Colors.black.withOpacity(0.8),
                      colorBlendMode: BlendMode.multiply,
                    ),
                  ),
                ),
                crossFadeState: deviceState.value?.rawData['status'] == 1
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
            );
          }),

          Consumer(builder: (context, ref, widget) {
            return Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: RoundButton(
                  backgroundColor: ColorsTheme.backgroundDarker,
                  padding: const EdgeInsets.all(35),
                  icon: Icon(
                    MdiIcons.power,
                    size: 35,
                    color: Colors.white,
                  ),
                  onPressed: () => ref
                      .read(deviceStateViewModelProvider(device.macAddress)
                          .notifier)
                      .toggleState(),
                ),
              ),
            );
          })

//                     FutureBuilder<DeviceSwitchModel>(
//             future: _state.getDeviceState(device, onResult),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting ||
//                   snapshot.connectionState == ConnectionState.none) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else {
//                 if (snapshot.hasData) {
//                   return Container(
//                     child: StreamBuilder<DeviceSwitchModel>(
//                       stream: _state.dataStream$,
//                       builder: (context, snapshot) {
//                         return Stack(
//                           children: <Widget>[
//                             Align(
//                               alignment: const Alignment(0, 0.9),
//                               child: RoundButton(
//                                 backgroundColor: ColorsTheme.backgroundDarker,
//                                 padding: const EdgeInsets.all(35),
//                                 icon: Icon(
//                                   MdiIcons.power,
//                                   size: 35,
//                                   color: Colors.white,
//                                 ),
//                                 onPressed: () => _state.changeStateOn(
//                                     widget.sensor, onResult),
//                               ),
//                             ),
// //                              const SizedBox(
// //                                height: 20,
// //                              ),

// //                              NetworkStatusLabel(
// //                                  online: _state.device.networkStatus)
//                           ],
//                         );
//                       },
//                     ),
//                   );
//                 } else {
//                   return const Center(
//                     child: Text(
//                       'Cannnot retrieve device status',
//                       textAlign: TextAlign.center,
//                     ),
//                   );
//                 }
//               }
//             },
//           ),
        ],
      ),
    );
  }
}
