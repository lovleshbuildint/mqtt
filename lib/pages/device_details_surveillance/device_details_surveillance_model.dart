import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'device_details_surveillance_widget.dart'
    show DeviceDetailsSurveillanceWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeviceDetailsSurveillanceModel
    extends FlutterFlowModel<DeviceDetailsSurveillanceWidget> {
  ///  Local state fields for this page.

  String? relayStatus;

  String? maskStatus;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Change Arming)] action in Container widget.
  ApiCallResponse? changeArmResponseOn;
  // Stores action output result for [Backend Call - API (Change Arming)] action in Container widget.
  ApiCallResponse? changeArmResponseOff;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
