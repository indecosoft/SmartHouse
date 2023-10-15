// import 'dart:developer';

// import 'package:Homey/app_data_manager.dart';
// import 'package:Homey/core/resource.dart';
// import 'package:Homey/core/helpers/sql_helper/data_models/sensor_model.dart';
// import 'package:Homey/core/helpers/sql_helper/database.dart';
// import 'package:Homey/core/helpers/web_requests_helpers/web_requests_helpers.dart';
// import 'package:Homey/main.dart';
// import 'package:Homey/states/menu_state.dart';
// import 'package:rxdart/rxdart.dart';

// class DeviceSelectorState {
//   final BehaviorSubject<int> _selectedDevicesCount =
//       BehaviorSubject<int>.seeded(0);
//   final List<SensorModel> selectedDevices = <SensorModel>[];

//   Stream<int> get selectedDevicesCount$ => _selectedDevicesCount.stream;

//   void changeElement(SensorModel device) {
//     if (selectedDevices.contains(device)) {
//       selectedDevices.removeWhere((d) => d.macAddress == device.macAddress);
//     } else {
//       selectedDevices.add(device);
//     }
//     _selectedDevicesCount.value = selectedDevices.length;
//   }

//   void clear() {
//     _selectedDevicesCount.value = 0;
//     selectedDevices.clear();
//   }

//   Future<void> addDevices(
//       {required int roomId, required int roomDbId, OnResult onResult}) async {
//     onResult('Loading...', ApiState.loading);
//     final Map<String, dynamic> model = <String, dynamic>{
//       'roomId': roomDbId,
//       'devices': selectedDevices.map((d) => d.macAddress).toList()
//     };
//     log('body', error: model);
//     await WebRequestsHelpers.post(
//             route: '/api/add/sensorsToRoom', body: model, displayResponse: true)
//         .then((dynamic response) async {
//       final dynamic data = response.json();
//       if (data['success'] != null) {
//         await SqlHelper().addSensorsToRoom(roomId, selectedDevices);
//         await AppDataManager().fetchData();
//         getIt.get<MenuState>().selectedHome = AppDataManager().defaultHome;
//         onResult(data['success'], ApiState.successful);
//       } else {
//         onResult(data['error'].toString(), ApiState.error);
//       }
//     }, onError: (e) {
//       onResult(e.toString(), ApiState.error);
//     });
//   }

//   void dispose() {
//     _selectedDevicesCount.close();
//   }
// }
