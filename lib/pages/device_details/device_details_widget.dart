import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'device_details_model.dart';
export 'device_details_model.dart';

class DeviceDetailsWidget extends StatefulWidget {
  const DeviceDetailsWidget({
    super.key,
    required this.did,
    required this.onlineOfflineStatus,
  });

  final String? did;
  final String? onlineOfflineStatus;

  @override
  State<DeviceDetailsWidget> createState() => _DeviceDetailsWidgetState();
}

class _DeviceDetailsWidgetState extends State<DeviceDetailsWidget> {
  late DeviceDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeviceDetailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.userInfoUpdate(context);
      safeSetState(() {});
      unawaited(
        () async {
          await actions.subscribeMqtt(
            context,
            'Response',
            FFAppState().deviceId,
            widget!.did,
            '15.206.230.32',
            'mqtt_buildint_\$\$2023',
          );
        }(),
      );
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 15000),
        callback: (timer) async {
          unawaited(
            () async {
              await actions.publishMqtt(
                context,
                'Settings',
                '${widget!.did}\$GALL,',
                FFAppState().deviceId,
                '15.206.230.32',
                'mqtt_buildint_\$\$2023',
              );
            }(),
          );
          if (FFAppState().relayStatusiATM != null &&
              FFAppState().relayStatusiATM != '') {
            safeSetState(() {
              _model.ac1Value = ((String var1) {
                return var1 == ''
                    ? true
                    : var1[7] == '1'
                        ? true
                        : false;
              }(getJsonField(
                FFAppState().deviceStatusDIDJson,
                r'''$.RM''',
              ).toString().toString()));
            });
            safeSetState(() {
              _model.ac2Value = ((String var1) {
                return var1 == ''
                    ? true
                    : var1[7] == '1'
                        ? true
                        : false;
              }(getJsonField(
                FFAppState().deviceStatusDIDJson,
                r'''$.RM''',
              ).toString().toString()));
            });
            safeSetState(() {
              _model.signageValue = ((String var1) {
                return var1 == ''
                    ? true
                    : var1[3] == '1'
                        ? true
                        : false;
              }(getJsonField(
                FFAppState().deviceStatusDIDJson,
                r'''$.RM''',
              ).toString().toString()));
            });
          }
        },
        startImmediately: true,
      );
    });

    _model.ac1Value = true;
    _model.ac2Value = true;
    _model.signageValue = true;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
            ..complete(GetDeviceStatusCall.call(
              deviceId: FFAppState().deviceId,
              token: FFAppState().token,
              did: widget!.did,
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
        final deviceDetailsGetDeviceStatusResponse = snapshot.data!;

        return Title(
            title: 'DeviceDetails',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
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
                        padding: EdgeInsetsDirectional.fromSTEB(
                            13.0, 20.0, 13.0, 0.0),
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
                                    'Device Details',
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
                            if ((FFAppState().role == 'Engineer') ||
                                (FFAppState().role == 'Super Admin'))
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().deleteMqttTime();
                                  FFAppState().mqttTime = '';

                                  FFAppState().deleteDeviceStatusDIDJson();
                                  FFAppState().deviceStatusDIDJson = null;

                                  FFAppState().deleteRelayStatusiATM();
                                  FFAppState().relayStatusiATM = '';

                                  safeSetState(() {});

                                  context.pushNamed(
                                    'advanceSettings',
                                    queryParameters: {
                                      'did': serializeParam(
                                        widget!.did,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Icon(
                                  Icons.settings_suggest_outlined,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 28.0,
                                ),
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            13.0, 10.0, 13.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                widget!.did,
                                'Device ID',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFF4D4D4D),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 2.0, 7.0, 0.0),
                                          child: Container(
                                            width: 10.0,
                                            height: 10.0,
                                            decoration: BoxDecoration(
                                              color: (String var1) {
                                                return var1 == "Online"
                                                    ? true
                                                    : false;
                                              }(getJsonField(
                                                deviceDetailsGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.device_status''',
                                              ).toString())
                                                  ? Color(0xFF07D95A)
                                                  : FlutterFlowTheme.of(context)
                                                      .error,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            getJsonField(
                                              deviceDetailsGetDeviceStatusResponse
                                                  .jsonBody,
                                              r'''$.deviceStatus.device_status''',
                                            )?.toString(),
                                            '-',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: Color(0xFF2D2D2D),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Text(
                                        FFAppState().mqttTime != null &&
                                                FFAppState().mqttTime != ''
                                            ? ((String var1) {
                                                return 'MQTT - ' +
                                                    var1.split('.')[0];
                                              }(FFAppState().mqttTime))
                                            : valueOrDefault<String>(
                                                '${(String var1) {
                                                  return var1.split('T').first;
                                                }(getJsonField(
                                                  deviceDetailsGetDeviceStatusResponse
                                                      .jsonBody,
                                                  r'''$.deviceStatus.evt_dt''',
                                                ).toString())} ${(String var1) {
                                                  return var1.split('.').first;
                                                }(((String var1) {
                                                  return var1.split('T').last;
                                                }(getJsonField(
                                                  deviceDetailsGetDeviceStatusResponse
                                                      .jsonBody,
                                                  r'''$.deviceStatus.evt_dt''',
                                                ).toString())))}',
                                                '0000-00-00 00:00:00',
                                              ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      if (valueOrDefault<bool>(
                        (getJsonField(
                                  deviceDetailsGetDeviceStatusResponse.jsonBody,
                                  r'''$.deviceStatus.device_status''',
                                ) !=
                                null) ||
                            ((String var1) {
                              return var1 != null && var1 != '' ? true : false;
                            }(FFAppState().deviceStatusDIDJson.toString())),
                        false,
                      ))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              13.0, 20.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
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
                                            valueOrDefault<String>(
                                              '${getJsonField(
                                                deviceDetailsGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.TM''',
                                              ).toString()} C',
                                              '0 C',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: Color(0xFF808080),
                                                  fontSize: 26.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Container(
                                            width: 30.0,
                                            height: 30.0,
                                            decoration: BoxDecoration(
                                              color: valueOrDefault<Color>(
                                                ((String var1) {
                                                          return var1 != null &&
                                                                  var1 != ''
                                                              ? (double.parse(
                                                                  var1))
                                                              : 0.00;
                                                        }(valueOrDefault<
                                                            String>(
                                                          getJsonField(
                                                            deviceDetailsGetDeviceStatusResponse
                                                                .jsonBody,
                                                            r'''$.deviceStatus.TM''',
                                                          )?.toString(),
                                                          '0.00',
                                                        ))) >=
                                                        30.0
                                                    ? Color(0x80F71A1A)
                                                    : Color(0x8007D95A),
                                                Color(0x80F71A1A),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            child: Icon(
                                              Icons.ac_unit,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                      if ((getJsonField(
                                deviceDetailsGetDeviceStatusResponse.jsonBody,
                                r'''$.deviceStatus.device_status''',
                              ) !=
                              null) ||
                          ((String var1) {
                            return var1 != null && var1 != '' ? true : false;
                          }(FFAppState().deviceStatusDIDJson.toString())))
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                safeSetState(
                                    () => _model.apiRequestCompleter = null);
                                await _model.waitForApiRequestCompleted(
                                    minWait: 2000, maxWait: 5000);
                              },
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    if ((String vn, String ve, String vu,
                                            String ue) {
                                      return vn != null && vn != ''
                                          ? ((double.parse(vn) == 0.00 &&
                                                  double.parse(ve) == 0.00 &&
                                                  double.parse(vu) == 0.00 &&
                                                  double.parse(ue) == 0.00)
                                              ? true
                                              : false)
                                          : false;
                                    }(
                                        (FFAppState().relayStatusiATM != null &&
                                                FFAppState().relayStatusiATM !=
                                                    ''
                                            ? getJsonField(
                                                FFAppState()
                                                    .deviceStatusDIDJson,
                                                r'''$.VN''',
                                              ).toString()
                                            : getJsonField(
                                                deviceDetailsGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.VN''',
                                              ).toString()),
                                        (FFAppState().relayStatusiATM != null &&
                                                FFAppState().relayStatusiATM !=
                                                    ''
                                            ? getJsonField(
                                                FFAppState()
                                                    .deviceStatusDIDJson,
                                                r'''$.VE''',
                                              ).toString()
                                            : getJsonField(
                                                deviceDetailsGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.VE''',
                                              ).toString()),
                                        (FFAppState().relayStatusiATM != null &&
                                                FFAppState().relayStatusiATM !=
                                                    ''
                                            ? getJsonField(
                                                FFAppState()
                                                    .deviceStatusDIDJson,
                                                r'''$.VU''',
                                              ).toString()
                                            : getJsonField(
                                                deviceDetailsGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.VU''',
                                              ).toString()),
                                        (FFAppState().relayStatusiATM != null &&
                                                FFAppState().relayStatusiATM !=
                                                    ''
                                            ? getJsonField(
                                                FFAppState()
                                                    .deviceStatusDIDJson,
                                                r'''$.UE''',
                                              ).toString()
                                            : getJsonField(
                                                deviceDetailsGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.ups_phase_to_earth_voltage''',
                                              ).toString())))
                                      Icon(
                                        Icons.report_problem_outlined,
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        size: 50.0,
                                      ),
                                    if ((String vn, String ve, String vu,
                                            String ue) {
                                      return vn != null && vn != ''
                                          ? ((double.parse(vn) == 0.00 &&
                                                  double.parse(ve) == 0.00 &&
                                                  double.parse(vu) == 0.00 &&
                                                  double.parse(ue) == 0.00)
                                              ? true
                                              : false)
                                          : false;
                                    }(
                                        (FFAppState().relayStatusiATM != null &&
                                                FFAppState().relayStatusiATM !=
                                                    ''
                                            ? getJsonField(
                                                FFAppState()
                                                    .deviceStatusDIDJson,
                                                r'''$.VN''',
                                              ).toString()
                                            : getJsonField(
                                                deviceDetailsGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.VN''',
                                              ).toString()),
                                        (FFAppState().relayStatusiATM != null &&
                                                FFAppState().relayStatusiATM !=
                                                    ''
                                            ? getJsonField(
                                                FFAppState()
                                                    .deviceStatusDIDJson,
                                                r'''$.VE''',
                                              ).toString()
                                            : getJsonField(
                                                deviceDetailsGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.VE''',
                                              ).toString()),
                                        (FFAppState().relayStatusiATM != null &&
                                                FFAppState().relayStatusiATM !=
                                                    ''
                                            ? getJsonField(
                                                FFAppState()
                                                    .deviceStatusDIDJson,
                                                r'''$.VU''',
                                              ).toString()
                                            : getJsonField(
                                                deviceDetailsGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.VU''',
                                              ).toString()),
                                        (FFAppState().relayStatusiATM != null &&
                                                FFAppState().relayStatusiATM !=
                                                    ''
                                            ? getJsonField(
                                                FFAppState()
                                                    .deviceStatusDIDJson,
                                                r'''$.UE''',
                                              ).toString()
                                            : getJsonField(
                                                deviceDetailsGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.ups_phase_to_earth_voltage''',
                                              ).toString())))
                                      Text(
                                        'PowerTS Device Issue',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          13.0, 20.0, 13.0, 20.0),
                                      child: Wrap(
                                        spacing: 16.0,
                                        runSpacing: 16.0,
                                        alignment: WrapAlignment.center,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: [
                                          Text(
                                            'Raw Power',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'Phase - Neutral: ${FFAppState().relayStatusiATM != null && FFAppState().relayStatusiATM != '' ? getJsonField(
                                                    FFAppState()
                                                        .deviceStatusDIDJson,
                                                    r'''$.VN''',
                                                  ).toString() : getJsonField(
                                                    deviceDetailsGetDeviceStatusResponse
                                                        .jsonBody,
                                                    r'''$.deviceStatus.VN''',
                                                  ).toString()}V',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                              Text(
                                                'Phase - Earth: ${FFAppState().relayStatusiATM != null && FFAppState().relayStatusiATM != '' ? getJsonField(
                                                    FFAppState()
                                                        .deviceStatusDIDJson,
                                                    r'''$.VE''',
                                                  ).toString() : getJsonField(
                                                    deviceDetailsGetDeviceStatusResponse
                                                        .jsonBody,
                                                    r'''$.deviceStatus.VE''',
                                                  ).toString()}V',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'UPS Power',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'Phase - Neutral: ${FFAppState().relayStatusiATM != null && FFAppState().relayStatusiATM != '' ? getJsonField(
                                                    FFAppState()
                                                        .deviceStatusDIDJson,
                                                    r'''$.VU''',
                                                  ).toString() : getJsonField(
                                                    deviceDetailsGetDeviceStatusResponse
                                                        .jsonBody,
                                                    r'''$.deviceStatus.VU''',
                                                  ).toString()}V',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                              Text(
                                                'Phase - Earth: ${FFAppState().relayStatusiATM != null && FFAppState().relayStatusiATM != '' ? getJsonField(
                                                    FFAppState()
                                                        .deviceStatusDIDJson,
                                                    r'''$.UE''',
                                                  ).toString() : getJsonField(
                                                    deviceDetailsGetDeviceStatusResponse
                                                        .jsonBody,
                                                    r'''$.deviceStatus.ups_phase_to_earth_voltage''',
                                                  ).toString()}V',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: 100.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEEFF1),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 8.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  if ((String var1,
                                                          String var2) {
                                                    return var1 != null &&
                                                            var1 != ''
                                                        ? ((double.parse(var1) <
                                                                    1.00 &&
                                                                var2[0] == '1')
                                                            ? true
                                                            : false)
                                                        : false;
                                                  }(
                                                      (FFAppState().relayStatusiATM !=
                                                                  null &&
                                                              FFAppState()
                                                                      .relayStatusiATM !=
                                                                  ''
                                                          ? getJsonField(
                                                              FFAppState()
                                                                  .deviceStatusDIDJson,
                                                              r'''$.CA1''',
                                                            ).toString()
                                                          : getJsonField(
                                                              deviceDetailsGetDeviceStatusResponse
                                                                  .jsonBody,
                                                              r'''$.deviceStatus.CAone''',
                                                            ).toString()),
                                                      (FFAppState().relayStatusiATM !=
                                                                  null &&
                                                              FFAppState()
                                                                      .relayStatusiATM !=
                                                                  ''
                                                          ? FFAppState()
                                                              .relayStatusiATM
                                                          : getJsonField(
                                                              deviceDetailsGetDeviceStatusResponse
                                                                  .jsonBody,
                                                              r'''$.deviceStatus.RS''',
                                                            ).toString())))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  5.0,
                                                                  5.0),
                                                      child: AlignedTooltip(
                                                        content: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16.0),
                                                          child: Text(
                                                            (String var1,
                                                                        String
                                                                            var2) {
                                                              return double.parse(
                                                                              var1) ==
                                                                          0.00 &&
                                                                      var2[0] ==
                                                                          '1'
                                                                  ? true
                                                                  : false;
                                                            }(
                                                                    (FFAppState().relayStatusiATM !=
                                                                                null &&
                                                                            FFAppState().relayStatusiATM !=
                                                                                ''
                                                                        ? getJsonField(
                                                                            FFAppState().deviceStatusDIDJson,
                                                                            r'''$.CA1''',
                                                                          )
                                                                            .toString()
                                                                        : getJsonField(
                                                                            deviceDetailsGetDeviceStatusResponse.jsonBody,
                                                                            r'''$.deviceStatus.CAone''',
                                                                          )
                                                                            .toString()),
                                                                    (FFAppState().relayStatusiATM !=
                                                                                null &&
                                                                            FFAppState().relayStatusiATM !=
                                                                                ''
                                                                        ? FFAppState()
                                                                            .relayStatusiATM
                                                                        : getJsonField(
                                                                            deviceDetailsGetDeviceStatusResponse.jsonBody,
                                                                            r'''$.deviceStatus.RS''',
                                                                          ).toString()))
                                                                ? 'AC 1 is not Working'
                                                                : 'AC 1 is running but consuming minimal power. Current: ${FFAppState().relayStatusiATM != null && FFAppState().relayStatusiATM != '' ? getJsonField(
                                                                    FFAppState()
                                                                        .deviceStatusDIDJson,
                                                                    r'''$.CA1''',
                                                                  ).toString() : getJsonField(
                                                                    deviceDetailsGetDeviceStatusResponse
                                                                        .jsonBody,
                                                                    r'''$.deviceStatus.CAone''',
                                                                  ).toString()}A',
                                                            textAlign: TextAlign
                                                                .justify,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        offset: 4.0,
                                                        preferredDirection:
                                                            AxisDirection.up,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                        backgroundColor:
                                                            Color(0xFF4D4D4D),
                                                        elevation: 4.0,
                                                        tailBaseWidth: 20.0,
                                                        tailLength: 18.0,
                                                        waitDuration: Duration(
                                                            milliseconds: 100),
                                                        showDuration: Duration(
                                                            milliseconds: 1500),
                                                        triggerMode:
                                                            TooltipTriggerMode
                                                                .tap,
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, -1.0),
                                                          child: Icon(
                                                            Icons
                                                                .report_problem_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  Builder(
                                                    builder: (context) {
                                                      if ((String var1) {
                                                        return var1[0] == "1";
                                                      }((FFAppState().relayStatusiATM !=
                                                                  null &&
                                                              FFAppState()
                                                                      .relayStatusiATM !=
                                                                  ''
                                                          ? FFAppState()
                                                              .relayStatusiATM
                                                          : getJsonField(
                                                              deviceDetailsGetDeviceStatusResponse
                                                                  .jsonBody,
                                                              r'''$.deviceStatus.RS''',
                                                            ).toString()))) {
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if ((_model.ac1Value ==
                                                                    false) &&
                                                                ((FFAppState()
                                                                            .role ==
                                                                        'Engineer') ||
                                                                    (FFAppState()
                                                                            .role ==
                                                                        'Super Admin')) &&
                                                                (FFAppState()
                                                                            .relayStatusiATM !=
                                                                        null &&
                                                                    FFAppState()
                                                                            .relayStatusiATM !=
                                                                        '')) {
                                                              unawaited(
                                                                () async {
                                                                  await actions
                                                                      .publishMqtt(
                                                                    context,
                                                                    'Settings',
                                                                    '${widget!.did}\$SREL${(String var1) {
                                                                      return '0' +
                                                                          var1[
                                                                              1] +
                                                                          var1[
                                                                              2] +
                                                                          var1[
                                                                              3] +
                                                                          '0000';
                                                                    }(FFAppState().relayStatusiATM)},',
                                                                    FFAppState()
                                                                        .deviceId,
                                                                    '15.206.230.32',
                                                                    'mqtt_buildint_\$\$2023',
                                                                  );
                                                                }(),
                                                              );
                                                              FFAppState()
                                                                      .relayStatusiATM =
                                                                  (String
                                                                      var1) {
                                                                return '0' +
                                                                    var1[1] +
                                                                    var1[2] +
                                                                    var1[3] +
                                                                    '0000';
                                                              }(FFAppState()
                                                                      .relayStatusiATM);
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          },
                                                          child: Container(
                                                            width: 45.0,
                                                            height: 45.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  Color(
                                                                      0xFFC070C2)
                                                                ],
                                                                stops: [
                                                                  0.0,
                                                                  1.0
                                                                ],
                                                                begin:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                end:
                                                                    AlignmentDirectional(
                                                                        0, 1.0),
                                                              ),
                                                              shape: BoxShape
                                                                  .circle,
                                                              border:
                                                                  Border.all(
                                                                color: (String var1,
                                                                            String
                                                                                var2) {
                                                                  return var1 !=
                                                                              null &&
                                                                          var1 !=
                                                                              ''
                                                                      ? ((double.parse(var1) < 1.00 &&
                                                                              var2[0] == '1')
                                                                          ? true
                                                                          : false)
                                                                      : false;
                                                                }(
                                                                        (FFAppState().relayStatusiATM != null &&
                                                                                FFAppState().relayStatusiATM !=
                                                                                    ''
                                                                            ? getJsonField(
                                                                                FFAppState().deviceStatusDIDJson,
                                                                                r'''$.CA1''',
                                                                              )
                                                                                .toString()
                                                                            : getJsonField(
                                                                                deviceDetailsGetDeviceStatusResponse.jsonBody,
                                                                                r'''$.deviceStatus.CAone''',
                                                                              )
                                                                                .toString()),
                                                                        (FFAppState().relayStatusiATM != null &&
                                                                                FFAppState().relayStatusiATM !=
                                                                                    ''
                                                                            ? FFAppState()
                                                                                .relayStatusiATM
                                                                            : getJsonField(
                                                                                deviceDetailsGetDeviceStatusResponse.jsonBody,
                                                                                r'''$.deviceStatus.RS''',
                                                                              )
                                                                                .toString()))
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .error
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child: Icon(
                                                              Icons.home_max,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                          ),
                                                        );
                                                      } else {
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if ((_model.ac1Value ==
                                                                    false) &&
                                                                ((FFAppState()
                                                                            .role ==
                                                                        'Engineer') ||
                                                                    (FFAppState()
                                                                            .role ==
                                                                        'Super Admin')) &&
                                                                (FFAppState()
                                                                            .relayStatusiATM !=
                                                                        null &&
                                                                    FFAppState()
                                                                            .relayStatusiATM !=
                                                                        '')) {
                                                              await actions
                                                                  .publishMqtt(
                                                                context,
                                                                'Settings',
                                                                '${widget!.did}\$SREL${(String var1) {
                                                                  return '1' +
                                                                      var1[1] +
                                                                      var1[2] +
                                                                      var1[3] +
                                                                      '0000';
                                                                }(FFAppState().relayStatusiATM)},',
                                                                FFAppState()
                                                                    .deviceId,
                                                                '15.206.230.32',
                                                                'mqtt_buildint_\$\$2023',
                                                              );
                                                              FFAppState()
                                                                      .relayStatusiATM =
                                                                  (String
                                                                      var1) {
                                                                return '1' +
                                                                    var1[1] +
                                                                    var1[2] +
                                                                    var1[3] +
                                                                    '0000';
                                                              }(FFAppState()
                                                                      .relayStatusiATM);
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          },
                                                          child: Container(
                                                            width: 45.0,
                                                            height: 45.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFA9AAAC),
                                                              shape: BoxShape
                                                                  .circle,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child: Icon(
                                                              Icons.home_max,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(13.0, 8.0,
                                                                13.0, 8.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 2.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF8B8C8E),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'AC 1',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: (String var2) {
                                                            return var2[0] ==
                                                                '1';
                                                          }((FFAppState().relayStatusiATM !=
                                                                          null &&
                                                                      FFAppState()
                                                                              .relayStatusiATM !=
                                                                          ''
                                                                  ? FFAppState()
                                                                      .relayStatusiATM
                                                                  : getJsonField(
                                                                      deviceDetailsGetDeviceStatusResponse
                                                                          .jsonBody,
                                                                      r'''$.deviceStatus.RS''',
                                                                    )
                                                                      .toString()))
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primaryText
                                                              : Color(
                                                                  0xFF929395),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  if ((FFAppState()
                                                                  .relayStatusiATM !=
                                                              null &&
                                                          FFAppState()
                                                                  .relayStatusiATM !=
                                                              '') &&
                                                      ((FFAppState().role ==
                                                              'Engineer') ||
                                                          (FFAppState().role ==
                                                              'Super Admin')))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 30.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x00FFFFFF),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              (String var1) {
                                                                return var1 ==
                                                                        ''
                                                                    ? true
                                                                    : var1[7] ==
                                                                            "1"
                                                                        ? true
                                                                        : false;
                                                              }(getJsonField(
                                                                FFAppState()
                                                                    .deviceStatusDIDJson,
                                                                r'''$.RM''',
                                                              ).toString())
                                                                  ? 'Auto'
                                                                  : 'Manual',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xFF929395),
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            Flexible(
                                                              child: Transform
                                                                  .scale(
                                                                scaleX: 0.7,
                                                                scaleY: 0.7,
                                                                child: Switch(
                                                                  value: _model
                                                                      .ac1Value!,
                                                                  onChanged:
                                                                      (newValue) async {
                                                                    safeSetState(() =>
                                                                        _model.ac1Value =
                                                                            newValue!);
                                                                    if (newValue!) {
                                                                      if ((FFAppState().role ==
                                                                              'Engineer') ||
                                                                          (FFAppState().role ==
                                                                              'Super Admin')) {
                                                                        await actions
                                                                            .publishMqtt(
                                                                          context,
                                                                          'Settings',
                                                                          '${widget!.did}\$SRMK${(String var1) {
                                                                            return var1 == ''
                                                                                ? '11111111'
                                                                                : (var1[0] + var1[1] + var1[2] + var1[3] + var1[4] + var1[5] + var1[6] + '1');
                                                                          }(getJsonField(
                                                                            FFAppState().deviceStatusDIDJson,
                                                                            r'''$.RM''',
                                                                          ).toString())},',
                                                                          FFAppState()
                                                                              .deviceId,
                                                                          '15.206.230.32',
                                                                          'mqtt_buildint_\$\$2023',
                                                                        );
                                                                      }
                                                                    } else {
                                                                      if ((FFAppState().role ==
                                                                              'Engineer') ||
                                                                          (FFAppState().role ==
                                                                              'Super Admin')) {
                                                                        await actions
                                                                            .publishMqtt(
                                                                          context,
                                                                          'Settings',
                                                                          '${widget!.did}\$SRMK${(String var1) {
                                                                            return var1 == ''
                                                                                ? '11111110'
                                                                                : (var1[0] + var1[1] + var1[2] + var1[3] + var1[4] + var1[5] + var1[6] + '0');
                                                                          }(getJsonField(
                                                                            FFAppState().deviceStatusDIDJson,
                                                                            r'''$.RM''',
                                                                          ).toString())},',
                                                                          FFAppState()
                                                                              .deviceId,
                                                                          '15.206.230.32',
                                                                          'mqtt_buildint_\$\$2023',
                                                                        );
                                                                      }
                                                                    }
                                                                  },
                                                                  activeColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  activeTrackColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent1,
                                                                  inactiveTrackColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                  inactiveThumbColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                ),
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
                                          Container(
                                            width: 100.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEEFF1),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 8.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  if ((String var1,
                                                          String var2) {
                                                    return var1 != null &&
                                                            var1 != ''
                                                        ? ((double.parse(var1) <
                                                                    1.00 &&
                                                                var2[1] == '1')
                                                            ? true
                                                            : false)
                                                        : false;
                                                  }(
                                                      (FFAppState().relayStatusiATM !=
                                                                  null &&
                                                              FFAppState()
                                                                      .relayStatusiATM !=
                                                                  ''
                                                          ? getJsonField(
                                                              FFAppState()
                                                                  .deviceStatusDIDJson,
                                                              r'''$.CA2''',
                                                            ).toString()
                                                          : getJsonField(
                                                              deviceDetailsGetDeviceStatusResponse
                                                                  .jsonBody,
                                                              r'''$.deviceStatus.CAtwo''',
                                                            ).toString()),
                                                      (FFAppState().relayStatusiATM !=
                                                                  null &&
                                                              FFAppState()
                                                                      .relayStatusiATM !=
                                                                  ''
                                                          ? FFAppState()
                                                              .relayStatusiATM
                                                          : getJsonField(
                                                              deviceDetailsGetDeviceStatusResponse
                                                                  .jsonBody,
                                                              r'''$.deviceStatus.RS''',
                                                            ).toString())))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  5.0,
                                                                  5.0),
                                                      child: AlignedTooltip(
                                                        content: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16.0),
                                                          child: Text(
                                                            (String var1,
                                                                        String
                                                                            var2) {
                                                              return double.parse(
                                                                              var1) ==
                                                                          0.00 &&
                                                                      var2[1] ==
                                                                          '1'
                                                                  ? true
                                                                  : false;
                                                            }(
                                                                    (FFAppState().relayStatusiATM !=
                                                                                null &&
                                                                            FFAppState().relayStatusiATM !=
                                                                                ''
                                                                        ? getJsonField(
                                                                            FFAppState().deviceStatusDIDJson,
                                                                            r'''$.CA2''',
                                                                          )
                                                                            .toString()
                                                                        : getJsonField(
                                                                            deviceDetailsGetDeviceStatusResponse.jsonBody,
                                                                            r'''$.deviceStatus.CAtwo''',
                                                                          )
                                                                            .toString()),
                                                                    (FFAppState().relayStatusiATM !=
                                                                                null &&
                                                                            FFAppState().relayStatusiATM !=
                                                                                ''
                                                                        ? FFAppState()
                                                                            .relayStatusiATM
                                                                        : getJsonField(
                                                                            deviceDetailsGetDeviceStatusResponse.jsonBody,
                                                                            r'''$.deviceStatus.RS''',
                                                                          ).toString()))
                                                                ? 'AC 2 is not Working'
                                                                : 'AC 2 is running but consuming minimal power. Current: ${FFAppState().relayStatusiATM != null && FFAppState().relayStatusiATM != '' ? getJsonField(
                                                                    FFAppState()
                                                                        .deviceStatusDIDJson,
                                                                    r'''$.CA2''',
                                                                  ).toString() : getJsonField(
                                                                    deviceDetailsGetDeviceStatusResponse
                                                                        .jsonBody,
                                                                    r'''$.deviceStatus.CAtwo''',
                                                                  ).toString()}A',
                                                            textAlign: TextAlign
                                                                .justify,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        offset: 4.0,
                                                        preferredDirection:
                                                            AxisDirection.up,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                        backgroundColor:
                                                            Color(0xFF4D4D4D),
                                                        elevation: 4.0,
                                                        tailBaseWidth: 20.0,
                                                        tailLength: 18.0,
                                                        waitDuration: Duration(
                                                            milliseconds: 100),
                                                        showDuration: Duration(
                                                            milliseconds: 1500),
                                                        triggerMode:
                                                            TooltipTriggerMode
                                                                .tap,
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, -1.0),
                                                          child: Icon(
                                                            Icons
                                                                .report_problem_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  Builder(
                                                    builder: (context) {
                                                      if ((String var1) {
                                                        return var1[1] == "1";
                                                      }((FFAppState().relayStatusiATM !=
                                                                  null &&
                                                              FFAppState()
                                                                      .relayStatusiATM !=
                                                                  ''
                                                          ? FFAppState()
                                                              .relayStatusiATM
                                                          : getJsonField(
                                                              deviceDetailsGetDeviceStatusResponse
                                                                  .jsonBody,
                                                              r'''$.deviceStatus.RS''',
                                                            ).toString()))) {
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if ((_model.ac2Value ==
                                                                    false) &&
                                                                ((FFAppState()
                                                                            .role ==
                                                                        'Engineer') ||
                                                                    (FFAppState()
                                                                            .role ==
                                                                        'Super Admin')) &&
                                                                (FFAppState()
                                                                            .relayStatusiATM !=
                                                                        null &&
                                                                    FFAppState()
                                                                            .relayStatusiATM !=
                                                                        '')) {
                                                              await actions
                                                                  .publishMqtt(
                                                                context,
                                                                'Settings',
                                                                '${widget!.did}\$SREL${(String var1) {
                                                                  return var1[
                                                                          0] +
                                                                      '0' +
                                                                      var1[2] +
                                                                      var1[3] +
                                                                      '0000';
                                                                }(FFAppState().relayStatusiATM)},',
                                                                FFAppState()
                                                                    .deviceId,
                                                                '15.206.230.32',
                                                                'mqtt_buildint_\$\$2023',
                                                              );
                                                              FFAppState()
                                                                      .relayStatusiATM =
                                                                  (String
                                                                      var1) {
                                                                return var1[0] +
                                                                    '0' +
                                                                    var1[2] +
                                                                    var1[3] +
                                                                    '0000';
                                                              }(FFAppState()
                                                                      .relayStatusiATM);
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          },
                                                          child: Container(
                                                            width: 45.0,
                                                            height: 45.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  Color(
                                                                      0xFFC070C2)
                                                                ],
                                                                stops: [
                                                                  0.0,
                                                                  1.0
                                                                ],
                                                                begin:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                end:
                                                                    AlignmentDirectional(
                                                                        0, 1.0),
                                                              ),
                                                              shape: BoxShape
                                                                  .circle,
                                                              border:
                                                                  Border.all(
                                                                color: (String var1,
                                                                            String
                                                                                var2) {
                                                                  return var1 !=
                                                                              null &&
                                                                          var1 !=
                                                                              ''
                                                                      ? ((double.parse(var1) < 1.00 &&
                                                                              var2[1] == '1')
                                                                          ? true
                                                                          : false)
                                                                      : false;
                                                                }(
                                                                        (FFAppState().relayStatusiATM != null &&
                                                                                FFAppState().relayStatusiATM !=
                                                                                    ''
                                                                            ? getJsonField(
                                                                                FFAppState().deviceStatusDIDJson,
                                                                                r'''$.CA2''',
                                                                              )
                                                                                .toString()
                                                                            : getJsonField(
                                                                                deviceDetailsGetDeviceStatusResponse.jsonBody,
                                                                                r'''$.deviceStatus.CAtwo''',
                                                                              )
                                                                                .toString()),
                                                                        (FFAppState().relayStatusiATM != null &&
                                                                                FFAppState().relayStatusiATM !=
                                                                                    ''
                                                                            ? FFAppState()
                                                                                .relayStatusiATM
                                                                            : getJsonField(
                                                                                deviceDetailsGetDeviceStatusResponse.jsonBody,
                                                                                r'''$.deviceStatus.RS''',
                                                                              )
                                                                                .toString()))
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .error
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child: Icon(
                                                              Icons.home_max,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                          ),
                                                        );
                                                      } else {
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if ((_model.ac2Value ==
                                                                    false) &&
                                                                ((FFAppState()
                                                                            .role ==
                                                                        'Engineer') ||
                                                                    (FFAppState()
                                                                            .role ==
                                                                        'Super Admin')) &&
                                                                (FFAppState()
                                                                            .relayStatusiATM !=
                                                                        null &&
                                                                    FFAppState()
                                                                            .relayStatusiATM !=
                                                                        '')) {
                                                              await actions
                                                                  .publishMqtt(
                                                                context,
                                                                'Settings',
                                                                '${widget!.did}\$SREL${(String var1) {
                                                                  return var1[
                                                                          0] +
                                                                      '1' +
                                                                      var1[2] +
                                                                      var1[3] +
                                                                      '0000';
                                                                }(FFAppState().relayStatusiATM)},',
                                                                FFAppState()
                                                                    .deviceId,
                                                                '15.206.230.32',
                                                                'mqtt_buildint_\$\$2023',
                                                              );
                                                              FFAppState()
                                                                      .relayStatusiATM =
                                                                  (String
                                                                      var1) {
                                                                return var1[0] +
                                                                    '1' +
                                                                    var1[2] +
                                                                    var1[3] +
                                                                    '0000';
                                                              }(FFAppState()
                                                                      .relayStatusiATM);
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          },
                                                          child: Container(
                                                            width: 45.0,
                                                            height: 45.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFA9AAAC),
                                                              shape: BoxShape
                                                                  .circle,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child: Icon(
                                                              Icons.home_max,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(13.0, 8.0,
                                                                13.0, 8.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 2.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF8B8C8E),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'AC 2',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: (String var2) {
                                                            return var2[1] ==
                                                                '1';
                                                          }((FFAppState().relayStatusiATM !=
                                                                          null &&
                                                                      FFAppState()
                                                                              .relayStatusiATM !=
                                                                          ''
                                                                  ? FFAppState()
                                                                      .relayStatusiATM
                                                                  : getJsonField(
                                                                      deviceDetailsGetDeviceStatusResponse
                                                                          .jsonBody,
                                                                      r'''$.deviceStatus.RS''',
                                                                    )
                                                                      .toString()))
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primaryText
                                                              : Color(
                                                                  0xFF929395),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  if ((FFAppState()
                                                                  .relayStatusiATM !=
                                                              null &&
                                                          FFAppState()
                                                                  .relayStatusiATM !=
                                                              '') &&
                                                      ((FFAppState().role ==
                                                              'Engineer') ||
                                                          (FFAppState().role ==
                                                              'Super Admin')))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 30.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x00FFFFFF),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              (String var1) {
                                                                return var1 ==
                                                                        ''
                                                                    ? true
                                                                    : var1[7] ==
                                                                            "1"
                                                                        ? true
                                                                        : false;
                                                              }(getJsonField(
                                                                FFAppState()
                                                                    .deviceStatusDIDJson,
                                                                r'''$.RM''',
                                                              ).toString())
                                                                  ? 'Auto'
                                                                  : 'Manual',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xFF929395),
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            Flexible(
                                                              child: Transform
                                                                  .scale(
                                                                scaleX: 0.7,
                                                                scaleY: 0.7,
                                                                child: Switch(
                                                                  value: _model
                                                                      .ac2Value!,
                                                                  onChanged:
                                                                      (newValue) async {
                                                                    safeSetState(() =>
                                                                        _model.ac2Value =
                                                                            newValue!);
                                                                    if (newValue!) {
                                                                      if ((FFAppState().role ==
                                                                              'Engineer') ||
                                                                          (FFAppState().role ==
                                                                              'Super Admin')) {
                                                                        await actions
                                                                            .publishMqtt(
                                                                          context,
                                                                          'Settings',
                                                                          '${widget!.did}\$SRMK${(String var1) {
                                                                            return var1 == ''
                                                                                ? '11111111'
                                                                                : (var1[0] + var1[1] + var1[2] + var1[3] + var1[4] + var1[5] + var1[6] + '1');
                                                                          }(getJsonField(
                                                                            FFAppState().deviceStatusDIDJson,
                                                                            r'''$.RM''',
                                                                          ).toString())},',
                                                                          FFAppState()
                                                                              .deviceId,
                                                                          '15.206.230.32',
                                                                          'mqtt_buildint_\$\$2023',
                                                                        );
                                                                      }
                                                                    } else {
                                                                      if ((FFAppState().role ==
                                                                              'Engineer') ||
                                                                          (FFAppState().role ==
                                                                              'Super Admin')) {
                                                                        await actions
                                                                            .publishMqtt(
                                                                          context,
                                                                          'Settings',
                                                                          '${widget!.did}\$SRMK${(String var1) {
                                                                            return var1 == ''
                                                                                ? '11111110'
                                                                                : (var1[0] + var1[1] + var1[2] + var1[3] + var1[4] + var1[5] + var1[6] + '0');
                                                                          }(getJsonField(
                                                                            FFAppState().deviceStatusDIDJson,
                                                                            r'''$.RM''',
                                                                          ).toString())},',
                                                                          FFAppState()
                                                                              .deviceId,
                                                                          '15.206.230.32',
                                                                          'mqtt_buildint_\$\$2023',
                                                                        );
                                                                      }
                                                                    }
                                                                  },
                                                                  activeColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  activeTrackColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent1,
                                                                  inactiveTrackColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                  inactiveThumbColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                ),
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
                                          Container(
                                            width: 100.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEEFF1),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 8.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  if ((String var1,
                                                          String var2) {
                                                    return var1 != null &&
                                                            var1 != ''
                                                        ? ((double.parse(
                                                                        var1) ==
                                                                    0.00 &&
                                                                var2[3] == '1')
                                                            ? true
                                                            : false)
                                                        : false;
                                                  }(
                                                      (FFAppState().relayStatusiATM !=
                                                                  null &&
                                                              FFAppState()
                                                                      .relayStatusiATM !=
                                                                  ''
                                                          ? getJsonField(
                                                              FFAppState()
                                                                  .deviceStatusDIDJson,
                                                              r'''$.CS''',
                                                            ).toString()
                                                          : getJsonField(
                                                              deviceDetailsGetDeviceStatusResponse
                                                                  .jsonBody,
                                                              r'''$.deviceStatus.CS''',
                                                            ).toString()),
                                                      (FFAppState().relayStatusiATM !=
                                                                  null &&
                                                              FFAppState()
                                                                      .relayStatusiATM !=
                                                                  ''
                                                          ? FFAppState()
                                                              .relayStatusiATM
                                                          : getJsonField(
                                                              deviceDetailsGetDeviceStatusResponse
                                                                  .jsonBody,
                                                              r'''$.deviceStatus.RS''',
                                                            ).toString())))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  5.0,
                                                                  5.0),
                                                      child: AlignedTooltip(
                                                        content: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16.0),
                                                          child: Text(
                                                            (String var1,
                                                                        String
                                                                            var2) {
                                                              return double.parse(
                                                                              var1) ==
                                                                          0.00 &&
                                                                      var2[3] ==
                                                                          '1'
                                                                  ? true
                                                                  : false;
                                                            }(
                                                                    (FFAppState().relayStatusiATM !=
                                                                                null &&
                                                                            FFAppState().relayStatusiATM !=
                                                                                ''
                                                                        ? getJsonField(
                                                                            FFAppState().deviceStatusDIDJson,
                                                                            r'''$.CS''',
                                                                          )
                                                                            .toString()
                                                                        : getJsonField(
                                                                            deviceDetailsGetDeviceStatusResponse.jsonBody,
                                                                            r'''$.deviceStatus.CS''',
                                                                          )
                                                                            .toString()),
                                                                    (FFAppState().relayStatusiATM !=
                                                                                null &&
                                                                            FFAppState().relayStatusiATM !=
                                                                                ''
                                                                        ? FFAppState()
                                                                            .relayStatusiATM
                                                                        : getJsonField(
                                                                            deviceDetailsGetDeviceStatusResponse.jsonBody,
                                                                            r'''$.deviceStatus.RS''',
                                                                          ).toString()))
                                                                ? 'Signage is not Working'
                                                                : 'Signage is not working${FFAppState().relayStatusiATM != null && FFAppState().relayStatusiATM != '' ? getJsonField(
                                                                    FFAppState()
                                                                        .deviceStatusDIDJson,
                                                                    r'''$.CS''',
                                                                  ).toString() : getJsonField(
                                                                    deviceDetailsGetDeviceStatusResponse
                                                                        .jsonBody,
                                                                    r'''$.deviceStatus.CS''',
                                                                  ).toString()}A',
                                                            textAlign: TextAlign
                                                                .justify,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        offset: 4.0,
                                                        preferredDirection:
                                                            AxisDirection.up,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                        backgroundColor:
                                                            Color(0xFF4D4D4D),
                                                        elevation: 4.0,
                                                        tailBaseWidth: 20.0,
                                                        tailLength: 18.0,
                                                        waitDuration: Duration(
                                                            milliseconds: 100),
                                                        showDuration: Duration(
                                                            milliseconds: 1500),
                                                        triggerMode:
                                                            TooltipTriggerMode
                                                                .tap,
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, -1.0),
                                                          child: Icon(
                                                            Icons
                                                                .report_problem_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  Builder(
                                                    builder: (context) {
                                                      if ((String var1) {
                                                        return var1[3] == "1";
                                                      }((FFAppState().relayStatusiATM !=
                                                                  null &&
                                                              FFAppState()
                                                                      .relayStatusiATM !=
                                                                  ''
                                                          ? FFAppState()
                                                              .relayStatusiATM
                                                          : getJsonField(
                                                              deviceDetailsGetDeviceStatusResponse
                                                                  .jsonBody,
                                                              r'''$.deviceStatus.RS''',
                                                            ).toString()))) {
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if ((_model.signageValue ==
                                                                    false) &&
                                                                ((FFAppState()
                                                                            .role ==
                                                                        'Engineer') ||
                                                                    (FFAppState()
                                                                            .role ==
                                                                        'Super Admin')) &&
                                                                (FFAppState()
                                                                            .relayStatusiATM !=
                                                                        null &&
                                                                    FFAppState()
                                                                            .relayStatusiATM !=
                                                                        '')) {
                                                              await actions
                                                                  .publishMqtt(
                                                                context,
                                                                'Settings',
                                                                '${widget!.did}\$SREL${(String var1) {
                                                                  return var1[
                                                                          0] +
                                                                      var1[1] +
                                                                      var1[2] +
                                                                      '0' +
                                                                      '0000';
                                                                }(FFAppState().relayStatusiATM)},',
                                                                FFAppState()
                                                                    .deviceId,
                                                                '15.206.230.32',
                                                                'mqtt_buildint_\$\$2023',
                                                              );
                                                              FFAppState()
                                                                      .relayStatusiATM =
                                                                  (String
                                                                      var1) {
                                                                return var1[0] +
                                                                    var1[1] +
                                                                    var1[2] +
                                                                    '0' +
                                                                    '0000';
                                                              }(FFAppState()
                                                                      .relayStatusiATM);
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          },
                                                          child: Container(
                                                            width: 45.0,
                                                            height: 45.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  Color(
                                                                      0xFFC070C2)
                                                                ],
                                                                stops: [
                                                                  0.0,
                                                                  1.0
                                                                ],
                                                                begin:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                end:
                                                                    AlignmentDirectional(
                                                                        0, 1.0),
                                                              ),
                                                              shape: BoxShape
                                                                  .circle,
                                                              border:
                                                                  Border.all(
                                                                color: (String var1,
                                                                            String
                                                                                var2) {
                                                                  return var1 !=
                                                                              null &&
                                                                          var1 !=
                                                                              ''
                                                                      ? ((double.parse(var1) == 0.00 &&
                                                                              var2[3] == '1')
                                                                          ? true
                                                                          : false)
                                                                      : false;
                                                                }(
                                                                        (FFAppState().relayStatusiATM != null &&
                                                                                FFAppState().relayStatusiATM !=
                                                                                    ''
                                                                            ? getJsonField(
                                                                                FFAppState().deviceStatusDIDJson,
                                                                                r'''$.CS''',
                                                                              )
                                                                                .toString()
                                                                            : getJsonField(
                                                                                deviceDetailsGetDeviceStatusResponse.jsonBody,
                                                                                r'''$.deviceStatus.CS''',
                                                                              )
                                                                                .toString()),
                                                                        (FFAppState().relayStatusiATM != null &&
                                                                                FFAppState().relayStatusiATM !=
                                                                                    ''
                                                                            ? FFAppState()
                                                                                .relayStatusiATM
                                                                            : getJsonField(
                                                                                deviceDetailsGetDeviceStatusResponse.jsonBody,
                                                                                r'''$.deviceStatus.RS''',
                                                                              )
                                                                                .toString()))
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .error
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child: Icon(
                                                              Icons
                                                                  .light_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                          ),
                                                        );
                                                      } else {
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if ((_model.signageValue ==
                                                                    false) &&
                                                                ((FFAppState()
                                                                            .role ==
                                                                        'Engineer') ||
                                                                    (FFAppState()
                                                                            .role ==
                                                                        'Super Admin')) &&
                                                                (FFAppState()
                                                                            .relayStatusiATM !=
                                                                        null &&
                                                                    FFAppState()
                                                                            .relayStatusiATM !=
                                                                        '')) {
                                                              await actions
                                                                  .publishMqtt(
                                                                context,
                                                                'Settings',
                                                                '${widget!.did}\$SREL${(String var1) {
                                                                  return var1[
                                                                          0] +
                                                                      var1[1] +
                                                                      var1[2] +
                                                                      '1' +
                                                                      '0000';
                                                                }(FFAppState().relayStatusiATM)},',
                                                                FFAppState()
                                                                    .deviceId,
                                                                '15.206.230.32',
                                                                'mqtt_buildint_\$\$2023',
                                                              );
                                                              FFAppState()
                                                                      .relayStatusiATM =
                                                                  (String
                                                                      var1) {
                                                                return var1[0] +
                                                                    var1[1] +
                                                                    var1[2] +
                                                                    '1' +
                                                                    '0000';
                                                              }(FFAppState()
                                                                      .relayStatusiATM);
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          },
                                                          child: Container(
                                                            width: 45.0,
                                                            height: 45.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFA9AAAC),
                                                              shape: BoxShape
                                                                  .circle,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child: Icon(
                                                              Icons
                                                                  .light_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(13.0, 8.0,
                                                                13.0, 8.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 2.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF8B8C8E),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Signage',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: (String var2) {
                                                            return var2[3] ==
                                                                '1';
                                                          }((FFAppState().relayStatusiATM !=
                                                                          null &&
                                                                      FFAppState()
                                                                              .relayStatusiATM !=
                                                                          ''
                                                                  ? FFAppState()
                                                                      .relayStatusiATM
                                                                  : getJsonField(
                                                                      deviceDetailsGetDeviceStatusResponse
                                                                          .jsonBody,
                                                                      r'''$.deviceStatus.RS''',
                                                                    )
                                                                      .toString()))
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primaryText
                                                              : Color(
                                                                  0xFF929395),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  if ((FFAppState()
                                                                  .relayStatusiATM !=
                                                              null &&
                                                          FFAppState()
                                                                  .relayStatusiATM !=
                                                              '') &&
                                                      ((FFAppState().role ==
                                                              'Engineer') ||
                                                          (FFAppState().role ==
                                                              'Super Admin')))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 30.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x00FFFFFF),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              (String var1) {
                                                                return var1 ==
                                                                        ''
                                                                    ? true
                                                                    : var1[3] ==
                                                                            "1"
                                                                        ? true
                                                                        : false;
                                                              }(getJsonField(
                                                                FFAppState()
                                                                    .deviceStatusDIDJson,
                                                                r'''$.RM''',
                                                              ).toString())
                                                                  ? 'Auto'
                                                                  : 'Manual',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xFF929395),
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            Flexible(
                                                              child: Transform
                                                                  .scale(
                                                                scaleX: 0.7,
                                                                scaleY: 0.7,
                                                                child: Switch(
                                                                  value: _model
                                                                      .signageValue!,
                                                                  onChanged:
                                                                      (newValue) async {
                                                                    safeSetState(() =>
                                                                        _model.signageValue =
                                                                            newValue!);
                                                                    if (newValue!) {
                                                                      if ((FFAppState().role ==
                                                                              'Engineer') ||
                                                                          (FFAppState().role ==
                                                                              'Super Admin')) {
                                                                        await actions
                                                                            .publishMqtt(
                                                                          context,
                                                                          'Settings',
                                                                          '${widget!.did}\$SRMK${(String var1) {
                                                                            return var1 == ''
                                                                                ? '11111111'
                                                                                : (var1[0] + var1[1] + var1[2] + '1' + var1[4] + var1[5] + var1[6] + var1[7]);
                                                                          }(getJsonField(
                                                                            FFAppState().deviceStatusDIDJson,
                                                                            r'''$.RM''',
                                                                          ).toString())},',
                                                                          FFAppState()
                                                                              .deviceId,
                                                                          '15.206.230.32',
                                                                          'mqtt_buildint_\$\$2023',
                                                                        );
                                                                      }
                                                                    } else {
                                                                      if ((FFAppState().role ==
                                                                              'Engineer') ||
                                                                          (FFAppState().role ==
                                                                              'Super Admin')) {
                                                                        await actions
                                                                            .publishMqtt(
                                                                          context,
                                                                          'Settings',
                                                                          '${widget!.did}\$SRMK${(String var1) {
                                                                            return var1 == ''
                                                                                ? '11101111'
                                                                                : (var1[0] + var1[1] + var1[2] + '0' + var1[4] + var1[5] + var1[6] + var1[7]);
                                                                          }(getJsonField(
                                                                            FFAppState().deviceStatusDIDJson,
                                                                            r'''$.RM''',
                                                                          ).toString())},',
                                                                          FFAppState()
                                                                              .deviceId,
                                                                          '15.206.230.32',
                                                                          'mqtt_buildint_\$\$2023',
                                                                        );
                                                                      }
                                                                    }
                                                                  },
                                                                  activeColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  activeTrackColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent1,
                                                                  inactiveTrackColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                  inactiveThumbColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                ),
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
                                          Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEEFF1),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 45.0,
                                                    height: 45.0,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                          Color(0xFFC070C2)
                                                        ],
                                                        stops: [0.0, 1.0],
                                                        begin:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        end:
                                                            AlignmentDirectional(
                                                                0, 1.0),
                                                      ),
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Icon(
                                                      Icons.atm,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(13.0, 0.0,
                                                                13.0, 0.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 2.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF8B8C8E),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'ATM',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color:
                                                              Color(0xFF929395),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEEFF1),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 45.0,
                                                    height: 45.0,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                          Color(0xFFC070C2)
                                                        ],
                                                        stops: [0.0, 1.0],
                                                        begin:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        end:
                                                            AlignmentDirectional(
                                                                0, 1.0),
                                                      ),
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Icon(
                                                      Icons.fiber_dvr,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(13.0, 0.0,
                                                                13.0, 0.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 2.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF8B8C8E),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'DVR',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color:
                                                              Color(0xFF929395),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEEFF1),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 45.0,
                                                    height: 45.0,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                          Color(0xFFC070C2)
                                                        ],
                                                        stops: [0.0, 1.0],
                                                        begin:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        end:
                                                            AlignmentDirectional(
                                                                0, 1.0),
                                                      ),
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Icon(
                                                      Icons.router_outlined,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(13.0, 0.0,
                                                                13.0, 0.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 2.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF8B8C8E),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Router',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color:
                                                              Color(0xFF929395),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ],
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
