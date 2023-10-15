import 'package:Homey/core/helpers/forms_helpers/form_validations.dart';
import 'package:Homey/core/helpers/utils.dart';
import 'package:Homey/design/colors.dart';
import 'package:Homey/house/presentation/add_house/add_house_view_model.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FirstPage extends HookConsumerWidget {
  FirstPage({
    super.key,
    required this.submitEvent,
    required this.buttonIcon,
    this.buttonText = '',
    this.buttonColor = Colors.green,
    this.backgroundColor = ColorsTheme.background,
    this.hasButton = true,
    required this.animationWidthFactor,
    required this.animationHeightFactor,
    required this.animationPath,
    required this.animationName,
    required this.title,
    this.description = '',
  });

  final Function() submitEvent;
  final bool hasButton;
  final Icon buttonIcon;
  final Color buttonColor, backgroundColor;
  final double animationWidthFactor, animationHeightFactor;
  final String animationPath, title, description, buttonText, animationName;
  final TextEditingController homeNameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeNameController = useTextEditingController(
        text: ref.watch(addHouseFormProvider).houseName);

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 192,
                child: FlareActor.asset(
                  AssetFlare(bundle: rootBundle, name: animationPath),
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  animation: animationName,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Utils.getPercentValueFromScreenWidth(8, context),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: Utils.getPercentValueFromScreenWidth(5, context)),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                  keyboardType: TextInputType.text,
                  controller: homeNameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: FormValidation.simpleValidator,
                  onChanged: (value) => ref
                      .read(addHouseFormProvider.notifier)
                      .copyWith(houseName: value),
                  decoration: InputDecoration(
                    labelText: 'Home name',
                    prefixIcon: Icon(MdiIcons.home),
                  )),
              const SizedBox(
                height: 16,
              ),
              if (hasButton)
                Builder(builder: (context) {
                  return FilledButton.icon(
                    onPressed: () {
                      if (Form.of(context).validate()) {
                        submitEvent();
                      }
                    },
                    label: Text(buttonText),
                    icon: buttonIcon,
                  );
                }),
            ],
          ),
        ),
      ),
    );
  }
}
