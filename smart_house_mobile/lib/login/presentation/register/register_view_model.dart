import 'package:Homey/login/data/auth_response.dart';
import 'package:Homey/login/data/auth_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_view_model.g.dart';

@riverpod
class Register extends _$Register {
  @override
  FutureOr<AuthResponse?> build() async {
    return null;
  }

  Future<void> auth() async {
    state = const AsyncValue.loading();
    final form = ref.watch(registerFormProvider);
    try {
      state = AsyncValue.data(await ref.watch(authUsecaseProvider).register(
            firstName: form.firstName,
            lastName: form.lastName,
            email: form.email,
            password: form.password,
          ));
    } catch (e, stacktrace) {
      state = AsyncValue.error(e, stacktrace);
    }
  }
}

@riverpod
class RegisterPasswordToggle extends _$RegisterPasswordToggle {
  @override
  bool build() {
    return true;
  }

  void toggle() {
    state = !state;
  }
}

@riverpod
class RegisterPasswordConfirmationToggle
    extends _$RegisterPasswordConfirmationToggle {
  @override
  bool build() {
    return true;
  }

  void toggle() {
    state = !state;
  }
}

@riverpod
class RegisterForm extends _$RegisterForm {
  @override
  ({
    String email,
    String password,
    String passwordConfirmation,
    String firstName,
    String lastName,
    bool isTermsAndConditionsAccepted,
  }) build() {
    return (
      email: '',
      password: '',
      passwordConfirmation: '',
      firstName: '',
      lastName: '',
      isTermsAndConditionsAccepted: false,
    );
  }

  void copyWith({
    String? email,
    String? password,
    String? passwordConfirmation,
    String? firstName,
    String? lastName,
    bool? isTermsAndConditionsAccepted,
  }) {
    state = (
      email: email ?? state.email,
      password: password ?? state.password,
      passwordConfirmation: passwordConfirmation ?? state.passwordConfirmation,
      firstName: firstName ?? state.firstName,
      lastName: lastName ?? state.lastName,
      isTermsAndConditionsAccepted:
          isTermsAndConditionsAccepted ?? state.isTermsAndConditionsAccepted,
    );
  }
}
