// import 'dart:developer';

// import 'package:Homey/app_data_manager.dart';
// import 'package:Homey/core/helpers/sql_helper/data_models/room_model.dart';
// import 'package:Homey/core/helpers/sql_helper/data_models/sensor_model.dart';
// import 'package:Homey/core/helpers/web_requests_helpers/web_requests_helpers.dart';
// import 'package:Homey/core/resource.dart';
// import 'package:Homey/models/add_room_model.dart';
// import 'package:rxdart/rxdart.dart';

// class AddRoomState {
//   // streams
//   final BehaviorSubject<String> _roomName = BehaviorSubject<String>.seeded('');
//   final BehaviorSubject<List<SensorModel>> _selectedDevices =
//       BehaviorSubject<List<SensorModel>>.seeded(<SensorModel>[]);
//   final BehaviorSubject<bool> _autoValidate =
//       BehaviorSubject<bool>.seeded(false);

//   // streams getters
//   Stream<String> get roomNameStream$ => _roomName.stream;

//   Stream<List<SensorModel>> get passwordVerificationToggleStream$ =>
//       _selectedDevices.stream;

//   Stream<bool> get autoValidateStream$ => _autoValidate.stream;

//   // streams value getters
//   String get roomName => _roomName.value;

//   List<SensorModel> get selectedDevices => _selectedDevices.value;

//   bool get autoValidate => _autoValidate.value;

//   // setters
//   set autoValidate(bool state) {
//     _autoValidate.value = state;
//   }

//   set roomName(String state) {
//     _roomName.value = state;
//   }

//   // methods
//   Future<void> addRoom({required AddRoomModel model}) async {
//     log('data', error: model.toMap());
//     model.onResult('Loading...', ApiState.loading);
//     await WebRequestsHelpers.post(route: '/api/add/room', body: model.toMap())
//         .then((dynamic response) async {
//       final dynamic data = response.json();

//       if (data['success'] != null) {
//         final RoomModel room = RoomModel(
//             dbId: data['data']['id'],
//             houseId: AppDataManager().defaultHome.id,
//             name: data['data']['name'],
//             sensors: <SensorModel>[]);
//         await SqlHelper().addRoom(room);
//         await AppDataManager().fetchData();
// //        state.selectedRooms.add(room);
//         model.onResult(data, ApiState.successful);
//       } else {
//         model.onResult(data['error'].toString(), ApiState.error);
//       }
//     }, onError: (e) {
//       model.onResult(e.toString(), ApiState.error);
//     });
//   }

//   void dispose() {
//     _roomName.close();
//     _selectedDevices.close();
//     _autoValidate.close();
//   }
// }
