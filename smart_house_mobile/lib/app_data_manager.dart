import 'dart:developer';

import 'package:Homey/core/helpers/sql_helper/data_models/home_model.dart';
import 'package:Homey/core/helpers/sql_helper/data_models/sensor_model.dart';
import 'package:Homey/core/helpers/sql_helper/data_models/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_data_manager.g.dart';

@riverpod
SharedPreferences sharedPreferences(SharedPreferencesRef ref) =>
    throw UnimplementedError();

// @riverpod
// AppDataManager appDataManager(AppDataManagerRef ref) =>
//     AppDataManager(prefs: ref.watch(sharedPreferencesProvider));

// class AppDataManager {
//   AppDataManager({required this.prefs});

//   final SharedPreferences prefs;
//   UserDataModel? userData;
//   HomeModel? defaultHome;
//   final List<HomeModel> houses = <HomeModel>[];
//   final List<SensorModel> sensors = <SensorModel>[];

//   Future<dynamic> addHouse(HomeModel house) async {
//     await SqlHelper().addHome(house);
//     if (houses.isEmpty) {
//       await prefs.setInt('defaultHomeId', 1);
//     }
//     houses.clear();
//     // ignore: cascade_invocations
//     houses.addAll(await SqlHelper().getAllHouses());
//     defaultHome ??= houses[0];
//   }

//   Future<dynamic> addSensor(SensorModel sensor) async {
//     log('dfsfs', error: sensor.toMap());
//     final List<SensorModel> find = sensors
//         .where((sensorF) => sensorF.macAddress == sensor.macAddress)
//         .toList();
//     log('find', error: find);
//     if (find.isNotEmpty) {
//       log('update');
//       await SqlHelper().updateSensor(sensor);
//     } else {
//       log('insert');
//       await SqlHelper().addSensor(sensor);
//       sensors.add(sensor);
//     }
//   }

//   Future<dynamic> removeData() async {
//     await SqlHelper().dropDatabase();
//     userData = null;
//     defaultHome = null;
//     houses.clear();
//     sensors.clear();
//     await prefs.remove('defaultHomeId');
//     await prefs.remove('token');
//   }

//   Future<String> fetchData() async {
//     houses.clear();
//     sensors.clear();
//     final String token = prefs.getString('token') ?? '';
//     if (token.isEmpty) {
//       return '';
//     }
//     userData = await SqlHelper().getUserData();
//     defaultHome =
//         await SqlHelper().getHomeInfoById(prefs.getInt('defaultHomeId') ?? 1);
//     houses.addAll(await SqlHelper().getAllHouses());
//     sensors.addAll(await SqlHelper().getAllSensors());
// //    await SqlHelper().selectAll();
// //    await removeData();
//     return token;
//   }

//   Future<dynamic> changeDefaultHome(int homeId) async {
//     defaultHome = await SqlHelper().getHomeInfoById(homeId);
//     await prefs.setInt('defaultHomeId', homeId);
//   }
// }
