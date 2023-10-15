// import 'dart:developer';

// import 'package:Homey/app_data_manager.dart';
// import 'package:Homey/core/helpers/sql_helper/data_models/home_model.dart';
// import 'package:rxdart/rxdart.dart';

// class MenuState {
//   final BehaviorSubject<HomeModel?> _selectedHouse =
//       BehaviorSubject<HomeModel?>.seeded(AppDataManager().defaultHome);

//   Stream<HomeModel> get selectedHomeStream$ => _selectedHouse.stream;

//   HomeModel get selectedHome => _selectedHouse.value;
//   set selectedHome(HomeModel model) {
//     _selectedHouse.value = model;
//   }
// //  Future<void> initState() async {
// //    _selectedHouse.value = AppDataManager().defaultHome;
// //    await AppDataManager().fetchData();
// //    _selectedHouse.value = AppDataManager().defaultHome;
// //  }

//   Future<void> changeHouse({required int houseId}) async {
//     log('changed', error: houseId);
//     for (final HomeModel home in AppDataManager().houses) {
//       if (home.id == houseId) {
//         await AppDataManager().changeDefaultHome(houseId);
//         _selectedHouse.value = AppDataManager().defaultHome;
//       }
//     }
//   }

//   void dispose() {
//     _selectedHouse.close();
//   }
// }
