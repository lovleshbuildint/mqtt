import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'device_details_surveillance_widget.dart'
    show DeviceDetailsSurveillanceWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeviceDetailsSurveillanceModel
    extends FlutterFlowModel<DeviceDetailsSurveillanceWidget> {
  ///  Local state fields for this page.

  String? relayStatus;

  String? maskStatus;

  dynamic matrix;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Change Arming)] action in Container widget.
  ApiCallResponse? changeArmResponseOn;
  // Stores action output result for [Backend Call - API (Change Arming)] action in Container widget.
  ApiCallResponse? changeArmResponseOff;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (Footage Request)] action in Button widget.
  ApiCallResponse? footageRequestResponse;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<dynamic>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paginatedDataTableController.dispose();
  }
}
