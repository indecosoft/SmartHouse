import 'package:Homey/app_data_manager.dart';
import 'package:Homey/login/data/auth_response.dart';
import 'package:Homey/login/data/login_api.dart';
import 'package:Homey/login/data/users_dao.dart';
import 'package:Homey/login/domain/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) => AuthRepository(
      ref.watch(loginApiProvider),
      ref.watch(usersDaoProvider),
      ref.watch(sharedPreferencesProvider),
    );

class AuthRepository {
  final AuthApi _authApi;
  final UsersDao _usersDao;
  final SharedPreferences _sharedPreferences;

  AuthRepository(this._authApi, this._usersDao, this._sharedPreferences);

  Future<AuthResponse> login(
      {required String email, required String password}) async {
    final AuthResponse response = await _authApi.login(email, password);
    await _sharedPreferences.setString('token', response.token);
    await _usersDao.insertOrReplace(response.user);
    return response;
  }

  Future<AuthResponse> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final AuthResponse response =
        await _authApi.register(firstName, lastName, email, password);
    await _sharedPreferences.setString('token', response.token);
    await _usersDao.insertOrReplace(response.user);
    return response;
  }

  Stream<User?> watchCurrentUser() {
    return _usersDao.watchCurrentUser();
  }
}
