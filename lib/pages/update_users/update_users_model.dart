import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'update_users_widget.dart' show UpdateUsersWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateUsersModel extends FlutterFlowModel<UpdateUsersWidget> {
  ///  Local state fields for this page.

  int? orgId;

  String? projectName;

  dynamic orgList;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (User Info)] action in UpdateUsers widget.
  ApiCallResponse? userInfoRespnse;
  // Stores action output result for [Backend Call - API (Get Organization)] action in UpdateUsers widget.
  ApiCallResponse? getOrganizationResponse;
  // State field(s) for fullname widget.
  FocusNode? fullnameFocusNode;
  TextEditingController? fullnameController;
  String? Function(BuildContext, String?)? fullnameControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for changePasswordCheckBox widget.
  bool? changePasswordCheckBoxValue;
  // State field(s) for project widget.
  String? projectValue;
  FormFieldController<String>? projectValueController;
  // Stores action output result for [Backend Call - API (Get Organization)] action in project widget.
  ApiCallResponse? getOrganizationResponse2;
  // State field(s) for organization widget.
  String? organizationValue;
  FormFieldController<String>? organizationValueController;
  // State field(s) for role widget.
  String? roleValue;
  FormFieldController<String>? roleValueController;
  // Stores action output result for [Backend Call - API (Update User)] action in Button-Login widget.
  ApiCallResponse? updateUserResponse2;
  // Stores action output result for [Backend Call - API (Update User)] action in Button-Login widget.
  ApiCallResponse? updateUserResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    fullnameFocusNode?.dispose();
    fullnameController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
