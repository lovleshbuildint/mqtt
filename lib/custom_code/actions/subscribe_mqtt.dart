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

Future<String> subscribeMqtt(BuildContext context, String? subscribeTopic,
    String? deviceId, String? did) async {
  final MqttServerClient client = MqttServerClient('15.206.230.32', '');

  final MqttConnectMessage connectMessage = MqttConnectMessage()
      .withClientIdentifier('$deviceId-subscribe')
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
      client.subscribe(subscribeTopic!, MqttQos.atMostOnce);
      client.updates?.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
        final recMess = c![0].payload as MqttPublishMessage;
        final pt =
            MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
        print('EXAMPLE::Change notification:: payload is <-- $pt -->');
        if (pt.split(',').first == did) {
          FFAppState().update(() {
            FFAppState().deviceStateDid = pt;
          });
        }
      });
      return 'Subscribed';
    } else {
      client.disconnect();
      return 'Failed to connect to MQTT broker';
    }
  } catch (e) {
    print('Error: $e');
    return 'Error: $e';
  }
}
