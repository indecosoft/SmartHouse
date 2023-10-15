import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mqtt.g.dart';

@riverpod
Mqtt mqtt(MqttRef ref, ValueChanged<Map<String, dynamic>>? onStateChanged,
    ValueChanged<bool>? onStatusChanged) {
  ref.onDispose(() => ref.state.disconnect());
  return Mqtt(onStateChanged, onStatusChanged)..connect();
}

class Mqtt {
  Mqtt(this.onStateChanged, this.onStatusChanged);

  final ValueChanged<Map<String, dynamic>>? onStateChanged;
  final ValueChanged<bool>? onStatusChanged;
  // final String macAddress;
  final String broker = '10.3.141.159';
  final int port = 9001;
  final String username = 'matteo';
  final String passwd = '1234';
  final String clientIdentifier = 'android';
  MqttClient? client;
  MqttConnectionState? connectionState;
  StreamSubscription<List<MqttReceivedMessage<MqttMessage>>>?
      onMessageSubscription;

  Future<void> connect() async {
    client = MqttServerClient(broker, '')
      ..port = port
      ..logging(on: true)
      ..keepAlivePeriod = 30;

    final MqttConnectMessage connMess = MqttConnectMessage()
        .withClientIdentifier('{"name": "test@test.com"}')
        // .keepAliveFor(
        //     60 * 5) // Must agree with the keep alive set above or not set
        .startClean() // Non persistent session for testing
        .withWillQos(MqttQos.atLeastOnce);
    client?.connectionMessage = connMess;

    try {
      await client?.connect(username, passwd);
    } catch (e) {
      log('error', error: e);
    }

    if (client?.connectionStatus?.state == MqttConnectionState.connected) {
      connectionState = client?.connectionStatus!.state;
    } else {
      disconnect();
    }

    _subscribeToTopic('SensorsDataChannel');
    _subscribeToTopic('SensorsStatusChannel');
    onMessageSubscription = client?.updates?.listen(onMessageReceived);
  }

  void disconnect() {
    print('[MQTT client] _disconnect()');
    client?.disconnect();
    _onDisconnected();
  }

  void _onDisconnected() {
    print('[MQTT client] _onDisconnected');
    connectionState = client?.connectionStatus?.state;
    client = null;
    onMessageSubscription?.cancel();
    onMessageSubscription = null;
    print('[MQTT client] MQTT client disconnected');
  }

  void _subscribeToTopic(String topic) {
    if (connectionState == MqttConnectionState.connected) {
      client?.subscribe(topic, MqttQos.exactlyOnce);
    }
  }

  void onSensorDataChanged(Map<String, dynamic> payload) {
    onStateChanged?.call(payload['data']);
    // if (macAddress.toLowerCase() ==
    //     payload['macAddress'].toString().toLowerCase()) {
    //   print(payload['data']);
    // switch (sensor.sensorType) {
    //   case 2:
    //     final DeviceSwitchState state = getIt.get<DeviceSwitchState>();
    //     state.device = DeviceSwitchModel(
    //         name: state.device.name,
    //         networkStatus: state.device.networkStatus,
    //         data: payload['data']);
    //     break;
    //   case 3:
    //     final DeviceTempState state = getIt.get<DeviceTempState>();
    //     state.device = DeviceTempModel(
    //         name: state.device.name,
    //         networkStatus: state.device.networkStatus,
    //         data: payload['data']);
    //     break;
    // }
    // }
  }

  Future<void> onSensorStatusChanged(Map<String, dynamic> payload) async {
    onStatusChanged?.call(payload['status'] == 'online');
    // if (macAddress.toLowerCase() ==
    //     jsonDecode(payload['client'])['name'].toString().toLowerCase()) {
    //   log('is ok');
    //   print(payload['status']);
    // switch (sensor.sensorType) {
    //   case 2:
    //     final DeviceSwitchState state = getIt.get<DeviceSwitchState>();
    //     state.device = DeviceSwitchModel(
    //       name: state.device.name,
    //       networkStatus: payload['status'] == 'online',
    //       data: state.device.data,
    //     );
    //     break;
    //   case 3:
    //     final DeviceTempState state = getIt.get<DeviceTempState>();
    //     state.device = DeviceTempModel(
    //       name: state.device.name,
    //       networkStatus: payload['status'] == 'online',
    //       data: state.device.data,
    //     );
    //     break;
    // }
    // sensor.isOnline = payload['status'] == 'online';
    // await SqlHelper().updateSensor(sensor);
    // }
  }

  void onMessageReceived(List<MqttReceivedMessage<MqttMessage>> event) {
    if (event.isNotEmpty) {
      final pubMess = event[0].payload as MqttPublishMessage;
      final String payloadString =
          MqttPublishPayload.bytesToStringAsString(pubMess.payload.message);
      log('Message received on <${event[0].topic}> topic, payload is <-- $payloadString -->');
      switch (event[0].topic) {
        case 'SensorsDataChannel':
          onSensorDataChanged(jsonDecode(payloadString));
          break;
        case 'SensorsStatusChannel':
          onSensorStatusChanged(jsonDecode(payloadString));
          break;
      }
    }
  }
}
