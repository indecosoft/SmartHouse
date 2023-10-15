import 'package:Homey/add_device/domain/device.dart';
import 'package:Homey/design/colors.dart';
import 'package:Homey/design/widgets/network_status.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DeviceListItem extends StatelessWidget {
  const DeviceListItem({
    super.key,
    required this.device,
    this.onPressed,
    this.action,
    this.selected = false,
  });

  final Device device;
  final VoidCallback? onPressed;
  final Widget? action;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 20,
      color: ColorsTheme.backgroundCard,
      child: InkWell(
        splashColor: ColorsTheme.backgroundDarker,
        onTap: onPressed,
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  // Icon( sensor.sensorType DataTypes.sensorsType[]?['icon']),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(device.name),
                  const Spacer(),
                  if (action != null)
                    action!
                  else
                    NetworkStatusLabel(online: device.isOnline),
                ],
              ),
            ),
            if (selected)
              Positioned.fill(
                child: Container(
                  color: ColorsTheme.backgroundDarker.withOpacity(0.6),
                  child: Center(
                    child: Icon(MdiIcons.check),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
