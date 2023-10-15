import 'package:Homey/core/error_wrapper.dart';
import 'package:Homey/core/network.dart';
import 'package:Homey/house/domain/house.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'house_api.g.dart';

@riverpod
HouseApi houseApi(HouseApiRef ref) => HouseApi(
      ref.watch(dioProvider),
    );

class HouseApi {
  final Dio _dio;
  const HouseApi(this._dio);

  Future<House> addHouse(String houseName, String country, String county,
      String locality, String street, String number,
      {bool isDefault = false}) async {
    return apiWrapper(
      callable: () => _dio.post('/api/add/house', data: {
        'houseName': houseName,
        'country': country,
        'county': county,
        'locality': locality,
        'street': street,
        'number': number,
        'isDefault': isDefault
      }),
      responseMapper: House.fromJson,
    );
  }
}
