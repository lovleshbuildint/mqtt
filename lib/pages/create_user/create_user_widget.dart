import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_user_model.dart';
export 'create_user_model.dart';

class CreateUserWidget extends StatefulWidget {
  const CreateUserWidget({super.key});

  @override
  State<CreateUserWidget> createState() => _CreateUserWidgetState();
}

class _CreateUserWidgetState extends State<CreateUserWidget> {
  late CreateUserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateUserModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.userInfoUpdate(context);
      setState(() {});
    });

    _model.fullnameTextController ??= TextEditingController();
    _model.fullnameFocusNode ??= FocusNode();

    _model.emailAddressTextController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

    _model.contactNumTextController ??= TextEditingController();
    _model.contactNumFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: GetOrganizationCall.call(
        deviceId: FFAppState().deviceId,
        token: FFAppState().token,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFF08182F),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final createUserGetOrganizationResponse = snapshot.data!;

        return Title(
            title: 'CreateUser',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: Color(0xFF08182F),
                body: SafeArea(
                  top: true,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              100.0, 60.0, 100.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset(
                              'assets/images/Group_1000004811.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 200.0, 0.0, 0.0),
                              child: SafeArea(
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.95,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(24.0),
                                      topRight: Radius.circular(24.0),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: SafeArea(
                                          child: Container(
                                            width: 150.0,
                                            height: 5.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Form(
                                          key: _model.formKey,
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 15.0, 20.0, 0.0),
                                            child: SingleChildScrollView(
                                              primary: false,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Create New User',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFF2D2D2D),
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 6.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Please enter user details',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: Color(
                                                                0xFF4D4D4D),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: TextFormField(
                                                            controller: _model
                                                                .fullnameTextController,
                                                            focusNode: _model
                                                                .fullnameFocusNode,
                                                            textCapitalization:
                                                                TextCapitalization
                                                                    .words,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'Full Name',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Color(
                                                                            0xFFB3B3B3),
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0xFFF2F2F2),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0xFF4154F1),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              filled: true,
                                                              fillColor:
                                                                  Colors.white,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF2D2D2D),
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                            validator: _model
                                                                .fullnameTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: TextFormField(
                                                            controller: _model
                                                                .emailAddressTextController,
                                                            focusNode: _model
                                                                .emailAddressFocusNode,
                                                            textCapitalization:
                                                                TextCapitalization
                                                                    .none,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'Username',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Color(
                                                                            0xFFB3B3B3),
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0xFFF2F2F2),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0xFF4154F1),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              filled: true,
                                                              fillColor:
                                                                  Colors.white,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF2D2D2D),
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                            validator: _model
                                                                .emailAddressTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 14.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: TextFormField(
                                                            controller: _model
                                                                .contactNumTextController,
                                                            focusNode: _model
                                                                .contactNumFocusNode,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .done,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: false,
                                                              hintText:
                                                                  'Contact No.',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Color(
                                                                            0xFFB3B3B3),
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0xFFF2F2F2),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0xFF4154F1),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              filled: true,
                                                              fillColor:
                                                                  Colors.white,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          24.0,
                                                                          14.0),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF2D2D2D),
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                            maxLength: 10,
                                                            maxLengthEnforcement:
                                                                MaxLengthEnforcement
                                                                    .enforced,
                                                            buildCounter: (context,
                                                                    {required currentLength,
                                                                    required isFocused,
                                                                    maxLength}) =>
                                                                null,
                                                            keyboardType:
                                                                TextInputType
                                                                    .phone,
                                                            validator: _model
                                                                .contactNumTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                            inputFormatters: [
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      '[0-9]'))
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 14.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: TextFormField(
                                                            controller: _model
                                                                .passwordTextController,
                                                            focusNode: _model
                                                                .passwordFocusNode,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .done,
                                                            obscureText: !_model
                                                                .passwordVisibility,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: false,
                                                              hintText:
                                                                  'Password',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Color(
                                                                            0xFFB3B3B3),
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0xFFF2F2F2),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0xFF4154F1),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              filled: true,
                                                              fillColor:
                                                                  Colors.white,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          24.0,
                                                                          14.0),
                                                              suffixIcon:
                                                                  InkWell(
                                                                onTap: () =>
                                                                    setState(
                                                                  () => _model
                                                                          .passwordVisibility =
                                                                      !_model
                                                                          .passwordVisibility,
                                                                ),
                                                                focusNode: FocusNode(
                                                                    skipTraversal:
                                                                        true),
                                                                child: Icon(
                                                                  _model.passwordVisibility
                                                                      ? Icons
                                                                          .visibility_outlined
                                                                      : Icons
                                                                          .visibility_off_outlined,
                                                                  color: Color(
                                                                      0xFF2D2D2D),
                                                                  size: 22.0,
                                                                ),
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF2D2D2D),
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                            validator: _model
                                                                .passwordTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 14.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child:
                                                              FlutterFlowDropDown<
                                                                  String>(
                                                            controller: _model
                                                                    .roleValueController ??=
                                                                FormFieldController<
                                                                        String>(
                                                                    null),
                                                            options: () {
                                                              if (FFAppState()
                                                                      .role ==
                                                                  'Super Admin') {
                                                                return [
                                                                  'Super Admin',
                                                                  'Admin',
                                                                  'Project Manager',
                                                                  'Engineer',
                                                                  'ATMO'
                                                                ];
                                                              } else if (FFAppState()
                                                                      .role ==
                                                                  'Admin') {
                                                                return [
                                                                  'Admin',
                                                                  'Project Manager',
                                                                  'Engineer',
                                                                  'ATMO'
                                                                ];
                                                              } else if (FFAppState()
                                                                      .role ==
                                                                  'Project Manager') {
                                                                return [
                                                                  'Project Manager',
                                                                  'Engineer',
                                                                  'ATMO'
                                                                ];
                                                              } else {
                                                                return ['Null'];
                                                              }
                                                            }(),
                                                            onChanged: (val) =>
                                                                setState(() =>
                                                                    _model.roleValue =
                                                                        val),
                                                            width: 300.0,
                                                            height: 50.0,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintText:
                                                                'Select Role',
                                                            icon: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            elevation: 2.0,
                                                            borderColor: Color(
                                                                0xFFF2F2F2),
                                                            borderWidth: 2.0,
                                                            borderRadius: 8.0,
                                                            margin:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        4.0,
                                                                        16.0,
                                                                        4.0),
                                                            hidesUnderline:
                                                                true,
                                                            isOverButton: true,
                                                            isSearchable: false,
                                                            isMultiSelect:
                                                                false,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 14.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: FutureBuilder<
                                                              ApiCallResponse>(
                                                            future: MasterGroup
                                                                .getAccessRoleCall
                                                                .call(
                                                              token:
                                                                  FFAppState()
                                                                      .token,
                                                              deviceId:
                                                                  FFAppState()
                                                                      .deviceId,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              final accessRoleGetAccessRoleResponse =
                                                                  snapshot
                                                                      .data!;

                                                              return FlutterFlowDropDown<
                                                                  int>(
                                                                controller: _model
                                                                        .accessRoleValueController ??=
                                                                    FormFieldController<
                                                                            int>(
                                                                        null),
                                                                options: List<
                                                                        int>.from(
                                                                    getJsonField(
                                                                  accessRoleGetAccessRoleResponse
                                                                      .jsonBody,
                                                                  r'''$.result..role_id''',
                                                                  true,
                                                                )!),
                                                                optionLabels:
                                                                    (getJsonField(
                                                                  accessRoleGetAccessRoleResponse
                                                                      .jsonBody,
                                                                  r'''$.result..role_name''',
                                                                  true,
                                                                ) as List)
                                                                        .map<String>((s) =>
                                                                            s.toString())
                                                                        .toList()!,
                                                                onChanged: (val) =>
                                                                    setState(() =>
                                                                        _model.accessRoleValue =
                                                                            val),
                                                                width: 300.0,
                                                                height: 50.0,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                hintText:
                                                                    'Select Access Role',
                                                                icon: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                elevation: 2.0,
                                                                borderColor: Color(
                                                                    0xFFF2F2F2),
                                                                borderWidth:
                                                                    2.0,
                                                                borderRadius:
                                                                    8.0,
                                                                margin: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        4.0,
                                                                        16.0,
                                                                        4.0),
                                                                hidesUnderline:
                                                                    true,
                                                                isOverButton:
                                                                    true,
                                                                isSearchable:
                                                                    false,
                                                                isMultiSelect:
                                                                    false,
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 14.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child:
                                                              FlutterFlowDropDown<
                                                                  int>(
                                                            controller: _model
                                                                    .organizationValueController ??=
                                                                FormFieldController<
                                                                    int>(null),
                                                            options: List<
                                                                    int>.from(
                                                                getJsonField(
                                                              createUserGetOrganizationResponse
                                                                  .jsonBody,
                                                              r'''$.result..org_id''',
                                                              true,
                                                            )!),
                                                            optionLabels:
                                                                (getJsonField(
                                                              createUserGetOrganizationResponse
                                                                  .jsonBody,
                                                              r'''$.result..org_name''',
                                                              true,
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()!,
                                                            onChanged: (val) =>
                                                                setState(() =>
                                                                    _model.organizationValue =
                                                                        val),
                                                            width: 300.0,
                                                            height: 50.0,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintText:
                                                                'Select Project',
                                                            icon: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            elevation: 2.0,
                                                            borderColor: Color(
                                                                0xFFF2F2F2),
                                                            borderWidth: 2.0,
                                                            borderRadius: 8.0,
                                                            margin:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        4.0,
                                                                        16.0,
                                                                        4.0),
                                                            hidesUnderline:
                                                                true,
                                                            isOverButton: true,
                                                            isSearchable: false,
                                                            isMultiSelect:
                                                                false,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  if (_model.accessRoleValue ==
                                                      4)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  14.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: FutureBuilder<
                                                                ApiCallResponse>(
                                                              future: MasterGroup
                                                                  .getRegionCall
                                                                  .call(
                                                                token:
                                                                    FFAppState()
                                                                        .token,
                                                                deviceId:
                                                                    FFAppState()
                                                                        .deviceId,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final regionalGetRegionResponse =
                                                                    snapshot
                                                                        .data!;

                                                                return FlutterFlowDropDown<
                                                                    int>(
                                                                  multiSelectController: _model
                                                                          .regionalValueController ??=
                                                                      FormListFieldController<
                                                                              int>(
                                                                          null),
                                                                  options: List<
                                                                          int>.from(
                                                                      getJsonField(
                                                                    regionalGetRegionResponse
                                                                        .jsonBody,
                                                                    r'''$.result..region_id''',
                                                                    true,
                                                                  )!),
                                                                  optionLabels:
                                                                      (getJsonField(
                                                                    regionalGetRegionResponse
                                                                        .jsonBody,
                                                                    r'''$.result..region_name''',
                                                                    true,
                                                                  ) as List)
                                                                          .map<String>((s) =>
                                                                              s.toString())
                                                                          .toList()!,
                                                                  width: 300.0,
                                                                  height: 50.0,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintText:
                                                                      'Select Region',
                                                                  icon: Icon(
                                                                    Icons
                                                                        .keyboard_arrow_down_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  elevation:
                                                                      2.0,
                                                                  borderColor:
                                                                      Color(
                                                                          0xFFF2F2F2),
                                                                  borderWidth:
                                                                      2.0,
                                                                  borderRadius:
                                                                      8.0,
                                                                  margin: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                  hidesUnderline:
                                                                      true,
                                                                  isOverButton:
                                                                      true,
                                                                  isSearchable:
                                                                      false,
                                                                  isMultiSelect:
                                                                      true,
                                                                  onMultiSelectChanged: (val) =>
                                                                      setState(() =>
                                                                          _model.regionalValue =
                                                                              val),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (_model.accessRoleValue ==
                                                      5)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  14.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: FutureBuilder<
                                                                ApiCallResponse>(
                                                              future: MasterGroup
                                                                  .getStatesCall
                                                                  .call(
                                                                token:
                                                                    FFAppState()
                                                                        .token,
                                                                deviceId:
                                                                    FFAppState()
                                                                        .deviceId,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final stateManagerGetStatesResponse =
                                                                    snapshot
                                                                        .data!;

                                                                return FlutterFlowDropDown<
                                                                    int>(
                                                                  multiSelectController: _model
                                                                          .stateManagerValueController ??=
                                                                      FormListFieldController<
                                                                              int>(
                                                                          null),
                                                                  options: List<
                                                                          int>.from(
                                                                      getJsonField(
                                                                    stateManagerGetStatesResponse
                                                                        .jsonBody,
                                                                    r'''$.result..state_id''',
                                                                    true,
                                                                  )!),
                                                                  optionLabels:
                                                                      (getJsonField(
                                                                    stateManagerGetStatesResponse
                                                                        .jsonBody,
                                                                    r'''$.result..state_name''',
                                                                    true,
                                                                  ) as List)
                                                                          .map<String>((s) =>
                                                                              s.toString())
                                                                          .toList()!,
                                                                  width: 300.0,
                                                                  height: 50.0,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintText:
                                                                      'Select State',
                                                                  icon: Icon(
                                                                    Icons
                                                                        .keyboard_arrow_down_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  elevation:
                                                                      2.0,
                                                                  borderColor:
                                                                      Color(
                                                                          0xFFF2F2F2),
                                                                  borderWidth:
                                                                      2.0,
                                                                  borderRadius:
                                                                      8.0,
                                                                  margin: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                  hidesUnderline:
                                                                      true,
                                                                  isOverButton:
                                                                      true,
                                                                  isSearchable:
                                                                      false,
                                                                  isMultiSelect:
                                                                      true,
                                                                  onMultiSelectChanged: (val) =>
                                                                      setState(() =>
                                                                          _model.stateManagerValue =
                                                                              val),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      25.0,
                                                                      0.0,
                                                                      15.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              if (_model.formKey
                                                                          .currentState ==
                                                                      null ||
                                                                  !_model
                                                                      .formKey
                                                                      .currentState!
                                                                      .validate()) {
                                                                return;
                                                              }
                                                              if (_model
                                                                      .roleValue ==
                                                                  null) {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          'Alert'),
                                                                      content: Text(
                                                                          'Select Role'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                                return;
                                                              }
                                                              if (_model
                                                                      .organizationValue ==
                                                                  null) {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          'Alert'),
                                                                      content: Text(
                                                                          'Select Project'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                                return;
                                                              }
                                                              _model.addUserResponse =
                                                                  await MasterGroup
                                                                      .createUserCall
                                                                      .call(
                                                                username: _model
                                                                    .emailAddressTextController
                                                                    .text,
                                                                password: _model
                                                                    .passwordTextController
                                                                    .text,
                                                                userRole: _model
                                                                    .roleValue,
                                                                userOrg: _model
                                                                    .organizationValue,
                                                                fullName: _model
                                                                    .fullnameTextController
                                                                    .text,
                                                                token:
                                                                    FFAppState()
                                                                        .token,
                                                                deviceId:
                                                                    FFAppState()
                                                                        .deviceId,
                                                                contactNum: int
                                                                    .tryParse(_model
                                                                        .contactNumTextController
                                                                        .text),
                                                                userAccessRole:
                                                                    _model
                                                                        .accessRoleValue,
                                                                userRegionList:
                                                                    _model
                                                                        .regionalValue,
                                                                userStateManagerList:
                                                                    _model
                                                                        .stateManagerValue,
                                                              );

                                                              if ((_model
                                                                      .addUserResponse
                                                                      ?.succeeded ??
                                                                  true)) {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      content: Text((_model
                                                                              .addUserResponse
                                                                              ?.bodyText ??
                                                                          '')),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                                context
                                                                    .safePop();
                                                              } else {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      content: Text((_model
                                                                              .addUserResponse
                                                                              ?.bodyText ??
                                                                          '')),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                              }

                                                              setState(() {});
                                                            },
                                                            text: 'Create User',
                                                            options:
                                                                FFButtonOptions(
                                                              width: 351.0,
                                                              height: 46.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: Color(
                                                                  0xFF4154F1),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            18.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
