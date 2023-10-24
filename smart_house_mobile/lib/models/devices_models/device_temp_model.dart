class DeviceTempModel {
  DeviceTempModel({this.name, this.networkStatus, this.data});

  final String name;
  final bool networkStatus;
  Map<String, dynamic> data;
}
