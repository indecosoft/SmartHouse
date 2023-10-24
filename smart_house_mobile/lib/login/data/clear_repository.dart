import 'package:Homey/app_data_manager.dart';
import 'package:Homey/core/helpers/sql_helper/database.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'clear_repository.g.dart';

@riverpod
ClearRepository clearRepository(ClearRepositoryRef ref) => ClearRepository(
    ref.watch(isarProvider), ref.watch(sharedPreferencesProvider));

class ClearRepository {
  final Isar _isar;
  final SharedPreferences _sharedPreferences;

  ClearRepository(this._isar, this._sharedPreferences);

  Future<void> clear() async {
    await _isar.writeAsync((isar) => isar.clear());
    await _sharedPreferences.clear();
  }
}
