// import 'dart:developer';
// import 'dart:io';

// import 'package:Homey/app_data_manager.dart';
// import 'package:Homey/core/helpers/sql_helper/data_models/home_model.dart';
// import 'package:Homey/design/colors.dart';
// import 'package:Homey/design/widgets/empty_list_card.dart';
// import 'package:Homey/design/widgets/room_list_item.dart';
// import 'package:Homey/main.dart';
// import 'package:Homey/screens/add_device/add_device_page.dart';
// import 'package:Homey/screens/add_house/add_house.dart';
// import 'package:Homey/screens/add_room/room_name/room_name_page.dart';
// import 'package:Homey/screens/menu/devices_categories_horizontal_scroll/devices_categories_horizontal_scroll.dart';
// import 'package:Homey/screens/menu/menu_drawer/menu_drawer.dart';
// import 'package:Homey/screens/room/room.dart';
// import 'package:Homey/states/menu_state.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// class Menu extends StatelessWidget {
//   final MenuState state = getIt.get<MenuState>();

// //  final RefreshController _refreshController =
// //  RefreshController(initialRefresh: true);
// //  Future<void> _onRefresh() async {
// ////    await _state.getDeviceState(widget.sensor, onResult);
// //    await AppDataManager().changeDefaultHome(AppDataManager().defaultHome.id);
// //    _refreshController.refreshCompleted();
// //  }
//   final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

//   @override
//   Widget build(BuildContext context) {
// //    state.initState();
//     firebaseMessaging.subscribeToTopic(
//         AppDataManager().userData.email.replaceAll('@', 'AT'));
//     firebaseMessaging.getToken().then(print);
//     firebaseMessaging.configure(
//         onMessage: (Map<String, dynamic> message) async {
//       log('onMessage', error: message);
//     }, onLaunch: (Map<String, dynamic> message) async {
//       log('onLaunch', error: message);
//     }, onResume: (Map<String, dynamic> message) async {
//       log('onLaunch', error: message);
//     });

//     // ignore: cascade_invocations
//     if (Platform.isIOS) {
//       firebaseMessaging.requestNotificationPermissions(
//           const IosNotificationSettings(sound: true, badge: true, alert: true));
//     }

