import 'package:Homey/add_device/domain/device_types.dart';
import 'package:Homey/core/router_helpers.dart';
import 'package:Homey/design/widgets/device_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DevicesHorizontalScroll extends StatelessWidget {
  const DevicesHorizontalScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 136,
      child: AnimationLimiter(
        child: ListView(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            AnimationConfiguration.staggeredList(
              position: 1,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                verticalOffset: -115,
                child: FadeInAnimation(
                  child: DeviceCard(
                    icon: MdiIcons.thermometer,
                    onPressed: () {
                      navigateToDevices(context,
                          deviceType: DeviceType.tempAndHumidity);
                    },
                    label: 'Temperature',
                  ),
                ),
              ),
            ),
            AnimationConfiguration.staggeredList(
              position: 2,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                verticalOffset: -115,
                child: FadeInAnimation(
                  child: DeviceCard(
                    icon: MdiIcons.weatherSunny,
                    onPressed: () {
                      navigateToDevices(context, deviceType: DeviceType.uv);
                    },
                    label: 'UV',
                  ),
                ),
              ),
            ),
            AnimationConfiguration.staggeredList(
              position: 3,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                verticalOffset: -115,
                child: FadeInAnimation(
                  child: DeviceCard(
                    icon: MdiIcons.smokeDetector,
                    onPressed: () {
                      navigateToDevices(context,
                          deviceType: DeviceType.gasAndSmoke);
                    },
                    label: 'Smoke',
                  ),
                ),
              ),
            ),
            AnimationConfiguration.staggeredList(
              position: 4,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                verticalOffset: -115,
                child: FadeInAnimation(
                  child: DeviceCard(
                    icon: MdiIcons.themeLightDark,
                    onPressed: () {
                      navigateToDevices(context, deviceType: DeviceType.light);
                    },
                    label: 'Light',
                  ),
                ),
              ),
            ),
            AnimationConfiguration.staggeredList(
              position: 5,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                verticalOffset: -115,
                child: FadeInAnimation(
                  child: DeviceCard(
                    icon: MdiIcons.powerSocketEu,
                    onPressed: () {
                      navigateToDevices(context, deviceType: DeviceType.plug);
                    },
                    label: 'Switches',
                  ),
                ),
              ),
            ),
            AnimationConfiguration.staggeredList(
              position: 6,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                verticalOffset: -115,
                child: FadeInAnimation(
                  child: DeviceCard(
                    icon: MdiIcons.door,
                    onPressed: () {
                      navigateToDevices(context,
                          deviceType: DeviceType.contact);
                    },
                    label: 'Door/Window',
                  ),
                ),
              ),
            ),
            AnimationConfiguration.staggeredList(
              position: 7,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                verticalOffset: -115,
                child: FadeInAnimation(
                  child: DeviceCard(
                    icon: MdiIcons.playSpeed,
                    onPressed: () {},
                    label: 'Scenes',
                  ),
                ),
              ),
            ),
            AnimationConfiguration.staggeredList(
              position: 8,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                verticalOffset: -115,
                child: FadeInAnimation(
                  child: DeviceCard(
                    icon: MdiIcons.dotsHorizontal,
                    onPressed: () {
                      navigateToUnassignedDevices(context);
                    },
                    label: 'Unassigned',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
