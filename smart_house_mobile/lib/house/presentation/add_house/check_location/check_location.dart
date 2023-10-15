import 'dart:io';

import 'package:Homey/core/location_service.dart';
import 'package:Homey/house/presentation/add_house/check_location/get_location_view_model.dart';
import 'package:Homey/house/presentation/add_house/check_location/location_form_page.dart';
import 'package:Homey/house/presentation/add_house/check_location/location_received.dart';
import 'package:Homey/house/presentation/add_house/first_setup_template/first_setup_template_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CheckLocation extends ConsumerWidget {
  const CheckLocation({
    super.key,
    required this.submitEvent,
  });
  final Function() submitEvent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(isAddressManuallyEnteredProvider)) {
      return LocationFormPage(
        onSubmit: () {},
      );
    }

    return Consumer(builder: (context, ref, child) {
      final location = ref.watch(geocodedLocationProvider);
      return location.when(data: (placemark) {
        return LocationReceivedPage(
          title: '',
          address: placemark,
          animationPath: 'assets/flare/search_location.flr',
          animationName: 'search_location',
          onManualAddress: ref
              .watch(isAddressManuallyEnteredProvider.notifier)
              .setManuallyEntered,
          onAddressCorrect: submitEvent,
          buttonIcon: Platform.isAndroid
              ? const Icon(Icons.arrow_forward)
              : const Icon(Icons.arrow_forward_ios),
          hasButton: false,
          animationWidthFactor: 0.5,
          animationHeightFactor: 0.4,
        );
      }, error: (error, stacktrace) {
        return FirstSetupTemplatePage(
          title: 'We are sorry',
          description: error.toString(),
          animationPath: 'assets/flare/search_location.flr',
          animationName: 'search_location',
          submitEvent: ref
              .watch(isAddressManuallyEnteredProvider.notifier)
              .setManuallyEntered,
          buttonIcon: Platform.isAndroid
              ? const Icon(Icons.arrow_forward)
              : const Icon(Icons.arrow_forward_ios),
          buttonText: 'Enter address manually',
          animationWidthFactor: 0.5,
          animationHeightFactor: 0.3,
        );
      }, loading: () {
        return FirstSetupTemplatePage(
          buttonIcon: Icon(MdiIcons.arrowRight),
          title: 'Please wait',
          description: 'We are trying to get your location for you',
          animationPath: 'assets/flare/search_location.flr',
          animationName: 'search_location',
          submitEvent: submitEvent,
          hasButton: false,
          animationWidthFactor: 0.5,
          animationHeightFactor: 0.3,
        );
      });
    });
  }
}
