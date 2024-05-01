// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

Future<String> publishMqtt(BuildContext context, String? pubtopic,
    String? message, String? deviceId, String ip, String pass) async {
  final MqttServerClient client = MqttServerClient(ip, '');

  final MqttConnectMessage connectMessage = MqttConnectMessage()
      .withClientIdentifier('$deviceId-publish')
      .startClean()
      .keepAliveFor(60)
      .withWillTopic('will_topic')
      .withWillMessage('Connection lost')
      .withWillQos(MqttQos.atLeastOnce)
      .withWillRetain()
      .authenticateAs('mqtt_buildint', pass);

  client.connectionMessage = connectMessage;

  try {
    await client.connect();
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      final builder = MqttClientPayloadBuilder();
      builder.addString(message!);

      client.publishMessage(pubtopic!, MqttQos.exactlyOnce, builder.payload!);
      return 'Message sent successfully!';
    } else {
      client.disconnect();
      return 'Failed to connect to MQTT broker';
    }
  } catch (e) {
    print('Error: $e');
    return 'Error: $e';
  }
}
