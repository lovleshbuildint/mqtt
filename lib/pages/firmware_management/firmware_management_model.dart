import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import 'firmware_management_widget.dart' show FirmwareManagementWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FirmwareManagementModel
    extends FlutterFlowModel<FirmwareManagementWidget> {
  ///  Local state fields for this page.
  /// Current Version
  String? currentVersion;

  ///  State fields for stateful widgets in this page.

  // State field(s) for selectDeviceDD widget.
  String? selectDeviceDDValue;
  FormFieldController<String>? selectDeviceDDValueController;
  // Stores action output result for [Backend Call - API (getVersionBV)] action in selectDeviceDD widget.
  ApiCallResponse? getVersionBVResponse;
  // Stores action output result for [Backend Call - API (getVersionBVtestmode)] action in selectDeviceDD widget.
  ApiCallResponse? getVersionBVTestmodeResponse;
  // Stores action output result for [Backend Call - API (getVersionBS)] action in selectDeviceDD widget.
  ApiCallResponse? getVersionBSResponse;
  // Stores action output result for [Backend Call - API (getVersionBStestmode)] action in selectDeviceDD widget.
  ApiCallResponse? getVersionBSTestmodeResponse;
  // Stores action output result for [Backend Call - API (getVersionBLiB)] action in selectDeviceDD widget.
  ApiCallResponse? getVersionBLiBResponse;
  // Stores action output result for [Backend Call - API (getVersionBLiBtestmode)] action in selectDeviceDD widget.
  ApiCallResponse? getVersionBLiBTestmodeResponse;
  bool isDataUploading_uploadDataS92 = false;
  FFUploadedFile uploadedLocalFile_uploadDataS92 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - API (getVersionBV)] action in Switch widget.
  ApiCallResponse? getVersionBVResponse1;
  // Stores action output result for [Backend Call - API (getVersionBVtestmode)] action in Switch widget.
  ApiCallResponse? getVersionBVTestmodeResponse1;
  // Stores action output result for [Backend Call - API (getVersionBS)] action in Switch widget.
  ApiCallResponse? getVersionBSResponse1;
  // Stores action output result for [Backend Call - API (getVersionBStestmode)] action in Switch widget.
  ApiCallResponse? getVersionBSTestmodeResponse1;
  // Stores action output result for [Backend Call - API (getVersionBLiB)] action in Switch widget.
  ApiCallResponse? getVersionBLiBResponse1;
  // Stores action output result for [Backend Call - API (getVersionBLiBtestmode)] action in Switch widget.
  ApiCallResponse? getVersionBLiBTestmodeResponse1;
  // Stores action output result for [Backend Call - API (getVersionBV)] action in Switch widget.
  ApiCallResponse? getVersionBVResponse1Copy;
  // Stores action output result for [Backend Call - API (getVersionBVtestmode)] action in Switch widget.
  ApiCallResponse? getVersionBVTestmodeResponse1Copy;
  // Stores action output result for [Backend Call - API (getVersionBS)] action in Switch widget.
  ApiCallResponse? getVersionBSResponse1Copy;
  // Stores action output result for [Backend Call - API (getVersionBStestmode)] action in Switch widget.
  ApiCallResponse? getVersionBSTestmodeResponse1Copy;
  // Stores action output result for [Backend Call - API (getVersionBLiB)] action in Switch widget.
  ApiCallResponse? getVersionBLiBResponse1Copy;
  // Stores action output result for [Backend Call - API (getVersionBLiBtestmode)] action in Switch widget.
  ApiCallResponse? getVersionBLiBTestmodeResponse1Copy;
  // Stores action output result for [Backend Call - API (setUpdateBV)] action in Button widget.
  ApiCallResponse? setVersionBVResponse;
  // Stores action output result for [Backend Call - API (setUpdateBVtestmode)] action in Button widget.
  ApiCallResponse? setVersionBVTestmodeResponse;
  // Stores action output result for [Backend Call - API (setUpdateBS)] action in Button widget.
  ApiCallResponse? setVersionBSResponse;
  // Stores action output result for [Backend Call - API (setUpdateBStestmode)] action in Button widget.
  ApiCallResponse? setVersionBSTestmodeResponse;
  // Stores action output result for [Backend Call - API (setUpdateBLiB)] action in Button widget.
  ApiCallResponse? setVersionBLIBResponse;
  // Stores action output result for [Backend Call - API (setUpdateBLiBtestmode)] action in Button widget.
  ApiCallResponse? setVersionBLiBTestmodeResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
