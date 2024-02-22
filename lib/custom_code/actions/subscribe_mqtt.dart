// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:developer';

import 'index.dart'; // Imports other custom actions

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

Future<String> subscribeMqtt(BuildContext context, String? subscribeTopic,
    String? deviceId, String? did, String ip, String pass) async {
  final MqttServerClient client = MqttServerClient(ip, '');

  final MqttConnectMessage connectMessage = MqttConnectMessage()
      .withClientIdentifier('$deviceId-subscribe')
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
      client.subscribe(subscribeTopic!, MqttQos.atMostOnce);

      final timeoutDuration = Duration(seconds: 20);

      client.updates?.timeout(timeoutDuration, onTimeout: (sink) {
        FFAppState().update(() {
          FFAppState().deviceStateDid = "";
          FFAppState().mqttTime = "";
        });
      }).listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
        final recMess = c![0].payload as MqttPublishMessage;
        final pt =
            MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
        if (pt.split(',').first == did) {
          if (pt.split(',')[2] == '\$GRES') {
            print('$pt');
            DateTime now = DateTime.now();
            String timestamp = now.toLocal().toString();
            FFAppState().update(() {
              FFAppState().mqttTime = timestamp;
              FFAppState().deviceStateDid =
                  pt.split(',')[3] + ',' + pt.split(',').last;
            });
          }
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
