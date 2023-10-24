import 'package:Homey/core/helpers/sql_helper/data_models/room_model.dart';

class RoomEditModel {
  const RoomEditModel({this.roomName, this.roomStyle, this.room});
  final String roomName;
  final RoomModel room;
  final Map<String, dynamic> roomStyle;
}
