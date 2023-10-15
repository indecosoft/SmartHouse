import 'package:Homey/core/resource.dart';
import 'package:Homey/core/helpers/sql_helper/data_models/sensor_model.dart';

class AddDeviceModel {
  AddDeviceModel(
      {this.server,
      this.port,
      this.networkPassword,
      this.sensor,
      this.networkSSID,
      this.onResult});

  String networkSSID;
  String networkPassword;
  String server;
  int port;
  SensorModel sensor;
  final OnResult onResult;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'port': port,
      'server': server,
      'sensorName': sensor.name,
      'freqMinutes': sensor.readingFrequency,
      'sensorType': sensor.sensorType,
      'ssid': networkSSID,
      'password': networkPassword,
      'account': sensor.account,
    };
  }
}