//     state.selectedHome = AppDataManager().defaultHome;
//     if (state.selectedHome == null) {
//       return AddHouse();
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: StreamBuilder<HomeModel>(
//             stream: state.selectedHomeStream$,
//             builder: (BuildContext context, AsyncSnapshot<HomeModel> snapshot) {
//               return Text(state.selectedHome == null
//                   ? 'Add a house'
//                   : state.selectedHome.name);
//             }),
//         actions: <Widget>[
//           RawMaterialButton(
//             shape: const CircleBorder(),
//             elevation: 0.0,
//             onPressed: () {
//               _settingModalBottomSheet(context);
//             },
//             child: const Icon(
//               MdiIcons.plusCircle,
//               color: Colors.white,
//               size: 25,
//             ),
//           ),
//         ],
//       ),
//       drawer: MenuDrawer(state),
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Expanded(
//               flex: 2,
//               child: AnimationLimiter(child: DevicesHorizontalScroll()),
//             ),
// //            Expanded(
// //              flex: 0,
// //              child: Container(
// //                padding: const EdgeInsets.symmetric(horizontal: 16),
// //                child: const Text('Rooms'),
// //              ),
// //            ),
//             Expanded(
//               flex: 8,
//               child: StreamBuilder<HomeModel>(
//                   stream: state.selectedHomeStream$,
//                   builder: (BuildContext context,
//                       AsyncSnapshot<HomeModel> snapshot) {
//                     return AnimationLimiter(
//                       child: ListView.builder(
//                         physics: const BouncingScrollPhysics(),
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 16, vertical: 30),
//                         itemBuilder: (BuildContext context, int index) {
//                           if (state.selectedHome.rooms.isEmpty) {
//                             return EmptyListItem(
//                               title: 'You don\'t have any room.\nAdd one now',
//                               onPressed: () => Navigator.push<RoomName>(
//                                 context,
//                                 MaterialPageRoute<RoomName>(
//                                   builder: (_) => RoomName(),
//                                 ),
//                               ),
//                               icon: MdiIcons.help,
//                             );
//                           } else {
//                             print(state.selectedHome.rooms.length);
//                             print(state.selectedHome.rooms[index].toMap());
//                             return AnimationConfiguration.staggeredList(
//                               position: index,
//                               duration: const Duration(milliseconds: 700),
//                               delay: const Duration(milliseconds: 100),
//                               child: FadeInAnimation(
//                                 child: RoomListItem(
//                                   state.selectedHome.rooms[index],
//                                   onPressed: () {
//                                     Navigator.push<Room>(
//                                         context,
//                                         MaterialPageRoute<Room>(
//                                             builder: (_) => Room(state
//                                                 .selectedHome.rooms[index])));
//                                   },
//                                 ),
//                               ),
//                             );
//                           }
//                         },
//                         itemCount: state.selectedHome.rooms.isEmpty
//                             ? 1
//                             : state.selectedHome.rooms.length,
//                       ),

// //                      child: ListView(
// //                        physics: const BouncingScrollPhysics(),
// //                        padding: const EdgeInsets.symmetric(
// //                            horizontal: 16, vertical: 30),
// //                        children: <Widget>[
// //                          if (state.selectedHome.rooms.isNotEmpty)
// //                            for (int i = 0;
// //                                i < state.selectedHome.rooms.length;
// //                                i++)
// //                              AnimationConfiguration.staggeredList(
// //                                position: i,
// //                                duration: const Duration(milliseconds: 800),
// //                                child: RoomListItem(
// //                                  state.selectedHome.rooms[i],
// //                                  i,
// //                                  onPressed: () {
// //                                    log('hId: ${state.selectedHome.rooms[i].houseId} id: ${state.selectedHome.rooms[i].dbId}, name: ${state.selectedHome.rooms[i].name}, id: ${state.selectedHome.rooms[i].dbId}');
// //                                  },
// //                                ),
// //                              ),
// ////                          if (state.selectedHome.rooms.isEmpty)
// //
// //                        ],
// //                      ),
//                     );
//                   }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _settingModalBottomSheet(BuildContext context) {
//     showModalBottomSheet<dynamic>(
//       context: context,
//       backgroundColor: Colors.transparent,
//       builder: (BuildContext bc) {
//         return Card(
//           margin: const EdgeInsets.all(16),
//           color: ColorsTheme.background,
//           child: Container(
//             child: Wrap(
//               children: <Widget>[
//                 ListTile(
//                   leading: const Icon(MdiIcons.home),
//                   title: const Text('Add house'),
//                   onTap: () => Navigator.pushReplacement<AddHouse, dynamic>(bc,
//                       MaterialPageRoute<AddHouse>(builder: (_) => AddHouse())),
//                 ),
//                 ListTile(
//                   leading: const Icon(MdiIcons.floorPlan),
//                   title: const Text('Add room'),
//                   onTap: () => Navigator.pushReplacement<RoomName, dynamic>(bc,
//                       MaterialPageRoute<RoomName>(builder: (_) => RoomName())),
//                 ),
//                 ListTile(
//                   leading: const Icon(MdiIcons.developerBoard),
//                   title: const Text('Add device'),
//                   onTap: () => Navigator.pushReplacement<AddDevice, dynamic>(
//                       bc,
//                       MaterialPageRoute<AddDevice>(
//                           builder: (_) => AddDevice())),
//                 ),
//                 ListTile(
//                   leading: const Icon(MdiIcons.playSpeed),
//                   title: const Text('Add Scene'),
//                   onTap: () {},
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
