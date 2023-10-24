import 'package:Homey/core/router.dart';
import 'package:Homey/dashboard/presentation/dashboard_view_model.dart';
import 'package:Homey/design/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});
  // final MenuState state;

  // final AppDataManager adm = AppDataManager();
  // final List<DropdownMenuItem<int>> houses =
  //     List<DropdownMenuItem<int>>.generate(AppDataManager().houses.length,
  //         (int i) {
  //   return DropdownMenuItem<int>(
  //     value: AppDataManager().houses[i].id,
  //     child: Text(AppDataManager().houses[i].name),
  //   );
  // });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsTheme.background,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Consumer(builder: (context, ref, widget) {
                final currentUser = ref.watch(currentUserProvider).value;
                return Row(
                  children: [
                    ClipOval(
                      child: Container(
                        color: ColorsTheme.primary,
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                currentUser?.firstName.characters.first
                                        .toUpperCase() ??
                                    '',
                                style: const TextStyle(fontSize: 24),
                              ),
                              Text(
                                currentUser?.lastName.characters.first
                                        .toUpperCase() ??
                                    '',
                                style: const TextStyle(fontSize: 24),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '${currentUser?.firstName} ${currentUser?.lastName}'),
                        Text('${currentUser?.email}'),
                      ],
                    ),
                    IconButton(
                      onPressed: () => ref.read(logoutProvider),
                      icon: Icon(MdiIcons.logout),
                    ),
                  ],
                );
              }),
              const Divider(
                height: 16,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: const ShapeDecoration(
                  shape: StadiumBorder(),
                  color: ColorsTheme.primary,
                ),
                child: Consumer(builder: (context, ref, child) {
                  final houses = ref.watch(housesListProvider).value ?? [];
                  final defaultHouse = ref.watch(defaultHouseProvider).value;
                  return DropdownButtonFormField<int>(
                    decoration:
                        const InputDecoration.collapsed(hintText: 'House'),
                    onChanged: (id) {
                      if (id != null) {
                        ref.read(changeDefaultHouseProvider(id));
                      }
                      Navigator.pop(context);
                    },
                    value: defaultHouse?.id,
                    items: houses
                        .map((e) =>
                            DropdownMenuItem(value: e.id, child: Text(e.name)))
                        .toList(),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
