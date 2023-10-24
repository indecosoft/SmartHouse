import 'package:Homey/login/data/auth_response.dart';
import 'package:Homey/login/data/auth_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_view_model.g.dart';

// @riverpod
// Future<AuthResponse> login(LoginRef ref) {
//   final form = ref.watch(loginFormProvider);
//   return ref
//       .watch(authUsecaseProvider)
//       .login(email: form.email, password: form.password);
// }

@riverpod
class Login extends _$Login {
  @override
  FutureOr<AuthResponse?> build() async {
    return null;
  }

  Future<void> auth() async {
    state = const AsyncValue.loading();
    final form = ref.watch(loginFormProvider);
    try {
      state = AsyncValue.data(await ref
          .watch(authUsecaseProvider)
          .login(email: form.email, password: form.password));
    } catch (e, stacktrace) {
      state = AsyncValue.error(e, stacktrace);
    }
  }
}

@riverpod
class LoginPasswordToggle extends _$LoginPasswordToggle {
  @override
  bool build() {
    return true;
  }

  void toggle() {
    state = !state;
  }
}

@riverpod
class LoginForm extends _$LoginForm {
  @override
  ({String email, String password}) build() {
    return (email: '', password: '');
  }

  void copyWith({String? email, String? password}) {
    state = (email: email ?? state.email, password: password ?? state.password);
  }
}
