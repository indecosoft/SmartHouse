import 'package:Homey/app_data_manager.dart';
import 'package:Homey/core/resource.dart';

class AddHouseModel {
  AddHouseModel(
      {required this.houseName,
      required this.geolocation,
      required this.onResult});
  final String houseName;
  final Map<String, dynamic> geolocation;
  final OnResult onResult;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'houseName': houseName,
      'country': geolocation['Country'],
      'county': geolocation['County'],
      'locality': geolocation['Locality'],
      'street': geolocation['Street'],
      'number': geolocation['Number'],
      'userEmail': AppDataManager().userData.email
    };
  }
}
