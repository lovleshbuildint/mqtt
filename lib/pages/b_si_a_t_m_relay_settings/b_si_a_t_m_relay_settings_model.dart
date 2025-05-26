import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'b_si_a_t_m_relay_settings_widget.dart' show BSiATMRelaySettingsWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BSiATMRelaySettingsModel
    extends FlutterFlowModel<BSiATMRelaySettingsWidget> {
  ///  Local state fields for this page.

  String devResponse = '-';

  int maxTry = 0;

  bool noResponse = false;

  bool setResponse = false;

  bool checkResponse = false;

  String? relayTag;

  dynamic applyChanges;

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for STT widget.
  FocusNode? sttFocusNode;
  TextEditingController? sttTextController;
  String? Function(BuildContext, String?)? sttTextControllerValidator;
  // State field(s) for SFT widget.
  FocusNode? sftFocusNode;
  TextEditingController? sftTextController;
  String? Function(BuildContext, String?)? sftTextControllerValidator;
  // State field(s) for MOT widget.
  bool? motValue;
  // State field(s) for RMTH widget.
  FocusNode? rmthFocusNode;
  TextEditingController? rmthTextController;
  String? Function(BuildContext, String?)? rmthTextControllerValidator;
  // State field(s) for TMP widget.
  bool? tmpValue;
  // State field(s) for RMNT widget.
  FocusNode? rmntFocusNode;
  TextEditingController? rmntTextController;
  String? Function(BuildContext, String?)? rmntTextControllerValidator;
  // State field(s) for RMXT widget.
  FocusNode? rmxtFocusNode;
  TextEditingController? rmxtTextController;
  String? Function(BuildContext, String?)? rmxtTextControllerValidator;
  // State field(s) for PDCT widget.
  bool? pdctValue;
  // State field(s) for WOP widget.
  bool? wopValue;
  // State field(s) for SM widget.
  bool? smValue;
  // State field(s) for relayName widget.
  FocusNode? relayNameFocusNode;
  TextEditingController? relayNameTextController;
  String? Function(BuildContext, String?)? relayNameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    sttFocusNode?.dispose();
    sttTextController?.dispose();

    sftFocusNode?.dispose();
    sftTextController?.dispose();

    rmthFocusNode?.dispose();
    rmthTextController?.dispose();

    rmntFocusNode?.dispose();
    rmntTextController?.dispose();

    rmxtFocusNode?.dispose();
    rmxtTextController?.dispose();

    relayNameFocusNode?.dispose();
    relayNameTextController?.dispose();
  }
}
