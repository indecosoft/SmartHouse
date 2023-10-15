import 'package:Homey/add_device/domain/device.dart';
import 'package:Homey/core/helpers/forms_helpers/form_validations.dart';
import 'package:Homey/core/resource.dart';
import 'package:Homey/core/router_helpers.dart';
import 'package:Homey/design/colors.dart';
import 'package:Homey/design/rooms_styles.dart';
import 'package:Homey/design/widgets/buttons/round_button.dart';
import 'package:Homey/design/widgets/device_list_item.dart';
import 'package:Homey/design/widgets/textfield.dart';
import 'package:Homey/rooms/domain/room.dart';
import 'package:Homey/rooms/presentation/add_room_view_model.dart';
import 'package:Homey/rooms/presentation/room_edit_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RoomEditPage extends HookConsumerWidget {
  const RoomEditPage({super.key, required this.room});

  final Room room;

  Widget getHeader(String image) {
    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment(0, -0.5),
          end: Alignment.bottomCenter,
          colors: <Color>[ColorsTheme.background, Colors.transparent],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      blendMode: BlendMode.dstIn,
      child: FractionallySizedBox(
        heightFactor: 0.25,
        widthFactor: 1,
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
              ColorsTheme.background.withOpacity(0.3), BlendMode.multiply),
          child: Image.asset(
            image == '' ? 'assets/images/custom_room.jpg' : image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController roomNameController =
        useTextEditingController(text: room.name);
    final Map<String, dynamic> style =
        RoomsStyles(name: room.name).getRoomStyle();
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToDeviceSelector(context, room.id);
        },
        backgroundColor: Colors.white,
        child: Icon(MdiIcons.plus),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RoundButton(
            icon: Icon(MdiIcons.chevronLeft, color: Colors.black),
            padding: const EdgeInsets.all(8),
            onPressed: () {
              GoRouter.of(context).pop();
              // _state
              //   .updateRoom(onUpdateResult)
              //   .then((_) => Navigator.pop(context));
            },
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              room.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 18),
            ),
            RoundButton(
              onPressed: () {
                ref.read(deleteRoomProvider(room.id));
                returnHome(context);
              },
              padding: const EdgeInsets.all(12),
              backgroundColor: Colors.red,
              icon:
                  Icon(MdiIcons.trashCanOutline, color: Colors.white, size: 16),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: getHeader(style['image']),
          ),
          Align(
            alignment: const Alignment(0, -0.5),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomTextField(
                inputType: TextInputType.text,
                icon: Icon(MdiIcons.email),
                controller: roomNameController,
                validator: FormValidation.simpleValidator,
                placeholder: 'Room name',
                onSubmitted: () => FocusScope.of(context).unfocus(),
                textLength: 50,
                onChanged: (_) {},
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              heightFactor: 0.65,
              child: Consumer(
                builder: (context, ref, widget) {
                  final List<Device> devices =
                      ref.watch(roomDevicesProvider(room.id)).value ?? [];
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: devices.length,
                    itemBuilder: (context, index) {
                      return DeviceListItem(
                        device: devices[index],
                        action: RoundButton(
                          padding: const EdgeInsets.all(8),
                          onPressed: () {
                            ref.read(removeDeviceFromRoomProvider(
                                devices[index].macAddress));
                          },
                          icon:
                              Icon(MdiIcons.close, color: Colors.red, size: 16),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onResult(dynamic data, ApiState state) {
    // switch (state) {
    //   case ApiState.error:
    //     if (Navigator.canPop(context)) {
    //       Navigator.pop(context);
    //     }
    //     Dialogs.showSimpleDialog('Error', data, context);
    //     break;
    //   case ApiState.successful:
    //     if (Navigator.canPop(context)) {
    //       Navigator.pop(context);
    //     }
    //     break;
    //   case ApiState.loading:
    //     Dialogs.showProgressDialog(data, context);
    //     break;
    // }
  }

  void onDeleteResult(dynamic data, ApiState state) {
    // switch (state) {
    //   case ApiState.error:
    //     if (Navigator.canPop(context)) {
    //       Navigator.pop(context);
    //     }
    //     Dialogs.showSimpleDialog('Error', data, context);
    //     break;
    //   case ApiState.successful:
    //     if (Navigator.canPop(context)) {
    //       Navigator.pop(context);
    //       Navigator.pushReplacement(
    //           context, MaterialPageRoute<Menu>(builder: (_) => Menu()));
    //     }
    //     break;
    //   case ApiState.loading:
    //     Dialogs.showProgressDialog(data, context);
    //     break;
    // }
  }

  void onUpdateResult(dynamic data, ApiState state) {
    // switch (state) {
    //   case ApiState.error:
    //     if (Navigator.canPop(context)) {
    //       Navigator.pop(context);
    //     }
    //     Dialogs.showSimpleDialog('Error', data, context);
    //     break;
    //   case ApiState.successful:
    //     if (Navigator.canPop(context)) {
    //       Navigator.pop(context);
    //     }
    //     break;
    //   case ApiState.loading:
    //     Dialogs.showProgressDialog(data, context);
    //     break;
    // }
  }
}
