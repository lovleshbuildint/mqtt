import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/pages/switch3_b_s_a_t_m_auto_manual/switch3_b_s_a_t_m_auto_manual_widget.dart';
import 'dart:async';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'device_details_a_t_m_buildint_model.dart';
export 'device_details_a_t_m_buildint_model.dart';

class DeviceDetailsATMBuildintWidget extends StatefulWidget {
  const DeviceDetailsATMBuildintWidget({
    super.key,
    required this.did,
    required this.onlineOfflineStatus,
    required this.macID,
  });

  final String? did;
  final String? onlineOfflineStatus;
  final String? macID;

  static String routeName = 'DeviceDetailsATMBuildint';
  static String routePath = '/deviceDetailsATMBuildint';

  @override
  State<DeviceDetailsATMBuildintWidget> createState() =>
      _DeviceDetailsATMBuildintWidgetState();
}

class _DeviceDetailsATMBuildintWidgetState
    extends State<DeviceDetailsATMBuildintWidget> {
  late DeviceDetailsATMBuildintModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeviceDetailsATMBuildintModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.userInfoUpdate(context);
      safeSetState(() {});
      unawaited(
        () async {
          await actions.subscribeMqtt(
            context,
            'Response/${widget!.macID}',
            FFAppState().deviceId,
            widget!.did,
            '15.206.230.32',
            'mqtt_buildint_\$\$2023',
            'iATM - BuildINT',
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
                'Setting/${widget!.macID}',
                '{\"SIOT\":\"GMR\"}',
                FFAppState().deviceId,
                '15.206.230.32',
                'mqtt_buildint_\$\$2023',
              );
            }(),
          );
        },
        startImmediately: true,
      );
    });

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
        final deviceDetailsATMBuildintGetDeviceStatusResponse = snapshot.data!;

        return Title(
            title: 'DeviceDetailsATMBuildint',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
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
                                          font: GoogleFonts.readexPro(
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFF2D2D2D),
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
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
                                    AdvanceSettingsWidget.routeName,
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
                                widget!.did != null && widget!.did != ''
                                    ? widget!.did
                                    : widget!.macID,
                                'Device ID',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF4D4D4D),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
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
                                                deviceDetailsATMBuildintGetDeviceStatusResponse
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
                                              deviceDetailsATMBuildintGetDeviceStatusResponse
                                                  .jsonBody,
                                              r'''$.deviceStatus.device_status''',
                                            )?.toString(),
                                            '-',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.readexPro(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFF2D2D2D),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
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
                                                  deviceDetailsATMBuildintGetDeviceStatusResponse
                                                      .jsonBody,
                                                  r'''$.deviceStatus.evt_dt''',
                                                ).toString())} ${(String var1) {
                                                  return var1.split('.').first;
                                                }(((String var1) {
                                                  return var1.split('T').last;
                                                }(getJsonField(
                                                  deviceDetailsATMBuildintGetDeviceStatusResponse
                                                      .jsonBody,
                                                  r'''$.deviceStatus.evt_dt''',
                                                ).toString())))}',
                                                '0000-00-00 00:00:00',
                                              ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
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
                                  deviceDetailsATMBuildintGetDeviceStatusResponse
                                      .jsonBody,
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
                                            getJsonField(
                                                      FFAppState().BSIATMMQTT,
                                                      r'''$.Temp''',
                                                    ) !=
                                                    null
                                                ? '${getJsonField(
                                                    FFAppState().BSIATMMQTT,
                                                    r'''$.Temp''',
                                                  ).toString()} C'
                                                : valueOrDefault<String>(
                                                    '${getJsonField(
                                                      deviceDetailsATMBuildintGetDeviceStatusResponse
                                                          .jsonBody,
                                                      r'''$.deviceStatus.TM''',
                                                    ).toString()} C',
                                                    '0 C',
                                                  ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.readexPro(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF808080),
                                                  fontSize: 26.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
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
                                                        }((getJsonField(
                                                                  FFAppState()
                                                                      .BSIATMMQTT,
                                                                  r'''$.Temp''',
                                                                ) !=
                                                                null
                                                            ? getJsonField(
                                                                FFAppState()
                                                                    .BSIATMMQTT,
                                                                r'''$.Temp''',
                                                              ).toString()
                                                            : valueOrDefault<
                                                                String>(
                                                                getJsonField(
                                                                  deviceDetailsATMBuildintGetDeviceStatusResponse
                                                                      .jsonBody,
                                                                  r'''$.deviceStatus.TM''',
                                                                )?.toString(),
                                                                '0.00',
                                                              )))) >=
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
                                deviceDetailsATMBuildintGetDeviceStatusResponse
                                    .jsonBody,
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
                                        (getJsonField(
                                                  FFAppState().BSIATMMQTT,
                                                  r'''$.RPN''',
                                                ) !=
                                                null
                                            ? getJsonField(
                                                FFAppState().BSIATMMQTT,
                                                r'''$.RPN''',
                                              ).toString()
                                            : getJsonField(
                                                deviceDetailsATMBuildintGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.VN''',
                                              ).toString()),
                                        (getJsonField(
                                                  FFAppState().BSIATMMQTT,
                                                  r'''$.RPE''',
                                                ) !=
                                                null
                                            ? getJsonField(
                                                FFAppState().BSIATMMQTT,
                                                r'''$.RPE''',
                                              ).toString()
                                            : getJsonField(
                                                deviceDetailsATMBuildintGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.VE''',
                                              ).toString()),
                                        (getJsonField(
                                                  FFAppState().BSIATMMQTT,
                                                  r'''$.UPN''',
                                                ) !=
                                                null
                                            ? getJsonField(
                                                FFAppState().BSIATMMQTT,
                                                r'''$.UPN''',
                                              ).toString()
                                            : getJsonField(
                                                deviceDetailsATMBuildintGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.VU''',
                                              ).toString()),
                                        (getJsonField(
                                                  FFAppState().BSIATMMQTT,
                                                  r'''$.UPE''',
                                                ) !=
                                                null
                                            ? getJsonField(
                                                FFAppState().BSIATMMQTT,
                                                r'''$.UPE''',
                                              ).toString()
                                            : getJsonField(
                                                deviceDetailsATMBuildintGetDeviceStatusResponse
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
                                        (getJsonField(
                                                  FFAppState().BSIATMMQTT,
                                                  r'''$.RPN''',
                                                ) !=
                                                null
                                            ? getJsonField(
                                                FFAppState().BSIATMMQTT,
                                                r'''$.RPN''',
                                              ).toString()
                                            : getJsonField(
                                                deviceDetailsATMBuildintGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.VN''',
                                              ).toString()),
                                        (getJsonField(
                                                  FFAppState().BSIATMMQTT,
                                                  r'''$.RPE''',
                                                ) !=
                                                null
                                            ? getJsonField(
                                                FFAppState().BSIATMMQTT,
                                                r'''$.RPE''',
                                              ).toString()
                                            : getJsonField(
                                                deviceDetailsATMBuildintGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.VE''',
                                              ).toString()),
                                        (getJsonField(
                                                  FFAppState().BSIATMMQTT,
                                                  r'''$.UPN''',
                                                ) !=
                                                null
                                            ? getJsonField(
                                                FFAppState().BSIATMMQTT,
                                                r'''$.UPN''',
                                              ).toString()
                                            : getJsonField(
                                                deviceDetailsATMBuildintGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.VU''',
                                              ).toString()),
                                        (getJsonField(
                                                  FFAppState().BSIATMMQTT,
                                                  r'''$.UPE''',
                                                ) !=
                                                null
                                            ? getJsonField(
                                                FFAppState().BSIATMMQTT,
                                                r'''$.UPE''',
                                              ).toString()
                                            : getJsonField(
                                                deviceDetailsATMBuildintGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.ups_phase_to_earth_voltage''',
                                              ).toString())))
                                      Text(
                                        'Power TS Device Issue',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        'Raw Power',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight: FontWeight.w800,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w800,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Phase - Neutral: ${getJsonField(
                                                  FFAppState().BSIATMMQTT,
                                                  r'''$.RPN''',
                                                ) != null ? getJsonField(
                                                FFAppState().BSIATMMQTT,
                                                r'''$.RPN''',
                                              ).toString() : getJsonField(
                                                deviceDetailsATMBuildintGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.VN''',
                                              ).toString()}V',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.readexPro(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            'Phase - Earth: ${getJsonField(
                                                  FFAppState().BSIATMMQTT,
                                                  r'''$.RPE''',
                                                ) != null ? getJsonField(
                                                FFAppState().BSIATMMQTT,
                                                r'''$.RPE''',
                                              ).toString() : getJsonField(
                                                deviceDetailsATMBuildintGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.VE''',
                                              ).toString()}V',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.readexPro(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        'UPS Power',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight: FontWeight.w800,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w800,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Phase - Neutral: ${getJsonField(
                                                  FFAppState().BSIATMMQTT,
                                                  r'''$.UPN''',
                                                ) != null ? getJsonField(
                                                FFAppState().BSIATMMQTT,
                                                r'''$.UPN''',
                                              ).toString() : getJsonField(
                                                deviceDetailsATMBuildintGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.VU''',
                                              ).toString()}V',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.readexPro(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            'Phase - Earth: ${getJsonField(
                                                  FFAppState().BSIATMMQTT,
                                                  r'''$.UPE''',
                                                ) != null ? getJsonField(
                                                FFAppState().BSIATMMQTT,
                                                r'''$.UPE''',
                                              ).toString() : getJsonField(
                                                deviceDetailsATMBuildintGetDeviceStatusResponse
                                                    .jsonBody,
                                                r'''$.deviceStatus.ups_phase_to_earth_voltage''',
                                              ).toString()}V',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.readexPro(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (FFAppState().deviceStatusDIDJson !=
                                        null)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            13.0, 20.0, 13.0, 20.0),
                                        child: Builder(
                                          builder: (context) {
                                            final relayList = getJsonField(
                                              FFAppState().deviceStatusDIDJson,
                                              r'''$.*''',
                                            ).toList();

                                            return Wrap(
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
                                              children: List.generate(
                                                  relayList.length,
                                                  (relayListIndex) {
                                                final relayListItem =
                                                    relayList[relayListIndex];
                                                return Container(
                                                  child:
                                                      Switch3BSATMAutoManualWidget(
                                                    key: Key(
                                                        'Keypgp_${relayListIndex}_of_${relayList.length}'),
                                                    macID: widget!.macID!,
                                                    deviceId:
                                                        FFAppState().deviceId,
                                                    relayData: getJsonField(
                                                      relayListItem,
                                                      r'''$''',
                                                    ),
                                                  ),
                                                );
                                              }),
                                            );
                                          },
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
