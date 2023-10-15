import 'package:Homey/core/helpers/forms_helpers/form_validations.dart';
import 'package:Homey/core/logger.dart';
import 'package:Homey/core/router_helpers.dart';
import 'package:Homey/design/colors.dart';
import 'package:Homey/login/presentation/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorsTheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      'assets/images/Logo.png',
                      height: 60,
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Homey',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Sriracha',
                        fontSize: 35,
                      ),
                    ),
                  ),
                  Consumer(builder: (context, ref, child) {
                    if (ref.watch(loginProvider).isLoading) {
                      return const LinearProgressIndicator();
                    }
                    if (ref.watch(loginProvider).hasError) {
                      return Text(
                        'Invalid email or password',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error),
                        textAlign: TextAlign.center,
                      );
                    }

                    return const SizedBox.shrink();
                  }),
                  const SizedBox(height: 16),
                  Consumer(builder: (context, ref, child) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: FormValidation.emailValidator,
                      enabled: !ref.watch(loginProvider).isLoading,
                      onChanged: (value) => ref
                          .watch(loginFormProvider.notifier)
                          .copyWith(email: value),
                      decoration: InputDecoration(
                        prefixIcon: Icon(MdiIcons.email),
                        labelText: 'Email',
                        alignLabelWithHint: true,
                      ),
                    );
                  }),
                  const SizedBox(height: 16),
                  Consumer(builder: (context, ref, child) {
                    return TextFormField(
                      obscureText: ref.watch(loginPasswordToggleProvider),
                      validator: FormValidation.simpleValidator,
                      onChanged: (value) => ref
                          .watch(loginFormProvider.notifier)
                          .copyWith(password: value),
                      enabled: !ref.watch(loginProvider).isLoading,
                      decoration: InputDecoration(
                        prefixIcon: Icon(MdiIcons.lockOutline),
                        suffixIcon: IconButton(
                          onPressed: () {
                            ref
                                .read(loginPasswordToggleProvider.notifier)
                                .toggle();
                          },
                          icon: Icon(
                            ref.watch(loginPasswordToggleProvider)
                                ? MdiIcons.eyeOffOutline
                                : MdiIcons.eyeOutline,
                          ),
                        ),
                        labelText: 'Password',
                        alignLabelWithHint: true,
                      ),
                      onFieldSubmitted: (_) => ref.read(loginProvider),
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: GestureDetector(
                      onTap: () => logger.i('password Forgot'),
                      child: const Text(
                        'Forgot your password?',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: OutlinedButton(
                          child: const Text('Register'),
                          onPressed: () => ref.watch(loginProvider).isLoading
                              ? null
                              : navigateToRegister(context),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: FilledButton(
                          child: const Text('Login'),
                          onPressed: () => ref.watch(loginProvider).isLoading
                              ? null
                              : ref.read(loginProvider.notifier).auth(),
                        ),
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
