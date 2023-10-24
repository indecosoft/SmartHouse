import 'package:Homey/core/helpers/sql_helper/data_models/sensor_model.dart';

class RoomModel {
  const RoomModel({
    required this.id,
    required this.dbId,
    required this.houseId,
    required this.name,
    required this.sensors,
  });

  final int id;
  final int dbId;
  final int houseId;
  final String name;
  final List<SensorModel> sensors;

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'dbId': dbId,
      'houseId': houseId,
      'name': name,
      'sensors': sensors,
    };
  }
}
