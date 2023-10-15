import 'package:Homey/core/helpers/forms_helpers/form_validations.dart';
import 'package:Homey/design/widgets/buttons/custom_button.dart';
import 'package:Homey/design/widgets/buttons/round_button.dart';
import 'package:Homey/login/presentation/register/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register',
          style: TextStyle(color: Colors.white, fontFamily: 'Sriracha'),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RoundButton(
            icon: Icon(MdiIcons.chevronLeft, color: Colors.black),
            padding: const EdgeInsets.all(8),
            onPressed: GoRouter.of(context).pop,
          ),
        ),
      ),
      body: Builder(
        builder: (context) => Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Consumer(builder: (context, ref, child) {
                    if (ref.watch(registerProvider).isLoading) {
                      return const LinearProgressIndicator();
                    }
                    if (ref.watch(registerProvider).hasError) {
                      return Text(
                        'Email already in use',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error),
                        textAlign: TextAlign.center,
                      );
                    }

                    return const SizedBox.shrink();
                  }),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Consumer(
                          builder: (context, ref, widget) {
                            return TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.name,
                              enabled: !ref.watch(registerProvider).isLoading,
                              onChanged: (value) => ref
                                  .watch(registerFormProvider.notifier)
                                  .copyWith(firstName: value),
                              decoration: InputDecoration(
                                prefixIcon: Icon(MdiIcons.accountOutline),
                                labelText: 'First Name',
                                alignLabelWithHint: true,
                              ),
                              validator: FormValidation.simpleValidator,
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Consumer(
                          builder: (context, ref, widget) {
                            return TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.name,
                              enabled: !ref.watch(registerProvider).isLoading,
                              onChanged: (value) => ref
                                  .watch(registerFormProvider.notifier)
                                  .copyWith(lastName: value),
                              decoration: InputDecoration(
                                prefixIcon: Icon(MdiIcons.accountOutline),
                                labelText: 'Last Name',
                                alignLabelWithHint: true,
                              ),
                              validator: FormValidation.simpleValidator,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Consumer(
                    builder: (context, ref, widget) {
                      return TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.emailAddress,
                        enabled: !ref.watch(registerProvider).isLoading,
                        onChanged: (value) => ref
                            .watch(registerFormProvider.notifier)
                            .copyWith(email: value),
                        decoration: InputDecoration(
                          prefixIcon: Icon(MdiIcons.emailOutline),
                          labelText: 'Email',
                          alignLabelWithHint: true,
                        ),
                        validator: FormValidation.emailValidator,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Consumer(builder: (context, ref, widget) {
                    return TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: ref.watch(registerPasswordToggleProvider),
                      validator: FormValidation.passwordValidator,
                      enabled: !ref.watch(registerProvider).isLoading,
                      onChanged: (value) => ref
                          .watch(registerFormProvider.notifier)
                          .copyWith(password: value),
                      decoration: InputDecoration(
                        prefixIcon: Icon(MdiIcons.lockOutline),
                        suffixIcon: IconButton(
                          onPressed: () {
                            ref
                                .read(registerPasswordToggleProvider.notifier)
                                .toggle();
                          },
                          icon: Icon(
                            ref.watch(registerPasswordToggleProvider)
                                ? MdiIcons.eyeOffOutline
                                : MdiIcons.eyeOutline,
                          ),
                        ),
                        labelText: 'Password',
                        alignLabelWithHint: true,
                      ),
                    );
                  }),
                  const SizedBox(height: 16),
                  Consumer(builder: (context, ref, widget) {
                    return TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText:
                          ref.watch(registerPasswordConfirmationToggleProvider),
                      enabled: !ref.watch(registerProvider).isLoading,
                      validator: (value) {
                        final String? res =
                            FormValidation.passwordValidator(value);
                        if (res == null) {
                          if (value !=
                              ref.watch(registerFormProvider).password) {
                            return 'Password doesn\'t match';
                          }
                        } else {
                          return res;
                        }
                        return null;
                      },
                      onChanged: (value) => ref
                          .watch(registerFormProvider.notifier)
                          .copyWith(passwordConfirmation: value),
                      decoration: InputDecoration(
                        prefixIcon: Icon(MdiIcons.lockOutline),
                        suffixIcon: IconButton(
                          onPressed: () {
                            ref
                                .read(registerPasswordConfirmationToggleProvider
                                    .notifier)
                                .toggle();
                          },
                          icon: Icon(
                            ref.watch(
                                    registerPasswordConfirmationToggleProvider)
                                ? MdiIcons.eyeOffOutline
                                : MdiIcons.eyeOutline,
                          ),
                        ),
                        labelText: 'Password',
                        alignLabelWithHint: true,
                      ),
                    );
                  }),
                  const SizedBox(height: 16),
                  Consumer(builder: (context, ref, widget) {
                    return CheckboxListTile(
                      value: ref
                          .watch(registerFormProvider)
                          .isTermsAndConditionsAccepted,
                      onChanged: (value) => ref
                          .watch(registerFormProvider.notifier)
                          .copyWith(isTermsAndConditionsAccepted: value),
                      title: const Text('I accept the Terms and Conditions'),
                    );
                  }),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: OutlinedButton(
                          child: const Text('Cancel'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: Builder(builder: (context) {
                          return CustomButton(
                            text: 'Register',
                            onPressed: ref.watch(registerProvider).isLoading
                                ? null
                                : () {
                                    if (Form.of(context).validate() &&
                                        ref
                                            .read(registerFormProvider)
                                            .isTermsAndConditionsAccepted) {
                                      ref
                                          .read(registerProvider.notifier)
                                          .auth();
                                    }
                                  },
                          );
                        }),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
