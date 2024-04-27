import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/assign_to/assign_to_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'alert_view_model.dart';
export 'alert_view_model.dart';

class AlertViewWidget extends StatefulWidget {
  const AlertViewWidget({super.key});

  @override
  State<AlertViewWidget> createState() => _AlertViewWidgetState();
}

class _AlertViewWidgetState extends State<AlertViewWidget> {
  late AlertViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlertViewModel());

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
        FFAppState().deleteToken();
        FFAppState().token = '';
      });

      context.goNamed('LogIn');

      return;
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      future: GetAlertCall.call(
        deviceId: FFAppState().deviceId,
        token: FFAppState().token,
        project: FFAppState().userProject,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        final alertViewGetAlertResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(13.0, 0.0, 13.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
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
                                  'Alert View',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Color(0xFF2D2D2D),
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          Duration(milliseconds: 0),
                          () async {
                            setState(() {
                              _model.searchValue = _model.textController.text;
                            });
                          },
                        ),
                        autofocus: false,
                        textCapitalization: TextCapitalization.characters,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Search Location',
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                            ),
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final alerts = functions
                                    .searchFilter(
                                        getJsonField(
                                          alertViewGetAlertResponse.jsonBody,
                                          r'''$.result''',
                                        ),
                                        _model.searchValue,
                                        'DID')
                                    ?.toList() ??
                                [];
                            return FlutterFlowDataTable<dynamic>(
                              controller: _model.paginatedDataTableController,
                              data: alerts,
                              columnsBuilder: (onSortChanged) => [
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      'Location ID',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  fixedWidth: 120.0,
                                ),
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      'Issue',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  fixedWidth: 200.0,
                                ),
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      'Raised On',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  fixedWidth: 120.0,
                                ),
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      'Assigned On',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  fixedWidth: 120.0,
                                ),
                                DataColumn2(
                                  label: DefaultTextStyle.merge(
                                    softWrap: true,
                                    child: Text(
                                      'Action',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  fixedWidth: 100.0,
                                ),
                              ],
                              dataRowBuilder: (alertsItem, alertsIndex,
                                      selected, onSelectChanged) =>
                                  DataRow(
                                color: MaterialStateProperty.all(
                                  alertsIndex % 2 == 0
                                      ? FlutterFlowTheme.of(context).accent4
                                      : FlutterFlowTheme.of(context).accent4,
                                ),
                                cells: [
                                  Text(
                                    getJsonField(
                                      alertsItem,
                                      r'''$..DID''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    getJsonField(
                                      alertsItem,
                                      r'''$..issue''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    '${(String var1) {
                                      return var1.split('T').first;
                                    }(getJsonField(
                                      alertsItem,
                                      r'''$..raised_on''',
                                    ).toString())} ${(String var1) {
                                      return var1.split('.').first;
                                    }(((String var1) {
                                      return var1.split('T').last;
                                    }(getJsonField(
                                      alertsItem,
                                      r'''$..raised_on''',
                                    ).toString())))}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      getJsonField(
                                                alertsItem,
                                                r'''$..assigned_on''',
                                              ) !=
                                              null
                                          ? '${(String var1) {
                                              return var1.split('T').first;
                                            }(getJsonField(
                                              alertsItem,
                                              r'''$..assigned_on''',
                                            ).toString())} ${(String var1) {
                                              return var1.split('.').first;
                                            }(((String var1) {
                                              return var1.split('T').last;
                                            }(getJsonField(
                                              alertsItem,
                                              r'''$..assigned_on''',
                                            ).toString())))}'
                                          : null,
                                      'Null',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (getJsonField(
                                            alertsItem,
                                            r'''$..is_active''',
                                          ) ==
                                          1)
                                        Expanded(
                                          child: Builder(
                                            builder: (context) => InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                var _shouldSetState = false;
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Assign To'),
                                                              content: Text(
                                                                  'Self Assign (${FFAppState().fullName})'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'Site Technician'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Yes'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  _model.updateAlertsResponse =
                                                      await UpdateAlertsCall
                                                          .call(
                                                    deviceId:
                                                        FFAppState().deviceId,
                                                    token: FFAppState().token,
                                                    project: FFAppState()
                                                        .userProject,
                                                    alertID: getJsonField(
                                                      alertsItem,
                                                      r'''$..id''',
                                                    ),
                                                    assignTo:
                                                        FFAppState().fullName,
                                                    assignToNum:
                                                        FFAppState().contactNum,
                                                    isActive: 2,
                                                  );
                                                  _shouldSetState = true;
                                                  if ((_model
                                                          .updateAlertsResponse
                                                          ?.succeeded ??
                                                      true)) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Info'),
                                                          content: Text(
                                                              'Alert Assigned'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Alert'),
                                                          content: Text((_model
                                                                  .updateAlertsResponse
                                                                  ?.bodyText ??
                                                              '')),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  }

                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Container(
                                                            height: 260.0,
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.75,
                                                            child:
                                                                AssignToWidget(
                                                              alertID:
                                                                  getJsonField(
                                                                alertsItem,
                                                                r'''$..id''',
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                }

                                                if (_shouldSetState)
                                                  setState(() {});
                                              },
                                              child: Text(
                                                'Assign To',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: Color(0xCD4154F1),
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (getJsonField(
                                            alertsItem,
                                            r'''$..is_active''',
                                          ) ==
                                          2)
                                        Expanded(
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              var _shouldSetState = false;
                                              if (FFAppState().contactNum > 0) {
                                                _model.checklistLoginResponse =
                                                    await PostChecklstLoginCall
                                                        .call(
                                                  contactNum:
                                                      FFAppState().contactNum,
                                                );
                                                _shouldSetState = true;
                                                if ((_model
                                                        .checklistLoginResponse
                                                        ?.succeeded ??
                                                    true)) {
                                                  _model.checklistOTPResponse =
                                                      await MasterGroup
                                                          .getChecklistOTPCall
                                                          .call(
                                                    token: FFAppState().token,
                                                    deviceId:
                                                        FFAppState().deviceId,
                                                  );
                                                  _shouldSetState = true;
                                                  if ((_model
                                                          .checklistOTPResponse
                                                          ?.succeeded ??
                                                      true)) {
                                                    _model.checklistGetTokenResponse =
                                                        await PostChecklistVerifyTokensCall
                                                            .call(
                                                      contactNum: FFAppState()
                                                          .contactNum,
                                                      otp: getJsonField(
                                                        (_model.checklistOTPResponse
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.result[0].otp''',
                                                      ).toString(),
                                                    );
                                                    _shouldSetState = true;
                                                    if ((_model
                                                            .checklistGetTokenResponse
                                                            ?.succeeded ??
                                                        true)) {
                                                      await launchURL(
                                                          'https://checklist.buildint.co/revisit/before-images?assignedToNum=${getJsonField(
                                                        alertsItem,
                                                        r'''$..assign_to_num''',
                                                      ).toString()}&assignedTo=${getJsonField(
                                                        alertsItem,
                                                        r'''$..assign_to''',
                                                      ).toString()}&token=${getJsonField(
                                                        (_model.checklistGetTokenResponse
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.token''',
                                                      ).toString()}&alertID=${getJsonField(
                                                        alertsItem,
                                                        r'''$..id''',
                                                      ).toString()}&deviceDID=${getJsonField(
                                                        alertsItem,
                                                        r'''$..DID''',
                                                      ).toString()}&location=${getJsonField(
                                                        alertsItem,
                                                        r'''$..location''',
                                                      ).toString()}&project=${FFAppState().userOrg}&database=${FFAppState().userProject}');
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                Text('Alert'),
                                                            content: Text((_model
                                                                    .checklistGetTokenResponse
                                                                    ?.bodyText ??
                                                                '')),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }

                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Alert'),
                                                          content: Text((_model
                                                                  .checklistOTPResponse
                                                                  ?.bodyText ??
                                                              '')),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  }
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Alert'),
                                                        content: Text((_model
                                                                .checklistLoginResponse
                                                                ?.bodyText ??
                                                            '')),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                }
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text('Info'),
                                                      content: Text(
                                                          'Contact Number Not set Login Again or Contact Administrator'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: Text('Ok'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }

                                              if (_shouldSetState)
                                                setState(() {});
                                            },
                                            child: Text(
                                              'Fill Checklist',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Color(0xCD4154F1),
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ].map((c) => DataCell(c)).toList(),
                              ),
                              paginated: true,
                              selectable: false,
                              hidePaginator: false,
                              showFirstLastButtons: false,
                              headingRowHeight: 56.0,
                              columnSpacing: 15.0,
                              headingRowColor:
                                  FlutterFlowTheme.of(context).primary,
                              borderRadius: BorderRadius.circular(8.0),
                              addHorizontalDivider: false,
                              addTopAndBottomDivider: false,
                              hideDefaultHorizontalDivider: false,
                              addVerticalDivider: true,
                              verticalDividerColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              verticalDividerThickness: 1.0,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
