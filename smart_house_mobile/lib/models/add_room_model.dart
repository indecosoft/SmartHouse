import 'package:Homey/app_data_manager.dart';
import 'package:Homey/core/resource.dart';

class AddRoomModel {
  AddRoomModel({required this.roomName, required this.onResult});

  final String roomName;
  final OnResult onResult;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'roomName': roomName,
      'houseId': AppDataManager().defaultHome.dbId,
    };
  }
}
