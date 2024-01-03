// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:device_info/device_info.dart';

Future<String> deviceId() async {
  // Add your function code here!
  String deviceId = "";
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  try {
    AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    deviceId = androidDeviceInfo.androidId; // Unique ID on Android
    return deviceId;
  } catch (e) {
    print('Error getting device ID: $e');
    return '$e';
  }
}
