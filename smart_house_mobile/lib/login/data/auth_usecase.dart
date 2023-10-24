import 'package:Homey/house/data/house_repository.dart';
import 'package:Homey/login/data/auth_repository.dart';
import 'package:Homey/login/data/auth_response.dart';
import 'package:Homey/login/data/clear_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_usecase.g.dart';

@riverpod
AuthUsecase authUsecase(AuthUsecaseRef ref) => AuthUsecase(
      ref.watch(authRepositoryProvider),
      ref.watch(houseRepositoryProvider),
      ref.watch(clearRepositoryProvider),
    );

class AuthUsecase {
  final AuthRepository _authRepository;
  final HouseRepository _houseRepository;
  final ClearRepository _clearRepository;

  const AuthUsecase(
      this._authRepository, this._houseRepository, this._clearRepository);

  Future<AuthResponse> login(
      {required String email, required String password}) async {
    final AuthResponse response =
        await _authRepository.login(email: email, password: password);

    if (response.defaultHouse != null) {
      _houseRepository
          .addHouse(response.defaultHouse!.copyWith(isDefault: true));
    }
    _houseRepository.addHouses(response.houses);
    return response;
  }

  Future<AuthResponse> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) =>
      _authRepository.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );
  Future<void> logout() async {
    await _clearRepository.clear();
  }
}
