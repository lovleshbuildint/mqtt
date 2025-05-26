import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'switch3_b_s_a_t_m_auto_manual_model.dart';
export 'switch3_b_s_a_t_m_auto_manual_model.dart';

/// This conponent is used to check and update the Auto mode and manual mode
/// for relay of BSiATM devices
class Switch3BSATMAutoManualWidget extends StatefulWidget {
  const Switch3BSATMAutoManualWidget({
    super.key,
    required this.macID,
    required this.deviceId,
    required this.relayData,
  });

  final String? macID;

  /// handset ID
  final String? deviceId;

  final dynamic relayData;

  @override
  State<Switch3BSATMAutoManualWidget> createState() =>
      _Switch3BSATMAutoManualWidgetState();
}

class _Switch3BSATMAutoManualWidgetState
    extends State<Switch3BSATMAutoManualWidget> {
  late Switch3BSATMAutoManualModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Switch3BSATMAutoManualModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          if (FFAppState().mqttTime != _model.prevMqttTime) {
            _model.prevMqttTime = FFAppState().mqttTime;
            _model.relayState = getJsonField(
              widget!.relayData,
              r'''$.Relay''',
            ).toString().toString();
            safeSetState(() {});
            safeSetState(() {
              _model.switchValue1 = ((String var1) {
                return var1 == "1" ? true : false;
              }(getJsonField(
                widget!.relayData,
                r'''$.CS''',
              ).toString().toString()));
            });
            safeSetState(() {
              _model.switchValue2 = ((String var1, String var2) {
                return (var1 == "1" && var2 == "1") ? true : false;
              }(
                  getJsonField(
                    widget!.relayData,
                    r'''$.CS''',
                  ).toString().toString(),
                  getJsonField(
                    FFAppState().BSIATMMQTT,
                    r'''$.PPDCT''',
                  ).toString().toString()));
            });
          }
        },
        startImmediately: true,
      );
    });

    _model.switchValue1 = (String var1) {
      return var1 == "1" ? true : false;
    }(getJsonField(
      widget!.relayData,
      r'''$.CS''',
    ).toString().toString());
    _model.switchValue2 = (String var1, String var2) {
      return (var1 == "1" && var2 == "1") ? true : false;
    }(
        getJsonField(
          widget!.relayData,
          r'''$.CS''',
        ).toString().toString(),
        getJsonField(
          FFAppState().BSIATMMQTT,
          r'''$.PPDCT''',
        ).toString().toString());
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 100.0,
          decoration: BoxDecoration(
            color: Color(0xFFEEEFF1),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if ((String var1, String var2) {
                  return double.tryParse(var1) == 0.00 && var2 == "1"
                      ? true
                      : false;
                }(
                    getJsonField(
                      widget!.relayData,
                      r'''$.I''',
                    ).toString(),
                    getJsonField(
                      widget!.relayData,
                      r'''$.Relay''',
                    ).toString()))
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 5.0),
                    child: AlignedTooltip(
                      content: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          '${getJsonField(
                            widget!.relayData,
                            r'''$.Label''',
                          ).toString()} is not working',
                          textAlign: TextAlign.justify,
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      offset: 4.0,
                      preferredDirection: AxisDirection.up,
                      borderRadius: BorderRadius.circular(4.0),
                      backgroundColor: Color(0xFF4D4D4D),
                      elevation: 4.0,
                      tailBaseWidth: 20.0,
                      tailLength: 18.0,
                      waitDuration: Duration(milliseconds: 100),
                      showDuration: Duration(milliseconds: 1500),
                      triggerMode: TooltipTriggerMode.tap,
                      child: Align(
                        alignment: AlignmentDirectional(1.0, -1.0),
                        child: Icon(
                          Icons.report_problem_outlined,
                          color: FlutterFlowTheme.of(context).error,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ),
                Builder(
                  builder: (context) {
                    if ((String var1) {
                      return var1 == "1" ? true : false;
                    }(_model.relayState)) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (((FFAppState().role == 'Engineer') ||
                                  (FFAppState().role == 'Super Admin') ||
                                  (FFAppState().role == 'ATMO')) &&
                              ((String var1) {
                                return var1 == "0" ? true : false;
                              }(getJsonField(
                                widget!.relayData,
                                r'''$.CS''',
                              ).toString()))) {
                            await actions.publishMqtt(
                              context,
                              'Setting/${widget!.macID}',
                              '{ \"${getJsonField(
                                widget!.relayData,
                                r'''$.RelayTag''',
                              ).toString()}MC\" : \"0\", \"SIOT\": \"GMR\"}',
                              FFAppState().deviceId,
                              '15.206.230.32',
                              'mqtt_buildint_\$\$2023',
                            );
                            _model.relayState = '0';
                            safeSetState(() {});
                            return;
                          } else {
                            return;
                          }
                        },
                        onLongPress: () async {
                          if (((FFAppState().role == 'Engineer') ||
                                  (FFAppState().role == 'Super Admin') ||
                                  (FFAppState().role == 'ATMO')) &&
                              ((String var1) {
                                return var1 == "1" ? true : false;
                              }(getJsonField(
                                widget!.relayData,
                                r'''$.CS''',
                              ).toString()))) {
                            await actions.publishMqtt(
                              context,
                              'Setting/${widget!.macID}',
                              '{ \"${getJsonField(
                                widget!.relayData,
                                r'''$.RelayTag''',
                              ).toString()}RRST\" : \"1\", \"SIOT\": \"GMR\"}',
                              FFAppState().deviceId,
                              '15.206.230.32',
                              'mqtt_buildint_\$\$2023',
                            );
                            return;
                          } else {
                            return;
                          }
                        },
                        child: Container(
                          width: 45.0,
                          height: 45.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                FlutterFlowTheme.of(context).primary,
                                Color(0xFFC070C2)
                              ],
                              stops: [0.0, 1.0],
                              begin: AlignmentDirectional(0.0, -1.0),
                              end: AlignmentDirectional(0, 1.0),
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: (String var1) {
                                return double.tryParse(var1) == 0.00
                                    ? true
                                    : false;
                              }(getJsonField(
                                widget!.relayData,
                                r'''$.I''',
                              ).toString())
                                  ? FlutterFlowTheme.of(context).error
                                  : FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              width: 2.0,
                            ),
                          ),
                          child: Icon(
                            Icons.home_max,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        ),
                      );
                    } else {
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (((FFAppState().role == 'Engineer') ||
                                  (FFAppState().role == 'Super Admin') ||
                                  (FFAppState().role == 'ATMO')) &&
                              ((String var1) {
                                return var1 == "0" ? true : false;
                              }(getJsonField(
                                widget!.relayData,
                                r'''$.CS''',
                              ).toString()))) {
                            await actions.publishMqtt(
                              context,
                              'Setting/${widget!.macID}',
                              '{ \"${getJsonField(
                                widget!.relayData,
                                r'''$.RelayTag''',
                              ).toString()}MC\" : \"1\", \"SIOT\": \"GMR\"}',
                              FFAppState().deviceId,
                              '15.206.230.32',
                              'mqtt_buildint_\$\$2023',
                            );
                            _model.relayState = '1';
                            safeSetState(() {});
                            return;
                          } else {
                            return;
                          }
                        },
                        child: Container(
                          width: 45.0,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFA9AAAC),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 2.0,
                            ),
                          ),
                          child: Icon(
                            Icons.home_max,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        ),
                      );
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(13.0, 8.0, 13.0, 8.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 2.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF8B8C8E),
                    ),
                  ),
                ),
                Text(
                  valueOrDefault<String>(
                    getJsonField(
                      widget!.relayData,
                      r'''$.Label''',
                    )?.toString(),
                    'Lable',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.readexPro(
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: Color(0xFF929395),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
                if (getJsonField(
                          widget!.relayData,
                          r'''$.PDCT''',
                        ) !=
                        null
                    ? ((String var1, String var2, String var3) {
                        return (var1 == 'Engineer' ||
                                var1 == 'Super Admin' ||
                                var1 == 'ATMO')
                            ? ((var3 == 'A1' || var3 == 'A2')
                                ? (var2 == '0' ? true : false)
                                : true)
                            : false;
                      }(
                        FFAppState().role,
                        getJsonField(
                          widget!.relayData,
                          r'''$.PDCT''',
                        ).toString(),
                        getJsonField(
                          widget!.relayData,
                          r'''$.RelayTag''',
                        ).toString()))
                    : false)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          (String var1) {
                            return var1 == "1" ? "Auto" : "Manual";
                          }(getJsonField(
                            widget!.relayData,
                            r'''$.CS''',
                          ).toString()),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF929395),
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        Transform.scale(
                          scaleX: 0.7,
                          scaleY: 0.7,
                          child: Switch.adaptive(
                            value: _model.switchValue1!,
                            onChanged: (newValue) async {
                              safeSetState(
                                  () => _model.switchValue1 = newValue!);
                              if (newValue!) {
                                if ((FFAppState().role == 'Engineer') ||
                                    (FFAppState().role == 'Super Admin') ||
                                    (FFAppState().role == 'ATMO')) {
                                  await actions.publishMqtt(
                                    context,
                                    'Setting/${widget!.macID}',
                                    '{ \"${getJsonField(
                                      widget!.relayData,
                                      r'''$.RelayTag''',
                                    ).toString()}CS\" : \"1\", \"SIOT\": \"GMR\"}',
                                    FFAppState().deviceId,
                                    '15.206.230.32',
                                    'mqtt_buildint_\$\$2023',
                                  );
                                  return;
                                } else {
                                  return;
                                }
                              } else {
                                if ((FFAppState().role == 'Engineer') ||
                                    (FFAppState().role == 'Super Admin') ||
                                    (FFAppState().role == 'ATMO')) {
                                  await actions.publishMqtt(
                                    context,
                                    'Setting/${widget!.macID}',
                                    '{ \"${getJsonField(
                                      widget!.relayData,
                                      r'''$.RelayTag''',
                                    ).toString()}CS\" : \"0\", \"SIOT\": \"GMR\"}',
                                    FFAppState().deviceId,
                                    '15.206.230.32',
                                    'mqtt_buildint_\$\$2023',
                                  );
                                  return;
                                } else {
                                  return;
                                }
                              }
                            },
                            activeColor: FlutterFlowTheme.of(context).primary,
                            activeTrackColor:
                                FlutterFlowTheme.of(context).accent1,
                            inactiveTrackColor:
                                FlutterFlowTheme.of(context).alternate,
                            inactiveThumbColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        ),
                      ],
                    ),
                  ),
                if ((String var1, String var2, String var3) {
                  return (var1 == 'Engineer' ||
                          var1 == 'Super Admin' ||
                          var1 == 'ATMO')
                      ? ((var3 == 'A1' || var3 == 'A2')
                          ? (var2 == '1' ? true : false)
                          : false)
                      : false;
                }(
                    FFAppState().role,
                    getJsonField(
                      widget!.relayData,
                      r'''$.PDCT''',
                    ).toString(),
                    getJsonField(
                      widget!.relayData,
                      r'''$.RelayTag''',
                    ).toString()))
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Periodicity',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF929395),
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        Transform.scale(
                          scaleX: 0.7,
                          scaleY: 0.7,
                          child: Switch.adaptive(
                            value: _model.switchValue2!,
                            onChanged: (newValue) async {
                              safeSetState(
                                  () => _model.switchValue2 = newValue!);
                              if (newValue!) {
                                if ((FFAppState().role == 'Engineer') ||
                                    (FFAppState().role == 'Super Admin') ||
                                    (FFAppState().role == 'ATMO')) {
                                  await actions.publishMqtt(
                                    context,
                                    'Setting/${widget!.macID}',
                                    '{ \"A1CS\" : \"1\", \"A2CS\" : \"1\", \"SIOT\": \"GMR\", \"PPDCT\": \"1\",\"PCS\":\"1\"}',
                                    FFAppState().deviceId,
                                    '15.206.230.32',
                                    'mqtt_buildint_\$\$2023',
                                  );
                                  return;
                                } else {
                                  return;
                                }
                              } else {
                                if ((FFAppState().role == 'Engineer') ||
                                    (FFAppState().role == 'Super Admin') ||
                                    (FFAppState().role == 'ATMO')) {
                                  await actions.publishMqtt(
                                    context,
                                    'Setting/${widget!.macID}',
                                    '{ \"A1CS\" : \"0\", \"A2CS\" : \"0\", \"SIOT\": \"GMR\", \"PPDCT\": \"0\",\"PCS\":\"0\"}',
                                    FFAppState().deviceId,
                                    '15.206.230.32',
                                    'mqtt_buildint_\$\$2023',
                                  );
                                  return;
                                } else {
                                  return;
                                }
                              }
                            },
                            activeColor: FlutterFlowTheme.of(context).primary,
                            activeTrackColor:
                                FlutterFlowTheme.of(context).accent1,
                            inactiveTrackColor:
                                FlutterFlowTheme.of(context).alternate,
                            inactiveThumbColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
