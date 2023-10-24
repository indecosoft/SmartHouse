import 'package:Homey/house/data/house_repository.dart';
import 'package:Homey/house/domain/house.dart';
import 'package:geocoding/geocoding.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_house_view_model.g.dart';

// @riverpod
// Future<House> addNewHouse(AddNewHouseRef ref) async {

// }

@riverpod
class AddNewHouse extends _$AddNewHouse {
  @override
  FutureOr<House?> build() async {
    return null;
  }

  Future<void> addNewHouse() async {
    state = const AsyncValue.loading();
    final houseForm = ref.read(addHouseFormProvider);
    final houseRepository = ref.read(houseRepositoryProvider);
    try {
      state = AsyncValue.data(await houseRepository.addNewHouse(
        houseForm.houseName,
        houseForm.country,
        houseForm.county,
        houseForm.locality,
        houseForm.street,
        houseForm.streetNumber,
      ));
    } catch (ex, stacktrace) {
      state = AsyncValue.error(ex, stacktrace);
    }
  }
}

@riverpod
class AddHouseForm extends _$AddHouseForm {
  @override
  ({
    String houseName,
    String country,
    String county,
    String locality,
    String street,
    String streetNumber,
  }) build() {
    return (
      houseName: '',
      country: '',
      county: '',
      locality: '',
      street: '',
      streetNumber: '',
    );
  }

  void prefillFromPlacemark(Placemark placemark) {
    copyWith(
      country: placemark.country,
      county: placemark.subAdministrativeArea,
      locality: placemark.locality,
      street: placemark.street,
      streetNumber: placemark.subThoroughfare,
    );
  }

  void copyWith({
    String? houseName,
    String? country,
    String? county,
    String? locality,
    String? street,
    String? streetNumber,
  }) {
    state = (
      houseName: houseName ?? state.houseName,
      country: country ?? state.country,
      county: county ?? state.county,
      locality: locality ?? state.locality,
      street: street ?? state.street,
      streetNumber: streetNumber ?? state.streetNumber,
    );
  }
}
