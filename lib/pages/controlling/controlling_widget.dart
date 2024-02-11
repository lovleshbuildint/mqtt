import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'controlling_model.dart';
export 'controlling_model.dart';

class ControllingWidget extends StatefulWidget {
  const ControllingWidget({
    super.key,
    required this.did,
    required this.deviceStatus,
  });

  final String? did;
  final String? deviceStatus;

  @override
  State<ControllingWidget> createState() => _ControllingWidgetState();
}

class _ControllingWidgetState extends State<ControllingWidget> {
  late ControllingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ControllingModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userInfoRespnse = await MasterGroup.userInfoCall.call(
        token: FFAppState().token,
        deviceId: FFAppState().deviceId,
      );
      if ((_model.userInfoRespnse?.succeeded ?? true)) {
        unawaited(
          () async {
            await actions.subscribeMqtt(
              context,
              'Response',
              FFAppState().deviceId,
              widget.did,
            );
          }(),
        );
        unawaited(
          () async {
            await actions.publishMqtt(
              context,
              'Settings',
              '${widget.did}\$GRES,',
              FFAppState().deviceId,
            );
          }(),
        );
        _model.instantTimer = InstantTimer.periodic(
          duration: Duration(milliseconds: 10000),
          callback: (timer) async {
            setState(() => _model.apiRequestCompleter = null);
            await _model.waitForApiRequestCompleted(
                minWait: 1000, maxWait: 2000);
            unawaited(
              () async {
                await actions.publishMqtt(
                  context,
                  'Settings',
                  '${widget.did}\$GRES,',
                  FFAppState().deviceId,
                );
              }(),
            );
            if (FFAppState().deviceStateDid != null &&
                FFAppState().deviceStateDid != '') {
              setState(() {
                _model.relayStatus = functions.decimalToBinary((String var1) {
                  return int.parse(var1.split(',').last);
                }(FFAppState().deviceStateDid));
              });
            }
          },
          startImmediately: true,
        );
      } else {
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
      }
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
            ..complete(GetDeviceStatusCall.call(
              deviceId: FFAppState().deviceId,
              token: FFAppState().token,
              did: widget.did,
              project: FFAppState().userProject,
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
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
        final controllingGetDeviceStatusResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(13.0, 20.0, 13.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
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
                                'Controlling',
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
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(13.0, 10.0, 13.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.did,
                            'Device ID',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFF4D4D4D),
                                    fontSize: 16.0,
                                  ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 2.0, 7.0, 0.0),
                                      child: Container(
                                        width: 10.0,
                                        height: 10.0,
                                        decoration: BoxDecoration(
                                          color: widget.deviceStatus == 'Online'
                                              ? Color(0xFF07D95A)
                                              : FlutterFlowTheme.of(context)
                                                  .error,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        widget.deviceStatus,
                                        'Offline',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xFF2D2D2D),
                                            fontSize: 16.0,
                                          ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Text(
                                    '${(String var1) {
                                      return var1.split('T').first;
                                    }(getJsonField(
                                      controllingGetDeviceStatusResponse
                                          .jsonBody,
                                      r'''$.deviceStatus.evt_dt''',
                                    ).toString())} ${(String var1) {
                                      return var1.split('.').first;
                                    }(((String var1) {
                                      return var1.split('T').last;
                                    }(getJsonField(
                                      controllingGetDeviceStatusResponse
                                          .jsonBody,
                                      r'''$.deviceStatus.evt_dt''',
                                    ).toString())))}',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(13.0, 20.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 46.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF4154F1),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    6.0, 0.0, 6.0, 0.0),
                                child: Text(
                                  () {
                                    if (((String var1) {
                                          return var1[0] == "1";
                                        }((_model.relayStatus != null &&
                                                _model.relayStatus != ''
                                            ? _model.relayStatus!
                                            : getJsonField(
                                                controllingGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.RS''',
                                              ).toString()))) &&
                                        ((String var1) {
                                          return var1[1] == "1";
                                        }((_model.relayStatus != null &&
                                                _model.relayStatus != ''
                                            ? _model.relayStatus!
                                            : getJsonField(
                                                controllingGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.RS''',
                                              ).toString())))) {
                                      return 'Both AC ON';
                                    } else if (((String var1) {
                                          return var1[0] == "0";
                                        }((_model.relayStatus != null &&
                                                _model.relayStatus != ''
                                            ? _model.relayStatus!
                                            : getJsonField(
                                                controllingGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.RS''',
                                              ).toString()))) &&
                                        ((String var1) {
                                          return var1[1] == "0";
                                        }((_model.relayStatus != null &&
                                                _model.relayStatus != ''
                                            ? _model.relayStatus!
                                            : getJsonField(
                                                controllingGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.RS''',
                                              ).toString())))) {
                                      return 'Both AC OFF';
                                    } else if ((String var1) {
                                      return var1[0] == "1";
                                    }((_model.relayStatus != null &&
                                            _model.relayStatus != ''
                                        ? _model.relayStatus!
                                        : getJsonField(
                                            controllingGetDeviceStatusResponse
                                                .jsonBody,
                                            r'''$.deviceStatus.RS''',
                                          ).toString()))) {
                                      return 'AC 1 ON';
                                    } else {
                                      return 'AC 2 ON';
                                    }
                                  }(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  image: Image.asset(
                                    'assets/images/Asset_1@1x.png',
                                  ).image,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 13.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${getJsonField(
                                        controllingGetDeviceStatusResponse
                                            .jsonBody,
                                        r'''$.deviceStatus.TM''',
                                      ).toString()} C',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xFF808080),
                                            fontSize: 26.0,
                                          ),
                                    ),
                                    Container(
                                      width: 30.0,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x8007D95A),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      child: Icon(
                                        Icons.ac_unit,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    ),
                                    Container(
                                      width: 30.0,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x80F71A1A),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      child: Icon(
                                        Icons.air,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
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
                  Text(
                    FFAppState().deviceStateDid,
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  Text(
                    valueOrDefault<String>(
                      _model.relayStatus,
                      'null',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            13.0, 0.0, 13.0, 20.0),
                        child: Wrap(
                          spacing: 32.0,
                          runSpacing: 16.0,
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 89.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEFF1),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        if ((String var1) {
                                          return var1[0] == "1";
                                        }((_model.relayStatus != null &&
                                                _model.relayStatus != ''
                                            ? _model.relayStatus!
                                            : getJsonField(
                                                controllingGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.RS''',
                                              ).toString()))) {
                                          return Container(
                                            width: 38.0,
                                            height: 38.0,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                  Color(0xFFC070C2)
                                                ],
                                                stops: [0.0, 1.0],
                                                begin: AlignmentDirectional(
                                                    0.0, -1.0),
                                                end: AlignmentDirectional(
                                                    0, 1.0),
                                              ),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.home_max,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          );
                                        } else {
                                          return Container(
                                            width: 38.0,
                                            height: 38.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFA9AAAC),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.home_max,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          13.0, 0.0, 13.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 2.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF8B8C8E),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'AC 1',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xFF929395),
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 89.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEFF1),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        if ((String var1) {
                                          return var1[1] == "1";
                                        }((_model.relayStatus != null &&
                                                _model.relayStatus != ''
                                            ? _model.relayStatus!
                                            : getJsonField(
                                                controllingGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.RS''',
                                              ).toString()))) {
                                          return Container(
                                            width: 38.0,
                                            height: 38.0,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                  Color(0xFFC070C2)
                                                ],
                                                stops: [0.0, 1.0],
                                                begin: AlignmentDirectional(
                                                    0.0, -1.0),
                                                end: AlignmentDirectional(
                                                    0, 1.0),
                                              ),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.home_max,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          );
                                        } else {
                                          return Container(
                                            width: 38.0,
                                            height: 38.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFA9AAAC),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.home_max,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          13.0, 0.0, 13.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 2.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF8B8C8E),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'AC 2',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xFF929395),
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 89.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEFF1),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        if ((String var1) {
                                          return var1[2] == "1";
                                        }((_model.relayStatus != null &&
                                                _model.relayStatus != ''
                                            ? _model.relayStatus!
                                            : getJsonField(
                                                controllingGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.RS''',
                                              ).toString()))) {
                                          return Container(
                                            width: 38.0,
                                            height: 38.0,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                  Color(0xFFC070C2)
                                                ],
                                                stops: [0.0, 1.0],
                                                begin: AlignmentDirectional(
                                                    0.0, -1.0),
                                                end: AlignmentDirectional(
                                                    0, 1.0),
                                              ),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.lightbulb_outline_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          );
                                        } else {
                                          return Container(
                                            width: 38.0,
                                            height: 38.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFA9AAAC),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.lightbulb_outline_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          13.0, 0.0, 13.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 2.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF8B8C8E),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Lobby Light',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xFF929395),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 89.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEFF1),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        if ((String var1) {
                                          return var1[3] == "1";
                                        }((_model.relayStatus != null &&
                                                _model.relayStatus != ''
                                            ? _model.relayStatus!
                                            : getJsonField(
                                                controllingGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.RS''',
                                              ).toString()))) {
                                          return Container(
                                            width: 38.0,
                                            height: 38.0,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                  Color(0xFFC070C2)
                                                ],
                                                stops: [0.0, 1.0],
                                                begin: AlignmentDirectional(
                                                    0.0, -1.0),
                                                end: AlignmentDirectional(
                                                    0, 1.0),
                                              ),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.light_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          );
                                        } else {
                                          return Container(
                                            width: 38.0,
                                            height: 38.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFA9AAAC),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.light_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          13.0, 0.0, 13.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 2.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF8B8C8E),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Signage',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xFF929395),
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 89.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEFF1),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 38.0,
                                      height: 38.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            Color(0xFFC070C2)
                                          ],
                                          stops: [0.0, 1.0],
                                          begin:
                                              AlignmentDirectional(0.0, -1.0),
                                          end: AlignmentDirectional(0, 1.0),
                                        ),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.atm,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          13.0, 0.0, 13.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 2.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF8B8C8E),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'ATM',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xFF929395),
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 89.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEFF1),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 38.0,
                                      height: 38.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            Color(0xFFC070C2)
                                          ],
                                          stops: [0.0, 1.0],
                                          begin:
                                              AlignmentDirectional(0.0, -1.0),
                                          end: AlignmentDirectional(0, 1.0),
                                        ),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.fiber_dvr,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          13.0, 0.0, 13.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 2.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF8B8C8E),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'DVR',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xFF929395),
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 89.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEFF1),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 38.0,
                                      height: 38.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            Color(0xFFC070C2)
                                          ],
                                          stops: [0.0, 1.0],
                                          begin:
                                              AlignmentDirectional(0.0, -1.0),
                                          end: AlignmentDirectional(0, 1.0),
                                        ),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.router_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          13.0, 0.0, 13.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 2.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF8B8C8E),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Router',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xFF929395),
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 89.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEFF1),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 38.0,
                                      height: 38.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            Color(0xFFC070C2)
                                          ],
                                          stops: [0.0, 1.0],
                                          begin:
                                              AlignmentDirectional(0.0, -1.0),
                                          end: AlignmentDirectional(0, 1.0),
                                        ),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.router_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          13.0, 0.0, 13.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 2.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF8B8C8E),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'VSAT',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xFF929395),
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ],
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
          ),
        );
      },
    );
  }
}
