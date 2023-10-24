import 'package:Homey/core/resource.dart';

class NetworkConfigModel {
  NetworkConfigModel(
      {this.onResult,
      this.networkSSID = '',
      this.networkPassword = '',
      this.networkBSSID = ''});

  final String networkSSID;
  final String networkPassword;
  final String networkBSSID;
  final OnResult onResult;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ssid': networkSSID,
      'bssid': networkBSSID,
      'password': networkPassword
    };
  }
}
