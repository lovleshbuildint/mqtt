import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'assign_to_widget.dart' show AssignToWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AssignToModel extends FlutterFlowModel<AssignToWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for fullname widget.
  FocusNode? fullnameFocusNode;
  TextEditingController? fullnameTextController;
  String? Function(BuildContext, String?)? fullnameTextControllerValidator;
  // State field(s) for contact_num widget.
  FocusNode? contactNumFocusNode;
  TextEditingController? contactNumTextController;
  String? Function(BuildContext, String?)? contactNumTextControllerValidator;
  // Stores action output result for [Backend Call - API (Update Alerts)] action in Button-Login widget.
  ApiCallResponse? updateAlertsResponse2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    fullnameFocusNode?.dispose();
    fullnameTextController?.dispose();

    contactNumFocusNode?.dispose();
    contactNumTextController?.dispose();
  }
}
