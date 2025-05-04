// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
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

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:mqtt_client/mqtt_browser_client.dart';

Future<String> subscribeMqtt(
    BuildContext context,
    String? subscribeTopic,
    String? deviceId,
    String? did,
    String ip,
    String pass,
    String deviceType) async {
  Map<String, dynamic> parseStringToJSON(String pt) {
    List<String> pairs = pt.split(',');
    Map<String, dynamic> jsonMap = {};

    for (String pair in pairs) {
      List<String> keyValue = pair.split(':');
      if (keyValue.length == 2) {
        jsonMap[keyValue[0]] = keyValue[1];
      }
    }

    return jsonMap;
  }

  final String webSocketUrl = 'wss://buildint-mqtt.buildint.co/wss';

  // Select the appropriate client based on the platform
  final MqttClient client = kIsWeb
      ? MqttBrowserClient.withPort(webSocketUrl, '', 443)
      : MqttServerClient(ip, '');

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
          FFAppState().deviceStatusDIDJson = Null;
          FFAppState().mqttTime = "";
          FFAppState().relayStatusiATM = "";
          FFAppState().BSIATMMQTT = Null;
        });
      }).listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
        final recMess = c![0].payload as MqttPublishMessage;
        final pt =
            MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
        Map<String, dynamic> jsonData = parseStringToJSON(pt);
        if (deviceType == "iATM - SIFA") {
          if (pt.split(',').first == did ||
              pt.split(',')[1] == did ||
              jsonDecode(pt)['DID'] == did) {
            DateTime now = DateTime.now();
            String timestamp = now.toLocal().toString();
            FFAppState().update(() {
              FFAppState().mqttResponse = pt;
              FFAppState().mqttTime = timestamp;
            });
            if (pt.split(',')[2] == '\$GALL') {
              // For iATM
              FFAppState().update(() {
                FFAppState().mqttTime = timestamp;
                FFAppState().deviceStatusDIDJson = jsonData;
                FFAppState().relayStatusiATM = jsonData['RS'];
              });
            }
            if (pt.split(',')[2] == '\$GREL') {
              // For PLC
              FFAppState().update(() {
                FFAppState().relayStatusiATM =
                    pt.split(',')[3] + ',' + pt.split(',')[4];
              });
            }
            if (subscribeTopic == 'sresponse') {
              FFAppState().update(() {
                FFAppState().mqttTime = timestamp;
                FFAppState().deviceStatusDIDJson = jsonDecode(pt);
              });
            }
          }
        } else if (deviceType == "iATM - BuildINT") {
          Map<String, dynamic> jsondecodedPT = jsonDecode(pt);
          if (!jsondecodedPT.containsKey('Message')) {
            DateTime now = DateTime.now();
            String timestamp = now.toLocal().toString();
            FFAppState().update(() {
              FFAppState().mqttResponse = pt;
              FFAppState().mqttTime = timestamp;
              FFAppState().BSIATMMQTT = jsondecodedPT;
            });
            List<String> suffixes = [
              'STT',
              'SFT',
              'CS',
              'MOT',
              'TMP',
              'PDCT',
              'WP',
              'RRST',
              'SM',
              'RMXT',
              'RMNT',
              'RMTH',
              'MC',
              'Label',
              'I',
              'Relay'
            ];
            Map<String, dynamic> result = {};

            List<dynamic> rArr = jsondecodedPT['rArr'];

            for (String prefix in rArr) {
              Map<String, dynamic> innerMap = {};
              for (String suffix in suffixes) {
                String key = '$prefix$suffix';
                if (jsondecodedPT.containsKey(key)) {
                  innerMap[suffix] = jsondecodedPT[key];
                }
              }
              innerMap['RelayTag'] = prefix;
              result[prefix] = innerMap;
            }
            FFAppState().update(() {
              FFAppState().deviceStatusDIDJson = result;
            });
            print(result);
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
