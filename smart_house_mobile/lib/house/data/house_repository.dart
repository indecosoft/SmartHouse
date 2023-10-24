import 'package:Homey/house/data/house_api.dart';
import 'package:Homey/house/data/houses_dao.dart';
import 'package:Homey/house/domain/house.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'house_repository.g.dart';

@riverpod
HouseRepository houseRepository(HouseRepositoryRef ref) => HouseRepository(
      ref.watch(housesDaoProvider),
      ref.watch(houseApiProvider),
    );

class HouseRepository {
  final HousesDao _housesDao;
  final HouseApi _houseApi;
  const HouseRepository(this._housesDao, this._houseApi);

  Future<void> setDefaultHouse(int houseId) async {
    await _housesDao.setDefaultHouse(houseId);
  }

  Future<House> addNewHouse(String houseName, String country, String county,
      String locality, String street, String number) async {
    final house = await _houseApi.addHouse(
      houseName,
      country,
      county,
      locality,
      street,
      number,
      isDefault: _housesDao.defaultHouse == null,
    );
    _housesDao.addHouse(house);
    await _housesDao.setDefaultHouse(house.id);
    return house;
  }

  void addHouse(House house) {
    _housesDao.addHouse(house);
  }

  void addHouses(List<House> house) {
    _housesDao.addHouses(house);
  }

  Stream<House?> watchDefaultHouse() {
    return _housesDao.watchDefaultHouse();
  }

  Stream<List<House>> watchHouses() {
    return _housesDao.watchHouses();
  }
}
