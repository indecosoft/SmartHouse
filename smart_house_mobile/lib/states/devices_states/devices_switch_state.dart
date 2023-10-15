// import 'package:Homey/core/resource.dart';
// import 'package:Homey/core/helpers/sql_helper/data_models/sensor_model.dart';
// import 'package:Homey/core/helpers/sql_helper/database.dart';
// import 'package:Homey/core/helpers/web_requests_helpers/web_requests_helpers.dart';
// import 'package:Homey/models/devices_models/device_switch_model.dart';
// import 'package:rxdart/rxdart.dart';

// class DeviceSwitchState {
//   final BehaviorSubject<DeviceSwitchModel> _data =
//       BehaviorSubject<DeviceSwitchModel>.seeded(DeviceSwitchModel());

//   Stream<DeviceSwitchModel> get dataStream$ => _data.stream;

//   DeviceSwitchModel get device => _data.value;

//   set device(DeviceSwitchModel state) {
//     _data.value = state;
//   }

//   Future<DeviceSwitchModel> getDeviceState(
//       SensorModel sensor, OnResult onResult) async {
//     await WebRequestsHelpers.get(
//       route: '/api/getSensorLastStatus?macAddress=${sensor.macAddress}',
//     ).then((dynamic response) async {
//       final dynamic res = response.json();
//       if (res['data'] != null) {
//         _data.value = DeviceSwitchModel(
//             data: res['data'],
//             name: res['name'],
//             networkStatus: res['networkStatus']);
//         sensor.networkStatus = res['networkStatus'];
//         await SqlHelper().updateSensor(sensor);
//         onResult(_data.value, ApiState.successful);
//       } else {
//         onResult(_data.value, ApiState.error);
//       }
//     }, onError: (e) {
//       onResult(_data.value, ApiState.error);
//     });
//     return _data.value;
//   }

//   Future<void> changeStateOn(SensorModel sensor, OnResult onResult) async {
//     final Map<String, dynamic> body = <String, String>{
//       'macAddress': sensor.macAddress,
//       'event': _data.value.data['status'] == 0 ? 'on' : 'off'
//     };
//     await WebRequestsHelpers.post(
//             route: '/api/sendEventToSensor', body: body, displayResponse: true)
//         .then((dynamic response) async {
//       final dynamic data = response.json();
//       if (data['success'] != null) {
// //        await Future<dynamic>.delayed(const Duration(seconds: 2));
// //        await getDeviceState(sensor,onResult);
//       } else {
//         onResult('Error sending event to device', ApiState.error);
//       }
//     }, onError: (e) {
//       onResult('Error sending event to device', ApiState.error);
//     });
//   }

//   Future<void> rebootDevice(SensorModel sensor, OnResult onResult) async {
//     final Map<String, dynamic> body = <String, String>{
//       'macAddress': sensor.macAddress,
//       'event': 'reboot'
//     };
//     await WebRequestsHelpers.post(
//             route: '/api/sendEventToSensor', body: body, displayResponse: true)
//         .then((dynamic response) async {
//       final dynamic data = response.json();
//       if (data['success'] != null) {
//         onResult('Device will reboot now!', ApiState.successful);
//       } else {
//         onResult('Error sending event to device', ApiState.error);
//       }
//     }, onError: (e) {
//       onResult('Error sending event to device', ApiState.error);
//     });
//   }

//   void dispose() {
//     _data.close();
//   }
// }
