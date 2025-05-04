import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'mac_id_device_id_widget.dart' show MacIdDeviceIdWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MacIdDeviceIdModel extends FlutterFlowModel<MacIdDeviceIdWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for selectDeviceDD widget.
  String? selectDeviceDDValue;
  FormFieldController<String>? selectDeviceDDValueController;
  // State field(s) for did widget.
  FocusNode? didFocusNode;
  TextEditingController? didTextController;
  String? Function(BuildContext, String?)? didTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    didFocusNode?.dispose();
    didTextController?.dispose();
  }
}
