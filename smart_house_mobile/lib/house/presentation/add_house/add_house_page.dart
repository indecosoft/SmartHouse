import 'package:Homey/core/router_helpers.dart';
import 'package:Homey/design/widgets/buttons/round_button.dart';
import 'package:Homey/house/presentation/add_house/add_house_view_model.dart';
import 'package:Homey/house/presentation/add_house/check_location/location_form_page.dart';
import 'package:Homey/house/presentation/add_house/first_page/first_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddHousePage extends HookConsumerWidget {
  const AddHousePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = usePageController();
    ref.listen(addNewHouseProvider, (prev, next) {
      if (next.isLoading) {
        showDialog(
            context: context,
            builder: (context) => const AlertDialog(
                  content: Row(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(
                        width: 16,
                      ),
                      Text('Loading...'),
                    ],
                  ),
                ));
        return;
      }
      if (next.hasError) {
        Navigator.of(context).pop();
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: const Text('An error occurred'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    )
                  ],
                ));
        return;
      }
      if (next.value != null) {
        returnHome(context);
      }
    });
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RoundButton(
            icon: Icon(MdiIcons.chevronLeft, color: Colors.black),
            padding: const EdgeInsets.all(8),
            onPressed: GoRouter.of(context).pop,
          ),
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: <Widget>[
          FirstPage(
            title: 'Add a new house',
            buttonIcon: Icon(MdiIcons.arrowRight),
            animationHeightFactor: 0.5,
            animationWidthFactor: 0.9,
            animationName: 'Idle',
            buttonText: 'Next',
            animationPath: 'assets/flare/home_settings.flr',
            submitEvent: () {
              controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
          ),
          LocationFormPage(
            onSubmit: ref.read(addNewHouseProvider.notifier).addNewHouse,
          ),
        ],
      ),
    );
  }
}
