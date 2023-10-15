import 'package:Homey/core/router.dart';
import 'package:Homey/core/router_helpers.dart';
import 'package:Homey/dashboard/presentation/menu_drawer/menu_drawer.dart';
import 'package:Homey/design/colors.dart';
import 'package:Homey/design/widgets/empty_list_card.dart';
import 'package:Homey/design/widgets/room_list_item.dart';
import 'package:Homey/screens/menu/devices_categories_horizontal_scroll/devices_categories_horizontal_scroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(builder: (context, ref, child) {
          return ref.watch(defaultHouseProvider).when(
              data: (defaultHouse) => Text(
                  defaultHouse == null ? 'Add a house' : defaultHouse.name),
              error: (err, stacktrace) => const Text('Add a house'),
              loading: () => const CircularProgressIndicator());
        }),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _settingModalBottomSheet(context);
            },
            icon: Icon(
              MdiIcons.plusCircle,
              color: Colors.white,
              size: 25,
            ),
          ),
        ],
      ),
      drawer: const MenuDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const DevicesHorizontalScroll(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Rooms'),
          ),
          Expanded(
            child: Consumer(builder: (context, ref, widget) {
              final defaultHouse =
                  ref.watch(defaultHouseProvider).requireValue!;

              return AnimationLimiter(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                  itemBuilder: (context, index) {
                    if (defaultHouse.rooms.isEmpty) {
                      return EmptyListItem(
                        title: 'You don\'t have any room.\nAdd one now',
                        onPressed: () {
                          navigateToAddRoom(context);
                        },
                        icon: MdiIcons.help,
                      );
                    } else {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 700),
                        delay: const Duration(milliseconds: 100),
                        child: FadeInAnimation(
                          child: RoomListItem(
                            defaultHouse.rooms[index],
                            onPressed: () {
                              navigateToRoom(
                                  context, defaultHouse.rooms[index]);
                            },
                          ),
                        ),
                      );
                    }
                  },
                  itemCount: defaultHouse.rooms.isEmpty
                      ? 1
                      : defaultHouse.rooms.length,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  void _settingModalBottomSheet(BuildContext context) {
    showModalBottomSheet<dynamic>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Card(
          margin: const EdgeInsets.all(16),
          color: ColorsTheme.background,
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(MdiIcons.home),
                title: const Text('Add house'),
                onTap: () => navigateToAddHouse(context),
              ),
              ListTile(
                leading: Icon(MdiIcons.floorPlan),
                title: const Text('Add room'),
                onTap: () => navigateToAddRoom(context),
              ),
              ListTile(
                leading: Icon(MdiIcons.developerBoard),
                title: const Text('Add device'),
                onTap: () => navigateToAddDevice(context),
              ),
              ListTile(
                leading: Icon(MdiIcons.playSpeed),
                title: const Text('Add Scene'),
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
