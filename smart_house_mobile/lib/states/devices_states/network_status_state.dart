// import 'package:Homey/core/resource.dart';
// import 'package:Homey/core/helpers/request_permissions.dart';
// import 'package:Homey/models/devices_models/network_config_model.dart';
// import 'package:connectivity/connectivity.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:rxdart/rxdart.dart';

// class NetworkStatusState {
//   final BehaviorSubject<ConnectivityResult> _connectionType =
//       BehaviorSubject<ConnectivityResult>.seeded(ConnectivityResult.mobile);

//   Stream<ConnectivityResult> get connectionTypeStream$ =>
//       _connectionType.stream;

//   ConnectivityResult get connectionType => _connectionType.value;

//   @protected
//   Future<void> _onConnectivityChanged(ConnectivityResult result) async {
//     _connectionType.value = result;
//   }

//   Future<Map<PermissionGroup, PermissionStatus>> getConnectivityType() async {
//     final Map<PermissionGroup, PermissionStatus> result =
//         await RequestPermissions.requestPermissionsFor(<PermissionGroup>[
//       PermissionGroup.location,
//       PermissionGroup.locationWhenInUse,
//     ]);
//     if (result[PermissionGroup.location] == PermissionStatus.granted ||
//         result[PermissionGroup.locationWhenInUse] == PermissionStatus.granted) {
//       _connectionType.value = await Connectivity().checkConnectivity();
//     }
//     return result;
//   }

//   Future<void> getNetworkInfo({required OnResult onResult}) async {
//     Connectivity().onConnectivityChanged.listen(_onConnectivityChanged);
//     final ConnectivityResult connectivityResult =
//         await Connectivity().checkConnectivity();
//     _connectionType.value = connectivityResult;
//     if (connectivityResult == ConnectivityResult.wifi) {
//       onResult(
//           NetworkConfigModel(
//             networkSSID: await Connectivity().getWifiName(),
//             networkBSSID: await Connectivity().getWifiBSSID(),
//           ),
//           ApiState.successful);
//     }
//   }

//   void dispose() {
//     _connectionType.close();
//   }
// }
