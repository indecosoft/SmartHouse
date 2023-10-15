// import 'dart:developer' as debugging;

// import 'package:flutter/material.dart';
// import 'package:requests/requests.dart';

// class WebRequestsHelpers {
//   @protected
//   static const String _domain = 'http://192.168.0.118:8000';

// //  static const String DOMAIN = 'http://192.168.1.122:8000';

// //  static const String DOMAIN = 'http://192.168.43.51:8000';

//   static Future<Response> get(
//       {required String route,
//       String domain = _domain,
//       bool securized = false,
//       bool jsonBody = true}) {
//     assert(route != null, 'route argument is required');
//     try {
// //      SharedPreferences prefs = await SharedPreferences.getInstance();
// //      var headers = {'Authorization': 'Bearer ${prefs.getString('token')}'};

//       debugging.log('GET executed on:', error: domain + route);

//       return Requests.get(domain + route).then((Response response) {
//         debugging.log('request payload', error: response.content());
//         return response;
//       }).catchError((Object e) {
//         throw ArgumentError(e);
//       });
//     } catch (e, s) {
//       debugging.log('Error trying to make a web request',
//           error: e, stackTrace: s);
//       throw ArgumentError(
//           'Error ocurred trying to make a web request. Check logs for details.');
//     }
//   }

//   static Future<Response> post(
//       {required String route,
//       required Map<dynamic, dynamic> body,
//       String domain = _domain,
//       bool displayResponse = false}) async {
//     assert(route != null, 'route argument is required');
//     assert(route != null, 'body argument is required');
//     // SharedPreferences prefs = await SharedPreferences.getInstance();
//     // var headers = {'Authorization': 'Bearer ${prefs.getString('token')}'};
// //      Map<String, String> headers = {
// //        'Content-Type': 'application/json',
// //        "Accept": "*/*",
// //      };
//     debugging.log('POST executed on: ', error: domain + route);
//     return Requests.post(domain + route, json: body).then((Response response) {
//       if (displayResponse) {
//         debugging.log('request payload', error: response.content());
//       }
//       return response;
//     }).catchError((Object e, Object s) {
//       debugging.log('Error trying to make a web request',
//           error: e, stackTrace: s);
//       throw ArgumentError('Error trying to make a web request');
//     });
//   }
// }
