import 'package:Homey/core/helpers/sql_helper/database.dart';
import 'package:Homey/house/domain/house.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'houses_dao.g.dart';

@riverpod
HousesDao housesDao(HousesDaoRef ref) =>
    HousesDao(isar: ref.watch(isarProvider));

class HousesDao {
  final Isar isar;

  HousesDao({required this.isar});

  void addHouse(final House house) {
    isar.write((isar) {
      isar.houses.put(house);
    });
  }

  void addHouses(final List<House> houses) {
    isar.write((isar) {
      isar.houses.putAll(houses);
    });
  }

  Future<void> setDefaultHouse(final int houseId) async {
    await isar.writeAsync((isar) {
      isar.houses.where().updateAll(isDefault: false);
      isar.houses.update(id: houseId, isDefault: true);
    });
  }

  House? get defaultHouse {
    return isar.houses.where().isDefaultEqualTo(true).findFirst();
  }

  Stream<House?> watchDefaultHouse() async* {
    yield isar.houses.where().isDefaultEqualTo(true).findFirst();
    yield* isar.houses
        .where()
        .isDefaultEqualTo(true)
        .watch(limit: 1)
        .map((e) => e.firstOrNull);
  }

  Stream<List<House>> watchHouses() async* {
    yield isar.houses.where().sortByIsDefaultDesc().findAll();
    yield* isar.houses.where().sortByIsDefaultDesc().watch();
  }
}
