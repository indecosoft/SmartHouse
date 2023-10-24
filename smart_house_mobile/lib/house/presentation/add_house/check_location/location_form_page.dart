import 'package:Homey/core/helpers/forms_helpers/form_validations.dart';
import 'package:Homey/house/presentation/add_house/add_house_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LocationFormPage extends HookConsumerWidget {
  const LocationFormPage({
    super.key,
    required this.onSubmit,
  });

  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(addHouseFormProvider);

    final TextEditingController countryController =
        useTextEditingController(text: form.country);
    final TextEditingController countyController =
        useTextEditingController(text: form.county);
    final TextEditingController localityController =
        useTextEditingController(text: form.locality);
    final TextEditingController streetController =
        useTextEditingController(text: form.street);
    final TextEditingController numberController =
        useTextEditingController(text: form.streetNumber);

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: countryController,
                validator: FormValidation.simpleValidator,
                onChanged: (value) {
                  ref
                      .read(addHouseFormProvider.notifier)
                      .copyWith(country: value);
                },
                decoration: InputDecoration(
                  labelText: 'Country',
                  prefixIcon: Icon(MdiIcons.map),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.text,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: countyController,
                validator: FormValidation.simpleValidator,
                onChanged: (value) {
                  ref
                      .read(addHouseFormProvider.notifier)
                      .copyWith(county: value);
                },
                decoration: InputDecoration(
                  labelText: 'County',
                  prefixIcon: Icon(MdiIcons.mapMarker),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: localityController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: FormValidation.simpleValidator,
                onChanged: (value) {
                  ref
                      .read(addHouseFormProvider.notifier)
                      .copyWith(locality: value);
                },
                decoration: InputDecoration(
                  labelText: 'Locality',
                  prefixIcon: Icon(MdiIcons.homeCity),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: streetController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: FormValidation.simpleValidator,
                      onChanged: (value) {
                        ref
                            .read(addHouseFormProvider.notifier)
                            .copyWith(street: value);
                      },
                      decoration: InputDecoration(
                        labelText: 'Street',
                        prefixIcon: Icon(MdiIcons.account),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: numberController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: FormValidation.simpleValidator,
                      onChanged: (value) {
                        ref
                            .read(addHouseFormProvider.notifier)
                            .copyWith(streetNumber: value);
                      },
                      decoration: InputDecoration(
                        labelText: 'Number',
                        prefixIcon: Icon(MdiIcons.numeric),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Builder(builder: (context) {
                return FilledButton.icon(
                  onPressed: () {
                    if (Form.of(context).validate()) {
                      onSubmit();
                    }
                  },
                  label: const Text('Add your house'),
                  icon: Icon(MdiIcons.check),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
