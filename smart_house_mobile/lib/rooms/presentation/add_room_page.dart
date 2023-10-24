import 'package:Homey/design/widgets/buttons/round_button.dart';
import 'package:Homey/rooms/presentation/room_name_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddRoomPage extends HookConsumerWidget {
  const AddRoomPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final PageController controller = usePageController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a room'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RoundButton(
            icon: Icon(MdiIcons.chevronLeft, color: Colors.black),
            padding: const EdgeInsets.all(8),
            onPressed: GoRouter.of(context).pop,
          ),
        ),
      ),
      body: const RoomName(),

      // PageView(
      //   controller: controller,
      //   children: <Widget>[
      //     const RoomName(),
      //     SelectDevicesPage(),
      //   ],
      // ),
    );
  }
}
