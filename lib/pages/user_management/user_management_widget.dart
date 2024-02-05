import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/switchs/switchs_widget.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_management_model.dart';
export 'user_management_model.dart';

class UserManagementWidget extends StatefulWidget {
  const UserManagementWidget({super.key});

  @override
  State<UserManagementWidget> createState() => _UserManagementWidgetState();
}

class _UserManagementWidgetState extends State<UserManagementWidget> {
  late UserManagementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserManagementModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userInfoRespnse = await MasterGroup.userInfoCall.call(
        token: FFAppState().token,
        deviceId: FFAppState().deviceId,
      );
      if ((_model.userInfoRespnse?.succeeded ?? true)) {
        return;
      }

      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: Text('Alert'),
            content: Text(
                'Unauthorized access or your device is not registered. Try login again'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
      setState(() {
        FFAppState().token = '';
      });

      context.goNamed('LogIn');

      return;
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
            ..complete(MasterGroup.getUserListCall.call(
              token: FFAppState().token,
              deviceId: FFAppState().deviceId,
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        final userManagementGetUserListResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(13.0, 20.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.safePop();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Color(0xFF2D2D2D),
                            size: 24.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'User Management',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFF2D2D2D),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(13.0, 25.0, 13.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final userList = getJsonField(
                          userManagementGetUserListResponse.jsonBody,
                          r'''$.result''',
                        ).toList();
                        return RefreshIndicator(
                          onRefresh: () async {
                            setState(() => _model.apiRequestCompleter = null);
                            await _model.waitForApiRequestCompleted(
                                minWait: 2000, maxWait: 5000);
                          },
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: userList.length,
                            itemBuilder: (context, userListIndex) {
                              final userListItem = userList[userListIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'UpdateUsers',
                                                queryParameters: {
                                                  'fullName': serializeParam(
                                                    getJsonField(
                                                      userListItem,
                                                      r'''$..full_name''',
                                                    ).toString(),
                                                    ParamType.String,
                                                  ),
                                                  'username': serializeParam(
                                                    getJsonField(
                                                      userListItem,
                                                      r'''$..username''',
                                                    ).toString(),
                                                    ParamType.String,
                                                  ),
                                                  'userProject': serializeParam(
                                                    getJsonField(
                                                      userListItem,
                                                      r'''$..user_project''',
                                                    ).toString(),
                                                    ParamType.String,
                                                  ),
                                                  'userOrg': serializeParam(
                                                    getJsonField(
                                                      userListItem,
                                                      r'''$..user_org''',
                                                    ),
                                                    ParamType.int,
                                                  ),
                                                  'userRole': serializeParam(
                                                    getJsonField(
                                                      userListItem,
                                                      r'''$..user_role''',
                                                    ).toString(),
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: AutoSizeText(
                                              getJsonField(
                                                userListItem,
                                                r'''$..username''',
                                              ).toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Color(0xFF2D2D2D),
                                                    fontSize: 16.0,
                                                  ),
                                              minFontSize: 12.0,
                                            ),
                                          ),
                                          Text(
                                            'Role: ${getJsonField(
                                              userListItem,
                                              r'''$..user_role''',
                                            ).toString()}${getJsonField(
                                              userListItem,
                                              r'''$..user_state''',
                                            ).toString()}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: Color(0xFF737373),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.manage_accounts_outlined,
                                                color: Color(0xE02D2D2D),
                                                size: 28.0,
                                              ),
                                              SwitchsWidget(
                                                key: Key(
                                                    'Keyqy4_${userListIndex}_of_${userList.length}'),
                                                value: getJsonField(
                                                  userListItem,
                                                  r'''$..user_state''',
                                                ),
                                              ),
                                              FlutterFlowIconButton(
                                                borderColor: Color(0x004154F1),
                                                fillColor: Color(0x004B39EF),
                                                icon: Icon(
                                                  Icons.delete_forever_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 28.0,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.phone_iphone,
                                                color: Color(0xE02D2D2D),
                                                size: 28.0,
                                              ),
                                              SwitchsWidget(
                                                key: Key(
                                                    'Key165_${userListIndex}_of_${userList.length}'),
                                                value: getJsonField(
                                                  userListItem,
                                                  r'''$..device_id_state''',
                                                ),
                                              ),
                                              FlutterFlowIconButton(
                                                borderColor: Color(0x004154F1),
                                                borderRadius: 30.0,
                                                buttonSize: 46.0,
                                                fillColor: Color(0x004B39EF),
                                                icon: Icon(
                                                  Icons.delete_forever_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 28.0,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
