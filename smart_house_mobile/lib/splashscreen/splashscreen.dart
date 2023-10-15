// import 'package:flutter/material.dart';

// class SplashScreenPage extends StatelessWidget {
//   const SplashScreenPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<dynamic>(
//         future: Future.wait<dynamic>(<Future<dynamic>>[
// //            Future<dynamic>.delayed(const Duration(seconds: 2)),
//         ]).then<dynamic>((data) async {
//           return AppDataManager().fetchData();
//         }),
//         builder: (context, snapshot) {
//           log('snapshot data', error: snapshot);
//           if (snapshot.connectionState == ConnectionState.waiting ||
//               snapshot.connectionState == ConnectionState.none) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Image.asset(
//                     'assets/images/Logo.png',
//                     height: 60,
//                   ),
//                   const Text(
//                     'Homey',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontFamily: 'Sriracha',
//                       fontSize: 35,
//                     ),
//                   ),
//                   const CircularProgressIndicator()
//                 ],
//               ),
//             );
//           } else {
//             if (snapshot.hasData && snapshot.data.isNotEmpty) {
//               return Menu();
//             } else {
//               return LoginPage();
//             }
//           }
//         },
//       ),
//     );
//   }
// }
