import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'switchs2_widget.dart' show Switchs2Widget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Switchs2Model extends FlutterFlowModel<Switchs2Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - API (Update User or Device State)] action in Switch widget.
  ApiCallResponse? updateDeviceStateOn;
  // Stores action output result for [Backend Call - API (Update User or Device State)] action in Switch widget.
  ApiCallResponse? updateDeviceStateOff;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
