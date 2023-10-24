import 'package:Homey/design/widgets/buttons/round_button.dart';
import 'package:Homey/design/widgets/device_list_item.dart';
import 'package:Homey/rooms/presentation/device_selector_view_model.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DeviceSelectorPage extends StatelessWidget {
  const DeviceSelectorPage({super.key, required this.roomId});

  final int roomId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Select devices'),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: RoundButton(
            icon: Icon(MdiIcons.chevronLeft, color: Colors.black),
            padding: const EdgeInsets.all(8),
            onPressed: () => GoRouter.of(context).pop(),
          ),
        ),
      ),
      body: Consumer(builder: (context, ref, widget) {
        final devices = ref.watch(getUnassignedDevicesProvider).value ?? [];
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: devices.length,
          itemBuilder: (context, index) {
            return FlipCard(
              direction: FlipDirection.VERTICAL,
              flipOnTouch: true,
              onFlipDone: (_) {
                ref
                    .read(selectedDevicesProvider.notifier)
                    .addRemoveDevice(devices[index].macAddress);
              },
              front: DeviceListItem(
                selected: false,
                device: devices[index],
              ),
              back: DeviceListItem(
                device: devices[index],
                selected: true,
              ),
            );
          },
        );
      }),
      floatingActionButton: Consumer(
        builder: (context, ref, widget) {
          return Consumer(builder: (context, ref, widget) {
            return TweenAnimationBuilder<Offset>(
              tween: ref.watch(selectedDevicesProvider).isNotEmpty
                  ? Tween<Offset>(
                      begin: Offset(MediaQuery.of(context).size.width, 0),
                      end: const Offset(0, 0),
                    )
                  : Tween<Offset>(
                      begin: const Offset(0, 0),
                      end: Offset(MediaQuery.of(context).size.width, 0),
                    ),
              builder: (context, value, child) {
                return Transform.translate(offset: value, child: child);
              },
              duration: const Duration(milliseconds: 250),
              child: FloatingActionButton.extended(
                onPressed: () {
                  ref
                      .read(selectedDevicesProvider.notifier)
                      .addDevicesToRoom(roomId)
                      .then((value) => GoRouter.of(context).pop());
                },
                label: const Text('Finish'),
                icon: Icon(MdiIcons.check),
              ),
            );
          });
        },
      ),
    );
  }
}
