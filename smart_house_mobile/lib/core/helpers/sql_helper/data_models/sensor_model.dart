class SensorModel {
  SensorModel({
    required this.id,
    required this.dbId,
    required this.roomId,
    required this.name,
    required this.sensorType,
    required this.readingFrequency,
    required this.ipAddress,
    required this.macAddress,
    required this.networkStatus,
    required this.account,
  });

  final int id;
  final int dbId;
  final int roomId;
  final String name;
  final int sensorType;
  final String ipAddress;
  final String macAddress;
  final dynamic networkStatus;
  final int readingFrequency;
  final String account;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'dbId': dbId,
      'roomId': roomId,
      'name': name,
      'readingFrequency': readingFrequency,
      'sensorType': sensorType,
      'ipAddress': ipAddress,
      'macAddress': macAddress,
      'networkStatus': networkStatus,
      'account': account,
    };
  }
}
