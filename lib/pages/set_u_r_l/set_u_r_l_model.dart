import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'set_u_r_l_widget.dart' show SetURLWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SetURLModel extends FlutterFlowModel<SetURLWidget> {
  ///  Local state fields for this component.

  bool setResponse = false;

  int? maxTry = 0;

  bool notSetResponse = false;

  bool checkResponse = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for set-url-1 widget.
  FocusNode? setUrl1FocusNode;
  TextEditingController? setUrl1TextController;
  String? Function(BuildContext, String?)? setUrl1TextControllerValidator;
  String? _setUrl1TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for set-url-2 widget.
  FocusNode? setUrl2FocusNode;
  TextEditingController? setUrl2TextController;
  String? Function(BuildContext, String?)? setUrl2TextControllerValidator;

  @override
  void initState(BuildContext context) {
    setUrl1TextControllerValidator = _setUrl1TextControllerValidator;
  }

  @override
  void dispose() {
    setUrl1FocusNode?.dispose();
    setUrl1TextController?.dispose();

    setUrl2FocusNode?.dispose();
    setUrl2TextController?.dispose();
  }
}
