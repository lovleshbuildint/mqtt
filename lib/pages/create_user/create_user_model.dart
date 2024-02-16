import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_user_widget.dart' show CreateUserWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateUserModel extends FlutterFlowModel<CreateUserWidget> {
  ///  Local state fields for this page.

  int? orgId;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (User Info)] action in CreateUser widget.
  ApiCallResponse? userInfoRespnse;
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
  // State field(s) for project widget.
  String? projectValue;
  FormFieldController<String>? projectValueController;
  // Stores action output result for [Backend Call - API (Get Organization)] action in project widget.
  ApiCallResponse? getOrganizationResponse;
  // State field(s) for organization widget.
  String? organizationValue;
  FormFieldController<String>? organizationValueController;
  // State field(s) for role widget.
  String? roleValue;
  FormFieldController<String>? roleValueController;
  // Stores action output result for [Backend Call - API (Create User)] action in Button-Login widget.
  ApiCallResponse? addUserResponse;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
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
