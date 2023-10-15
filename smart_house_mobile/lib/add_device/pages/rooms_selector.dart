import 'package:Homey/core/router.dart';
import 'package:Homey/design/widgets/room_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RoomSelectorPage extends ConsumerWidget {
  RoomSelectorPage({super.key, required this.onSubmit});
  final ValueChanged<int?> onSubmit;
  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultHouse = ref.watch(defaultHouseProvider).requireValue!;
    return Scaffold(
      key: _keyLoader,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          onSubmit(null);
        },
        label: const Text('Skip'),
        icon: Icon(MdiIcons.arrowRight),
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          itemCount: defaultHouse.rooms.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 700),
              delay: const Duration(milliseconds: 100),
              child: FadeInAnimation(
                child: RoomListItem(
                  defaultHouse.rooms[index],
                  selectionOnly: true,
                  onPressed: () {
                    onSubmit(defaultHouse.rooms[index].id);
                  },
                ),
              ),
            );
          },
          padding:
              const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 80),
        ),
      ),
    );
  }
}
