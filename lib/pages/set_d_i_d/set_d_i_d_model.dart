import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'set_d_i_d_widget.dart' show SetDIDWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SetDIDModel extends FlutterFlowModel<SetDIDWidget> {
  ///  Local state fields for this component.

  bool setResponse = false;

  int? maxTry = 0;

  bool notSetResponse = false;

  bool checkResponse = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for set-did widget.
  FocusNode? setDidFocusNode;
  TextEditingController? setDidTextController;
  String? Function(BuildContext, String?)? setDidTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    setDidFocusNode?.dispose();
    setDidTextController?.dispose();
  }
}
