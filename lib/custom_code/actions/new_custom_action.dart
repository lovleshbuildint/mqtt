// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

Future<String> newCustomAction(
  String? topic,
  String? message,
) async {
  final MqttServerClient client = MqttServerClient('15.206.230.32', '');

  final MqttConnectMessage connectMessage = MqttConnectMessage()
      .withClientIdentifier('your_client_id')
      .startClean()
      .keepAliveFor(60)
      .withWillTopic('will_topic')
      .withWillMessage('Connection lost')
      .withWillQos(MqttQos.atLeastOnce)
      .withWillRetain()
      .authenticateAs('mqtt_buildint', 'mqtt_buildint_\$\$2023');

  client.connectionMessage = connectMessage;

  try {
    await client.connect();
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      print('Connected to MQTT broker');
      final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
      builder.addString(message!);

      client.publishMessage(topic!, MqttQos.exactlyOnce, builder.payload!);
      client.disconnect();
      print('Message sent successfully!');
      return 'Message sent successfully!';
    } else {
      client.disconnect();
      print('Failed to connect to MQTT broker');
      return 'Failed to connect to MQTT broker';
    }
  } catch (e) {
    print('Error: $e');
    return 'Error: $e';
  }
}
