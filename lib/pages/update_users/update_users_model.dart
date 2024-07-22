import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'update_users_widget.dart' show UpdateUsersWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateUsersModel extends FlutterFlowModel<UpdateUsersWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Get Access Role)] action in UpdateUsers widget.
  ApiCallResponse? getaccessroleresponse;
  // State field(s) for fullname widget.
  FocusNode? fullnameFocusNode;
  TextEditingController? fullnameTextController;
  String? Function(BuildContext, String?)? fullnameTextControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for changePasswordCheckBox widget.
  bool? changePasswordCheckBoxValue;
  // State field(s) for contact_num widget.
  FocusNode? contactNumFocusNode;
  TextEditingController? contactNumTextController;
  String? Function(BuildContext, String?)? contactNumTextControllerValidator;
  // State field(s) for role widget.
  String? roleValue;
  FormFieldController<String>? roleValueController;
  // State field(s) for access-role widget.
  int? accessRoleValue;
  FormFieldController<int>? accessRoleValueController;
  // State field(s) for organization widget.
  int? organizationValue;
  FormFieldController<int>? organizationValueController;
  // State field(s) for regional widget.
  List<int>? regionalValue;
  FormFieldController<List<int>>? regionalValueController;
  // State field(s) for stateId widget.
  List<int>? stateIdValue;
  FormFieldController<List<int>>? stateIdValueController;
  // Stores action output result for [Backend Call - API (Update User)] action in Button-Login widget.
  ApiCallResponse? updateUserResponse2;
  // Stores action output result for [Backend Call - API (Update User)] action in Button-Login widget.
  ApiCallResponse? updateUserResponse;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    fullnameFocusNode?.dispose();
    fullnameTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    contactNumFocusNode?.dispose();
    contactNumTextController?.dispose();
  }
}
