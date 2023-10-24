import 'dart:ui';

import 'package:Homey/core/helpers/utils.dart';
import 'package:Homey/design/colors.dart';
import 'package:Homey/design/rooms_styles.dart';
import 'package:Homey/rooms/domain/room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class RoomListItem extends StatelessWidget {
  const RoomListItem(
    this.room, {
    super.key,
    required this.onPressed,
    this.selectionOnly = false,
  });

  final Room room;
  final VoidCallback onPressed;
  final bool selectionOnly;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> style =
        RoomsStyles(name: room.name).getRoomStyle();
    return SlideAnimation(
      horizontalOffset: Utils.getPercentValueFromScreenHeight(100, context),
      child: AspectRatio(
        aspectRatio: 21 / 9,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 5,
//            color: style['primary'],
          child: InkWell(
              onTap: onPressed,
              splashColor: style['iconColor'],
              child: Stack(
                clipBehavior: Clip.hardEdge,
                fit: StackFit.passthrough,
                children: <Widget>[
                  Positioned.fill(
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          ColorsTheme.background.withOpacity(0.6),
                          BlendMode.multiply),
                      child: Image.asset(
                        style['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 16, top: 16, right: 16, bottom: 10),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            room.name,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.7)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            style['icon'],
                            size: 60,
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                        // if (room.sensors.isNotEmpty && !selectionOnly)
                        //   Align(
                        //     alignment: Alignment.bottomLeft,
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       children: <Widget>[
                        //         if (room.sensors
                        //             .where((SensorModel sensor) =>
                        //                 sensor.sensorType == 3)
                        //             .isNotEmpty)
                        //           RoundButton(
                        //             onPressed: () {},
                        //             backgroundColor: ColorsTheme
                        //                 .backgroundDarker
                        //                 .withOpacity(0.8),
                        //             icon: Icon(
                        //               MdiIcons.lightbulb,
                        //               color: Colors.white,
                        //               size: 20.0,
                        //             ),
                        //           ),
                        //         if (room.sensors
                        //             .where((SensorModel sensor) =>
                        //                 sensor.sensorType == 3)
                        //             .isNotEmpty)
                        //           const SizedBox(
                        //             width: 10,
                        //           ),
                        //         if (room.sensors
                        //             .where((SensorModel sensor) =>
                        //                 sensor.sensorType == 1)
                        //             .isNotEmpty)
                        //           RoundButton(
                        //             onPressed: () {},
                        //             backgroundColor: ColorsTheme
                        //                 .backgroundDarker
                        //                 .withOpacity(0.8),
                        //             icon: Icon(
                        //               MdiIcons.lightSwitch,
                        //               color: Colors.white,
                        //               size: 20.0,
                        //             ),
                        //           ),
                        //         if (room.sensors
                        //             .where((SensorModel sensor) =>
                        //                 sensor.sensorType == 1)
                        //             .isNotEmpty)
                        //           const SizedBox(
                        //             width: 10,
                        //           ),
                        //         if (room.sensors
                        //             .where((SensorModel sensor) =>
                        //                 sensor.sensorType == 2)
                        //             .isNotEmpty)
                        //           RoundButton(
                        //             onPressed: () {},
                        //             backgroundColor: ColorsTheme
                        //                 .backgroundDarker
                        //                 .withOpacity(0.8),
                        //             icon: Icon(
                        //               MdiIcons.powerSocketEu,
                        //               color: Colors.white,
                        //               size: 20.0,
                        //             ),
                        //           ),
                        //       ],
                        //     ),
                        //   )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
//    return TweenAnimationBuilder<double>(
//      duration: Duration(seconds: 1, milliseconds: 100 * index),
//      curve: Curves.easeInOut,
//      tween: Tween<double>(begin: Utils.getPercentValueFromScreenHeight(100, context), end: 0),
//      builder: (_, double position, __) {
//        return Transform.translate(
//          offset: Offset(position, 0),
//          child:
//          GestureDetector(
//            onTap: onPressed,
//            child: Container(
//              child: Container(
//                child: AspectRatio(
//                  aspectRatio: 21 / 9,
//                  child: Card(
//                    elevation: 10,
//                    color: style['primary'],
//                    child: Container(
//                      padding: const EdgeInsets.only(
//                          left: 16, top: 16, right: 16, bottom: 10),
//                      child: Stack(
//                        children: <Widget>[
//                          Align(
//                            alignment: Alignment.topLeft,
//                            child: Text(
//                              room.name,
//                              style: TextStyle(
//                                  fontSize: 20,
//                                  fontWeight: FontWeight.bold,
//                                  color: style['textColor']),
//                            ),
//                          ),
//                          Align(
//                            alignment: Alignment.topRight,
//                            child: Icon(
//                              style['icon'],
//                              size: 60,
//                              color: style['iconColor'],
//                            ),
//                          ),
//                          if (room.sensors.isNotEmpty)
//                            Align(
//                              alignment: Alignment.bottomLeft,
//                              child: Row(
//                                mainAxisAlignment: MainAxisAlignment.start,
//                                children: <Widget>[
//                                  if (room.sensors
//                                      .where((SensorModel sensor) =>
//                                          sensor.sensorType == 3)
//                                      .isNotEmpty)
//                                    RoundButton(
//                                      onPressed: () {},
//                                      icon: Icon(
//                                        MdiIcons.lightbulb,
//                                        color: style['primary'],
//                                        size: 20.0,
//                                      ),
//                                    ),
//                                  if (room.sensors
//                                      .where((SensorModel sensor) =>
//                                          sensor.sensorType == 3)
//                                      .isNotEmpty)
//                                    const SizedBox(
//                                      width: 10,
//                                    ),
//                                  if (room.sensors
//                                      .where((SensorModel sensor) =>
//                                          sensor.sensorType == 1)
//                                      .isNotEmpty)
//                                    RoundButton(
//                                      onPressed: () {},
//                                      icon: Icon(
//                                        MdiIcons.lightSwitch,
//                                        color: style['primary'],
//                                        size: 20.0,
//                                      ),
//                                    ),
//                                  if (room.sensors
//                                      .where((SensorModel sensor) =>
//                                          sensor.sensorType == 1)
//                                      .isNotEmpty)
//                                    const SizedBox(
//                                      width: 10,
//                                    ),
//                                  if (room.sensors
//                                      .where((SensorModel sensor) =>
//                                          sensor.sensorType == 2)
//                                      .isNotEmpty)
//                                    RoundButton(
//                                      onPressed: () {},
//                                      icon: Icon(
//                                        MdiIcons.powerSocketEu,
//                                        color: style['primary'],
//                                        size: 20.0,
//                                      ),
//                                    ),
//                                ],
//                              ),
//                            )
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//              ),
//            ),
//          ),
//        );
//      },
//    );
  }
}
