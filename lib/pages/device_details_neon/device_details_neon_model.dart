import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'device_details_neon_widget.dart' show DeviceDetailsNeonWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeviceDetailsNeonModel extends FlutterFlowModel<DeviceDetailsNeonWidget> {
  ///  Local state fields for this page.

  String? relayStatus;

  String? maskStatus;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - subscribeMqtt] action in DeviceDetailsNeon widget.
  String? submsg;
  InstantTimer? instantTimer;
  // Stores action output result for [Custom Action - publishMqtt] action in DeviceDetailsNeon widget.
  String? publishMsg;
  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
