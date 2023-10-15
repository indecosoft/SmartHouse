import 'package:Homey/house/data/house_repository.dart';
import 'package:Homey/house/domain/house.dart';
import 'package:Homey/login/data/auth_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_view_model.g.dart';

@riverpod
Stream<List<House>> housesList(HousesListRef ref) {
  return ref.watch(houseRepositoryProvider).watchHouses();
}

@riverpod
Future<void> changeDefaultHouse(ChangeDefaultHouseRef ref, int id) {
  return ref.watch(houseRepositoryProvider).setDefaultHouse(id);
}

@riverpod
Future<void> logout(LogoutRef ref) {
  return ref.read(authUsecaseProvider).logout();
}
