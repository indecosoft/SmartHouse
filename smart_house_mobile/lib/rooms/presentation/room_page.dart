import 'package:Homey/add_device/domain/device.dart';
import 'package:Homey/add_device/domain/device_types.dart';
import 'package:Homey/core/router_helpers.dart';
import 'package:Homey/design/colors.dart';
import 'package:Homey/design/rooms_styles.dart';
import 'package:Homey/design/widgets/buttons/round_button.dart';
import 'package:Homey/design/widgets/device_card.dart';
import 'package:Homey/rooms/domain/room.dart';
import 'package:Homey/rooms/presentation/add_room_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  Widget build(BuildContext context) {
    // _state.init(widget.room.id);
    final Map<String, dynamic> style =
        RoomsStyles(name: room.name).getRoomStyle();
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
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              room.name,
              style: const TextStyle(fontSize: 18),
            ),
            const Spacer(),
            RoundButton(
              icon: Icon(
                MdiIcons.pencil,
                color: Colors.black,
                size: 16,
              ),
              padding: const EdgeInsets.all(12),
              onPressed: () {
                navigateToEditRoom(context, room);
                //   Navigator.push(
                //   context,
                //   MaterialPageRoute<RoomEdit>(
                //     builder: (_) => RoomEdit(room: widget.room),
                //   ),
                // );
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: ShaderMask(
              shaderCallback: (rect) {
                return const LinearGradient(
                  begin: Alignment(0, -0.5),
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    ColorsTheme.background,
                    Colors.transparent,
                  ],
                ).createShader(
                  Rect.fromLTRB(
                    0,
                    0,
                    rect.width,
                    rect.height,
                  ),
                );
              },
              blendMode: BlendMode.dstIn,
              child: FractionallySizedBox(
                heightFactor: 0.6,
                widthFactor: 1,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    ColorsTheme.background.withOpacity(0.3),
                    BlendMode.multiply,
                  ),
                  child: Image.asset(
                    style['image'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
//          Align(
//            alignment: const Alignment(-0.8, 0.08),
//            child: Text(
//              'The door of the ${widget.room.name} is not closed',
//              textScaleFactor: 1.2,
//            ),
//          ),
          Align(
            alignment: const Alignment(0, 0.3),
            child: FractionallySizedBox(
              heightFactor: 0.15,
              child: Consumer(
                builder: (context, ref, widget) {
                  final List<Device> devices =
                      ref.watch(roomDevicesProvider(room.id)).value ?? [];
                  return ListView.builder(
                    padding: const EdgeInsets.only(left: 10),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final Device device = devices[index];
                      return DeviceCard(
                        icon: device.type.icon,
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
                        label: device.name,
                        isOnline: device.isOnline,
                        isCategory: false,
                      );
                    },
                    itemCount: devices.length,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
