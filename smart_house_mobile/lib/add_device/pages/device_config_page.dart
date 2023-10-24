import 'package:Homey/add_device/domain/device_details.dart';
import 'package:Homey/add_device/pages/device_config_view_model.dart';
import 'package:Homey/core/helpers/forms_helpers/form_validations.dart';
import 'package:Homey/core/helpers/forms_helpers/forms_helpers.dart';
import 'package:Homey/design/colors.dart';
import 'package:Homey/design/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DeviceConfig extends HookConsumerWidget {
  DeviceConfig({
    super.key,
    required this.submit,
    required this.deviceIp,
  });
  final ValueChanged<DeviceDetails> submit;
  final String deviceIp;
  // final AddDeviceState state;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController sensorNameController =
        useTextEditingController();
    final TextEditingController readingFrequencyController =
        useTextEditingController();
    final TextEditingController serverController = useTextEditingController();

    final TextEditingController portController = useTextEditingController();
    ref.listen(deviceDetailsProvider(deviceIp), (prev, next) {
      sensorNameController.text = next.value?.sensorName ?? '';
      readingFrequencyController.text =
          next.value?.freqMinutes.toString() ?? '';
      serverController.text = '89.37.212.155';
      portController.text = next.value?.port.toString() ?? '';
    });
    final deviceDetails = ref.watch(deviceDetailsProvider(deviceIp)).value;
    final state = ref.watch(saveDeviceDetailsProvider);
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(deviceDetails?.sensorType.icon ?? MdiIcons.help, size: 40),
              const SizedBox(
                height: 10,
              ),
              Text(
                deviceDetails?.sensorType.typeName ?? 'Unknown device',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 30),
              ),
              CustomTextField(
                inputType: TextInputType.text,
                icon: Icon(MdiIcons.text),
                enabled: !state.isLoading,
                controller: sensorNameController,
                validator: FormValidation.simpleValidator,
                suffix: IconButton(
                  onPressed: () {
                    FormHelpers.clearField(sensorNameController);
                  },
                  icon: const Icon(
                    Icons.clear,
                  ),
                ),
                placeholder: 'Sensor name',
              ),
              CustomTextField(
                inputType: TextInputType.number,
                icon: Icon(MdiIcons.clockOutline),
                enabled: !state.isLoading,
                controller: readingFrequencyController,
                placeholder: 'Reading frequency',
                validator: FormValidation.simpleValidator,
                suffix: IconButton(
                  onPressed: () {
                    FormHelpers.clearField(readingFrequencyController);
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
              CustomTextField(
                inputType: TextInputType.url,
                icon: Icon(MdiIcons.server),
                enabled: !state.isLoading,
                placeholder: 'Server',
                controller: serverController,
                validator: FormValidation.simpleValidator,
                suffix: IconButton(
                  onPressed: () {
                    FormHelpers.clearField(serverController);
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
              CustomTextField(
                inputType: TextInputType.number,
                icon: Icon(MdiIcons.numeric),
                enabled: !state.isLoading,
                placeholder: 'Port',
                validator: FormValidation.simpleValidator,
                controller: portController,
                suffix: IconButton(
                  onPressed: () {
                    FormHelpers.clearField(portController);
                  },
                  icon: const Icon(Icons.clear),
                ),
                onSubmitted: () {
                  submit(deviceDetails!.copyWith(
                    freqMinutes: int.parse(readingFrequencyController.text),
                    server: serverController.text,
                    port: int.parse(portController.text),
                    sensorName: sensorNameController.text,
                  ));
                },
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              FloatingActionButton.extended(
                onPressed: state.isLoading
                    ? null
                    : () => submit(deviceDetails!.copyWith(
                          freqMinutes:
                              int.parse(readingFrequencyController.text),
                          server: serverController.text,
                          port: int.parse(portController.text),
                          sensorName: sensorNameController.text,
                        )),
                icon: const Icon(Icons.check),
                backgroundColor: ColorsTheme.primary,
                label: Text(
                    state.isLoading ? 'Saving configuration' : 'Select room'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
