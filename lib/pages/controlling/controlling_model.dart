import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'controlling_widget.dart' show ControllingWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ControllingModel extends FlutterFlowModel<ControllingWidget> {
  ///  Local state fields for this page.

  String? relayStatus;

  bool test = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (User Info)] action in Controlling widget.
  ApiCallResponse? userInfoRespnse;
  InstantTimer? instantTimer;
  // State field(s) for AC1 widget.
  bool? ac1Value;
  // State field(s) for AC2 widget.
  bool? ac2Value;
  // State field(s) for LobbyLight widget.
  bool? lobbyLightValue;
  // State field(s) for Signage widget.
  bool? signageValue;
  // State field(s) for DVR widget.
  bool? dvrValue;
  // State field(s) for Router widget.
  bool? routerValue;
  // State field(s) for VSAT widget.
  bool? vsatValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    instantTimer?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
