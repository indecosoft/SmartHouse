import 'package:Homey/add_device/add_device_view_model.dart';
import 'package:Homey/core/helpers/forms_helpers/form_validations.dart';
import 'package:Homey/core/helpers/utils.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EspTouchConfigPage extends HookConsumerWidget {
  EspTouchConfigPage({super.key, required this.onSmartConfigDone});

  final VoidCallback onSmartConfigDone;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController passwordController = useTextEditingController();
    final TextEditingController ssidController = useTextEditingController();

    final connectivityResult = ref.watch(connectivitResultProvider);
    ref
      ..listen(networkDetailsProvider, (prev, next) {
        ssidController.text = next.value?.wifiName ?? '';
      })
      ..listen(asyncConfigDeviceProvider, (prev, next) {
        if (next.value != null) {
          onSmartConfigDone();
        }
      });
    final state = ref.watch(asyncConfigDeviceProvider);
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: connectivityResult.value != ConnectivityResult.wifi
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      width: Utils.getPercentValueFromScreenWidth(70, context),
                      height:
                          Utils.getPercentValueFromScreenHeight(30, context),
                      child: FlareActor.asset(
                        AssetFlare(
                            bundle: rootBundle,
                            name: 'assets/flare/no_wifi.flr'),
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                        animation: 'init',
                      ),
                    ),
                    const Text(
                      'You have to be connected to a 2G WiFi network',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              : Form(
                  // autovalidate: state.networkConfigAutoValidate,
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        MdiIcons.wifi,
                        size: 80,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Make sure you are connected to a 2G WiFi network',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        enabled: false,
                        controller: ssidController,
                        decoration: InputDecoration(
                          label: const Text('SSID'),
                          prefixIcon: Icon(MdiIcons.routerWireless),
                          suffixIcon: IconButton(
                            icon: Icon(MdiIcons.refresh),
                            onPressed: () {
                              ref.invalidate(networkDetailsProvider);
                              // _networkState.getNetworkInfo(onResult: onResult);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Consumer(
                        builder: (context, ref, widget) {
                          return TextFormField(
                              keyboardType: TextInputType.text,
                              obscureText:
                                  ref.watch(wifiPasswordToggleProvider),
                              validator: FormValidation.simpleValidator,
                              controller: passwordController,
                              enabled: !state.isLoading,
                              onFieldSubmitted: (_) {},
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: Icon(MdiIcons.lockOutline),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    ref
                                        .read(
                                            wifiPasswordToggleProvider.notifier)
                                        .toggle();
                                  },
                                  icon: Icon(
                                    ref.watch(wifiPasswordToggleProvider)
                                        ? MdiIcons.eyeOffOutline
                                        : MdiIcons.eyeOutline,
                                  ),
                                ),
                              ));
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Consumer(builder: (context, ref, widget) {
                        final state = ref.watch(asyncConfigDeviceProvider);

                        return FilledButton.icon(
                          onPressed: state.isLoading
                              ? null
                              : () {
                                  ref
                                      .read(asyncConfigDeviceProvider.notifier)
                                      .start(
                                          ssidController.text,
                                          ref
                                                  .read(networkDetailsProvider)
                                                  .value
                                                  ?.bssid ??
                                              '',
                                          passwordController.text);
                                },
                          icon: Icon(MdiIcons.check),
                          label: Text(state.isLoading
                              ? 'Configuring device'
                              : 'Start Config'),
                        );
                      }),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
