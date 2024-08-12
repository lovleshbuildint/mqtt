import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'dev_control_widget.dart' show DevControlWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DevControlModel extends FlutterFlowModel<DevControlWidget> {
  ///  Local state fields for this page.

  String devResponse = '-';

  int maxTry = 0;

  bool noResponse = false;

  bool setResponse = false;

  bool checkResponse = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for setTimeDay widget.
  FocusNode? setTimeDayFocusNode;
  TextEditingController? setTimeDayTextController;
  String? Function(BuildContext, String?)? setTimeDayTextControllerValidator;
  // State field(s) for setTimeNight widget.
  FocusNode? setTimeNightFocusNode;
  TextEditingController? setTimeNightTextController;
  String? Function(BuildContext, String?)? setTimeNightTextControllerValidator;
  // State field(s) for signageOnTime widget.
  FocusNode? signageOnTimeFocusNode;
  TextEditingController? signageOnTimeTextController;
  String? Function(BuildContext, String?)? signageOnTimeTextControllerValidator;
  // State field(s) for signageOffTime widget.
  FocusNode? signageOffTimeFocusNode;
  TextEditingController? signageOffTimeTextController;
  String? Function(BuildContext, String?)?
      signageOffTimeTextControllerValidator;
  // State field(s) for dataInterval widget.
  FocusNode? dataIntervalFocusNode;
  TextEditingController? dataIntervalTextController;
  String? Function(BuildContext, String?)? dataIntervalTextControllerValidator;
  // State field(s) for maxTempDay widget.
  FocusNode? maxTempDayFocusNode;
  TextEditingController? maxTempDayTextController;
  String? Function(BuildContext, String?)? maxTempDayTextControllerValidator;
  // State field(s) for minTempDay widget.
  FocusNode? minTempDayFocusNode;
  TextEditingController? minTempDayTextController;
  String? Function(BuildContext, String?)? minTempDayTextControllerValidator;
  // State field(s) for maxTempNight widget.
  FocusNode? maxTempNightFocusNode;
  TextEditingController? maxTempNightTextController;
  String? Function(BuildContext, String?)? maxTempNightTextControllerValidator;
  // State field(s) for minTempNight widget.
  FocusNode? minTempNightFocusNode;
  TextEditingController? minTempNightTextController;
  String? Function(BuildContext, String?)? minTempNightTextControllerValidator;
  // State field(s) for acOnTimeDay widget.
  FocusNode? acOnTimeDayFocusNode;
  TextEditingController? acOnTimeDayTextController;
  String? Function(BuildContext, String?)? acOnTimeDayTextControllerValidator;
  // State field(s) for acOnTimeNight widget.
  FocusNode? acOnTimeNightFocusNode;
  TextEditingController? acOnTimeNightTextController;
  String? Function(BuildContext, String?)? acOnTimeNightTextControllerValidator;
  // State field(s) for acOffTimeDay widget.
  FocusNode? acOffTimeDayFocusNode;
  TextEditingController? acOffTimeDayTextController;
  String? Function(BuildContext, String?)? acOffTimeDayTextControllerValidator;
  // State field(s) for acOffTimeNight widget.
  FocusNode? acOffTimeNightFocusNode;
  TextEditingController? acOffTimeNightTextController;
  String? Function(BuildContext, String?)?
      acOffTimeNightTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    setTimeDayFocusNode?.dispose();
    setTimeDayTextController?.dispose();

    setTimeNightFocusNode?.dispose();
    setTimeNightTextController?.dispose();

    signageOnTimeFocusNode?.dispose();
    signageOnTimeTextController?.dispose();

    signageOffTimeFocusNode?.dispose();
    signageOffTimeTextController?.dispose();

    dataIntervalFocusNode?.dispose();
    dataIntervalTextController?.dispose();

    maxTempDayFocusNode?.dispose();
    maxTempDayTextController?.dispose();

    minTempDayFocusNode?.dispose();
    minTempDayTextController?.dispose();

    maxTempNightFocusNode?.dispose();
    maxTempNightTextController?.dispose();

    minTempNightFocusNode?.dispose();
    minTempNightTextController?.dispose();

    acOnTimeDayFocusNode?.dispose();
    acOnTimeDayTextController?.dispose();

    acOnTimeNightFocusNode?.dispose();
    acOnTimeNightTextController?.dispose();

    acOffTimeDayFocusNode?.dispose();
    acOffTimeDayTextController?.dispose();

    acOffTimeNightFocusNode?.dispose();
    acOffTimeNightTextController?.dispose();
  }
}
