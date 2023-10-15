// import 'package:Homey/app_data_manager.dart';
// import 'package:Homey/core/helpers/sql_helper/data_models/room_model.dart';
// import 'package:Homey/core/helpers/sql_helper/data_models/sensor_model.dart';
// import 'package:rxdart/rxdart.dart';

// class RoomState {
//   final BehaviorSubject<RoomModel> _currentRoom =
//       BehaviorSubject<RoomModel>.seeded(const RoomModel());

//   Stream<RoomModel> get currentRoom$ => _currentRoom.stream;
//   RoomModel get currentRoom => _currentRoom.value;

//   set currentRoom(RoomModel model) {
//     _currentRoom.value = model;
//   }

//   void init(int roomId) {
//     _currentRoom.value = AppDataManager().defaultHome?.rooms.firstWhere(
//         (RoomModel room) => room.id == roomId,
//         orElse: () => const RoomModel(name: '', sensors: <SensorModel>[]));
//   }

//   void dispose() {
//     print('close room state');
//     _currentRoom.close();
//   }
// }
