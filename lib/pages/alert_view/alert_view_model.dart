import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/assign_to/assign_to_widget.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'alert_view_widget.dart' show AlertViewWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AlertViewModel extends FlutterFlowModel<AlertViewWidget> {
  ///  Local state fields for this page.

  String? searchValue;

  int? alertID;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<dynamic>();
  // Stores action output result for [Backend Call - API (Update Alerts)] action in Text widget.
  ApiCallResponse? updateAlertsResponse;
  // Stores action output result for [Backend Call - API (Post Checklst Login)] action in Text widget.
  ApiCallResponse? checklistLoginResponse;
  // Stores action output result for [Backend Call - API (Get Checklist OTP)] action in Text widget.
  ApiCallResponse? checklistOTPResponse;
  // Stores action output result for [Backend Call - API (Post Checklist Verify Tokens)] action in Text widget.
  ApiCallResponse? checklistGetTokenResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    paginatedDataTableController.dispose();
  }
}
