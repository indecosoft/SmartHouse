import 'package:Homey/core/helpers/forms_helpers/form_validations.dart';
import 'package:Homey/core/helpers/utils.dart';
import 'package:Homey/rooms/presentation/add_room_view_model.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RoomName extends HookConsumerWidget {
  const RoomName({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roomNameController = useTextEditingController();
    return Form(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (MediaQuery.of(context).viewInsets.bottom == 0)
              Flexible(
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  heightFactor: 0.5,
                  child: FlareActor.asset(
                    AssetFlare(
                        bundle: rootBundle, name: 'assets/flare/add_room.flr'),
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    animation: 'animation',
                  ),
                ),
              ),
            const Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
            Text(
              'Enter your room name',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Utils.getPercentValueFromScreenWidth(8, context),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
            Consumer(builder: (context, ref, widget) {
              return ref.watch(roomTypesProvider).when(
                    data: (roomTypes) => Wrap(
                      spacing: 10,
                      children: roomTypes
                          .map(
                            (type) => GestureDetector(
                              onTap: () {
                                ref.read(
                                    createRoomProvider(type.name, type.id));
                              },
                              child: Chip(
                                label: Text(type.name),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    error: (err, stacktrace) => Text(err.toString()),
                    loading: () => const LinearProgressIndicator(),
                  );
            }),
            const Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: roomNameController,
              validator: FormValidation.simpleValidator,
              decoration: InputDecoration(
                labelText: 'Room name',
                prefixIcon: Icon(MdiIcons.floorPlan),
              ),
              onFieldSubmitted: (_) {
                ref.read(createRoomProvider(roomNameController.text, 16));
              },
            ),
            const Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
            Center(
              child: Consumer(builder: (context, ref, widget) {
                // ref.watch(createRoomProvider);
                return FilledButton.icon(
                  onPressed: () {
                    ref.read(createRoomProvider(roomNameController.text, 16));
                  },
                  icon: Icon(MdiIcons.plus),
                  label: const Text('Add room'),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
