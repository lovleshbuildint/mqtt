import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'device_details_p_l_c_model.dart';
export 'device_details_p_l_c_model.dart';

class DeviceDetailsPLCWidget extends StatefulWidget {
  const DeviceDetailsPLCWidget({
    super.key,
    required this.did,
    required this.onlineOfflineStatus,
  });

  final String? did;
  final String? onlineOfflineStatus;

  @override
  State<DeviceDetailsPLCWidget> createState() => _DeviceDetailsPLCWidgetState();
}

class _DeviceDetailsPLCWidgetState extends State<DeviceDetailsPLCWidget> {
  late DeviceDetailsPLCModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeviceDetailsPLCModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.userInfoUpdate(context);
      setState(() {});
      unawaited(
        () async {
          await actions.subscribeMqtt(
            context,
            'Response',
            FFAppState().deviceId,
            widget.did,
            '15.206.230.32',
            'mqtt_buildint_\$\$2023',
          );
        }(),
      );
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 5000),
        callback: (timer) async {
          unawaited(
            () async {
              await actions.publishMqtt(
                context,
                'Settings',
                '${widget.did}\$GREL,',
                FFAppState().deviceId,
                '15.206.230.32',
                'mqtt_buildint_\$\$2023',
              );
            }(),
          );
          if (FFAppState().relayStatusiATM != null &&
              FFAppState().relayStatusiATM != '') {
            setState(() {
              _model.autoValue = ((String var1) {
                return var1.split(',')[0][4] == '1' ? true : false;
              }(FFAppState().relayStatusiATM));
            });
          }
        },
        startImmediately: true,
      );
    });

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
                padding: EdgeInsetsDirectional.fromSTEB(13.0, 20.0, 13.0, 0.0),
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
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(13.0, 10.0, 13.0, 0.0),
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
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 2.0, 7.0, 0.0),
                                  child: Container(
                                    width: 10.0,
                                    height: 10.0,
                                    decoration: BoxDecoration(
                                      color: FFAppState().relayStatusiATM !=
                                                  null &&
                                              FFAppState().relayStatusiATM != ''
                                          ? Color(0xFF07D95A)
                                          : FlutterFlowTheme.of(context).error,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Text(
                                  FFAppState().relayStatusiATM != null &&
                                          FFAppState().relayStatusiATM != ''
                                      ? 'Online'
                                      : 'Offine',
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
                                        return var1.split('.')[0];
                                      }(FFAppState().mqttTime))
                                    : '-',
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(13.0, 20.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (FFAppState().relayStatusiATM != null &&
                        FFAppState().relayStatusiATM != '')
                      Switch(
                        value: _model.autoValue ??= (String var1) {
                          return var1.split(',')[0][4] == '1' ? true : false;
                        }(FFAppState().relayStatusiATM),
                        onChanged: (newValue) async {
                          setState(() => _model.autoValue = newValue!);
                          if (newValue!) {
                            if ((FFAppState().role == 'Engineer') ||
                                (FFAppState().role == 'Super Admin')) {
                              await actions.publishMqtt(
                                context,
                                'Settings',
                                '${widget.did}\$SREL${(String var1) {
                                  return var1.split(',')[0][0] +
                                      var1.split(',')[0][1] +
                                      var1.split(',')[0][2] +
                                      var1.split(',')[0][3] +
                                      '1';
                                }(FFAppState().relayStatusiATM)},',
                                FFAppState().deviceId,
                                '15.206.230.32',
                                'mqtt_buildint_\$\$2023',
                              );
                            }
                          } else {
                            if ((FFAppState().role == 'Engineer') ||
                                (FFAppState().role == 'Super Admin')) {
                              await actions.publishMqtt(
                                context,
                                'Settings',
                                '${widget.did}\$SREL${(String var1) {
                                  return var1.split(',')[0][0] +
                                      var1.split(',')[0][1] +
                                      var1.split(',')[0][2] +
                                      var1.split(',')[0][3] +
                                      '0';
                                }(FFAppState().relayStatusiATM)},',
                                FFAppState().deviceId,
                                '15.206.230.32',
                                'mqtt_buildint_\$\$2023',
                              );
                            }
                          }
                        },
                        activeColor: FlutterFlowTheme.of(context).primary,
                        activeTrackColor: FlutterFlowTheme.of(context).accent1,
                        inactiveTrackColor:
                            FlutterFlowTheme.of(context).alternate,
                        inactiveThumbColor:
                            FlutterFlowTheme.of(context).secondaryText,
                      ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${FFAppState().relayStatusiATM != null && FFAppState().relayStatusiATM != '' ? ((String var1) {
                                      return var1.split(',')[1];
                                    }(FFAppState().relayStatusiATM)) : '0'} C',
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
                                    color: (String var1) {
                                      return double.parse(var1) < 24.0 &&
                                              double.parse(var1) != 0.00
                                          ? true
                                          : false;
                                    }((FFAppState().relayStatusiATM != null &&
                                                FFAppState().relayStatusiATM !=
                                                    ''
                                            ? ((String var1) {
                                                return var1.split(',')[1];
                                              }(FFAppState().relayStatusiATM))
                                            : '0'))
                                        ? Color(0x8007D95A)
                                        : Color(0x80FF5963),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Icon(
                                    Icons.ac_unit,
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
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              13.0, 20.0, 13.0, 20.0),
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
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEFF1),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          if ((String var1) {
                                            return (var1 != null && var1 != '')
                                                ? (var1.split(',')[0][0] == '1'
                                                    ? true
                                                    : false)
                                                : false;
                                          }(FFAppState().relayStatusiATM)) {
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (((FFAppState().role ==
                                                            'Engineer') ||
                                                        (FFAppState().role ==
                                                            'Super Admin')) &&
                                                    (FFAppState()
                                                                .relayStatusiATM !=
                                                            null &&
                                                        FFAppState()
                                                                .relayStatusiATM !=
                                                            '') &&
                                                    (_model.autoValue ==
                                                        false)) {
                                                  unawaited(
                                                    () async {
                                                      await actions.publishMqtt(
                                                        context,
                                                        'Settings',
                                                        '${widget.did}\$SREL${(String var1) {
                                                          return '0' +
                                                              var1.split(',')[0]
                                                                  [1] +
                                                              var1.split(',')[0]
                                                                  [2] +
                                                              var1.split(',')[0]
                                                                  [3] +
                                                              '0';
                                                        }(FFAppState().relayStatusiATM)},',
                                                        FFAppState().deviceId,
                                                        '15.206.230.32',
                                                        'mqtt_buildint_\$\$2023',
                                                      );
                                                    }(),
                                                  );
                                                  setState(() {
                                                    FFAppState()
                                                            .relayStatusiATM =
                                                        (String var1) {
                                                      return '0' +
                                                          var1.split(',')[0]
                                                              [1] +
                                                          var1.split(',')[0]
                                                              [2] +
                                                          var1.split(',')[0]
                                                              [3] +
                                                          '0,' +
                                                          var1.split(',')[1];
                                                    }(FFAppState()
                                                            .relayStatusiATM);
                                                  });
                                                }
                                              },
                                              child: Container(
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
                                                    begin: AlignmentDirectional(
                                                        0.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        0, 1.0),
                                                  ),
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Icon(
                                                  Icons.home_max,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                            );
                                          } else {
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (((FFAppState().role ==
                                                            'Engineer') ||
                                                        (FFAppState().role ==
                                                            'Super Admin')) &&
                                                    (FFAppState()
                                                                .relayStatusiATM !=
                                                            null &&
                                                        FFAppState()
                                                                .relayStatusiATM !=
                                                            '') &&
                                                    (_model.autoValue ==
                                                        false)) {
                                                  await actions.publishMqtt(
                                                    context,
                                                    'Settings',
                                                    '${widget.did}\$SREL${(String var1) {
                                                      return '1' +
                                                          var1.split(',')[0]
                                                              [1] +
                                                          var1.split(',')[0]
                                                              [2] +
                                                          var1.split(',')[0]
                                                              [3] +
                                                          '0';
                                                    }(FFAppState().relayStatusiATM)},',
                                                    FFAppState().deviceId,
                                                    '15.206.230.32',
                                                    'mqtt_buildint_\$\$2023',
                                                  );
                                                  setState(() {
                                                    FFAppState()
                                                            .relayStatusiATM =
                                                        (String var1) {
                                                      return '1' +
                                                          var1.split(',')[0]
                                                              [1] +
                                                          var1.split(',')[0]
                                                              [2] +
                                                          var1.split(',')[0]
                                                              [3] +
                                                          '0,' +
                                                          var1.split(',')[1];
                                                    }(FFAppState()
                                                            .relayStatusiATM);
                                                  });
                                                }
                                              },
                                              child: Container(
                                                width: 45.0,
                                                height: 45.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFA9AAAC),
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Icon(
                                                  Icons.home_max,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            13.0, 8.0, 13.0, 8.0),
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
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
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
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          if ((String var1) {
                                            return (var1 != null && var1 != '')
                                                ? (var1.split(',')[0][1] == '1'
                                                    ? true
                                                    : false)
                                                : false;
                                          }(FFAppState().relayStatusiATM)) {
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (((FFAppState().role ==
                                                            'Engineer') ||
                                                        (FFAppState().role ==
                                                            'Super Admin')) &&
                                                    (FFAppState()
                                                                .relayStatusiATM !=
                                                            null &&
                                                        FFAppState()
                                                                .relayStatusiATM !=
                                                            '') &&
                                                    (_model.autoValue ==
                                                        false)) {
                                                  await actions.publishMqtt(
                                                    context,
                                                    'Settings',
                                                    '${widget.did}\$SREL${(String var1) {
                                                      return var1.split(',')[0]
                                                              [0] +
                                                          '0' +
                                                          var1.split(',')[0]
                                                              [2] +
                                                          var1.split(',')[0]
                                                              [3] +
                                                          '0';
                                                    }(FFAppState().relayStatusiATM)},',
                                                    FFAppState().deviceId,
                                                    '15.206.230.32',
                                                    'mqtt_buildint_\$\$2023',
                                                  );
                                                  setState(() {
                                                    FFAppState()
                                                            .relayStatusiATM =
                                                        (String var1) {
                                                      return var1.split(',')[0]
                                                              [0] +
                                                          '0' +
                                                          var1.split(',')[0]
                                                              [2] +
                                                          var1.split(',')[0]
                                                              [3] +
                                                          '0,' +
                                                          var1.split(',')[1];
                                                    }(FFAppState()
                                                            .relayStatusiATM);
                                                  });
                                                }
                                              },
                                              child: Container(
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
                                                    begin: AlignmentDirectional(
                                                        0.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        0, 1.0),
                                                  ),
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Icon(
                                                  Icons.home_max,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                            );
                                          } else {
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (((FFAppState().role ==
                                                            'Engineer') ||
                                                        (FFAppState().role ==
                                                            'Super Admin')) &&
                                                    (FFAppState()
                                                                .relayStatusiATM !=
                                                            null &&
                                                        FFAppState()
                                                                .relayStatusiATM !=
                                                            '') &&
                                                    (_model.autoValue ==
                                                        false)) {
                                                  await actions.publishMqtt(
                                                    context,
                                                    'Settings',
                                                    '${widget.did}\$SREL${(String var1) {
                                                      return var1.split(',')[0]
                                                              [0] +
                                                          '1' +
                                                          var1.split(',')[0]
                                                              [2] +
                                                          var1.split(',')[0]
                                                              [3] +
                                                          '0';
                                                    }(FFAppState().relayStatusiATM)},',
                                                    FFAppState().deviceId,
                                                    '15.206.230.32',
                                                    'mqtt_buildint_\$\$2023',
                                                  );
                                                  setState(() {
                                                    FFAppState()
                                                            .relayStatusiATM =
                                                        (String var1) {
                                                      return var1.split(',')[0]
                                                              [0] +
                                                          '1' +
                                                          var1.split(',')[0]
                                                              [2] +
                                                          var1.split(',')[0]
                                                              [3] +
                                                          '0,' +
                                                          var1.split(',')[1];
                                                    }(FFAppState()
                                                            .relayStatusiATM);
                                                  });
                                                }
                                              },
                                              child: Container(
                                                width: 45.0,
                                                height: 45.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFA9AAAC),
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Icon(
                                                  Icons.home_max,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            13.0, 8.0, 13.0, 8.0),
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
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
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
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          if ((String var1) {
                                            return (var1 != null && var1 != '')
                                                ? (var1.split(',')[0][2] == '1'
                                                    ? true
                                                    : false)
                                                : false;
                                          }(FFAppState().relayStatusiATM)) {
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (((FFAppState().role ==
                                                            'Engineer') ||
                                                        (FFAppState().role ==
                                                            'Super Admin')) &&
                                                    (FFAppState()
                                                                .relayStatusiATM !=
                                                            null &&
                                                        FFAppState()
                                                                .relayStatusiATM !=
                                                            '') &&
                                                    (_model.autoValue ==
                                                        false)) {
                                                  await actions.publishMqtt(
                                                    context,
                                                    'Settings',
                                                    '${widget.did}\$SREL${(String var1) {
                                                      return var1.split(',')[0]
                                                              [0] +
                                                          var1.split(',')[0]
                                                              [1] +
                                                          '0' +
                                                          var1.split(',')[0]
                                                              [3] +
                                                          '0';
                                                    }(FFAppState().relayStatusiATM)},',
                                                    FFAppState().deviceId,
                                                    '15.206.230.32',
                                                    'mqtt_buildint_\$\$2023',
                                                  );
                                                  setState(() {
                                                    FFAppState()
                                                            .relayStatusiATM =
                                                        (String var1) {
                                                      return var1.split(',')[0]
                                                              [0] +
                                                          var1.split(',')[0]
                                                              [1] +
                                                          '0' +
                                                          var1.split(',')[0]
                                                              [3] +
                                                          '0,' +
                                                          var1.split(',')[1];
                                                    }(FFAppState()
                                                            .relayStatusiATM);
                                                  });
                                                }
                                              },
                                              child: Container(
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
                                                    begin: AlignmentDirectional(
                                                        0.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        0, 1.0),
                                                  ),
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Icon(
                                                  Icons.light_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                            );
                                          } else {
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (((FFAppState().role ==
                                                            'Engineer') ||
                                                        (FFAppState().role ==
                                                            'Super Admin')) &&
                                                    (FFAppState()
                                                                .relayStatusiATM !=
                                                            null &&
                                                        FFAppState()
                                                                .relayStatusiATM !=
                                                            '') &&
                                                    (_model.autoValue ==
                                                        false)) {
                                                  await actions.publishMqtt(
                                                    context,
                                                    'Settings',
                                                    '${widget.did}\$SREL${(String var1) {
                                                      return var1.split(',')[0]
                                                              [0] +
                                                          var1.split(',')[0]
                                                              [1] +
                                                          '1' +
                                                          var1.split(',')[0]
                                                              [3] +
                                                          '0';
                                                    }(FFAppState().relayStatusiATM)},',
                                                    FFAppState().deviceId,
                                                    '15.206.230.32',
                                                    'mqtt_buildint_\$\$2023',
                                                  );
                                                  setState(() {
                                                    FFAppState()
                                                            .relayStatusiATM =
                                                        (String var1) {
                                                      return var1.split(',')[0]
                                                              [0] +
                                                          var1.split(',')[0]
                                                              [1] +
                                                          '1' +
                                                          var1.split(',')[0]
                                                              [3] +
                                                          '0,' +
                                                          var1.split(',')[1];
                                                    }(FFAppState()
                                                            .relayStatusiATM);
                                                  });
                                                }
                                              },
                                              child: Container(
                                                width: 45.0,
                                                height: 45.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFA9AAAC),
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Icon(
                                                  Icons.light_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            13.0, 8.0, 13.0, 8.0),
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
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
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
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          if ((String var1) {
                                            return (var1 != null && var1 != '')
                                                ? (var1.split(',')[0][3] == '1'
                                                    ? true
                                                    : false)
                                                : false;
                                          }(FFAppState().relayStatusiATM)) {
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (((FFAppState().role ==
                                                            'Engineer') ||
                                                        (FFAppState().role ==
                                                            'Super Admin')) &&
                                                    (FFAppState()
                                                                .relayStatusiATM !=
                                                            null &&
                                                        FFAppState()
                                                                .relayStatusiATM !=
                                                            '') &&
                                                    (_model.autoValue ==
                                                        false)) {
                                                  await actions.publishMqtt(
                                                    context,
                                                    'Settings',
                                                    '${widget.did}\$SREL${(String var1) {
                                                      return var1.split(',')[0]
                                                              [0] +
                                                          var1.split(',')[0]
                                                              [1] +
                                                          var1.split(',')[0]
                                                              [2] +
                                                          '0' +
                                                          '0';
                                                    }(FFAppState().relayStatusiATM)},',
                                                    FFAppState().deviceId,
                                                    '15.206.230.32',
                                                    'mqtt_buildint_\$\$2023',
                                                  );
                                                  setState(() {
                                                    FFAppState()
                                                            .relayStatusiATM =
                                                        (String var1) {
                                                      return var1.split(',')[0]
                                                              [0] +
                                                          var1.split(',')[0]
                                                              [1] +
                                                          var1.split(',')[0]
                                                              [2] +
                                                          '0' +
                                                          '0,' +
                                                          var1.split(',')[1];
                                                    }(FFAppState()
                                                            .relayStatusiATM);
                                                  });
                                                }
                                              },
                                              child: Container(
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
                                                    begin: AlignmentDirectional(
                                                        0.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        0, 1.0),
                                                  ),
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Icon(
                                                  Icons.lightbulb_outline,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                            );
                                          } else {
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (((FFAppState().role ==
                                                            'Engineer') ||
                                                        (FFAppState().role ==
                                                            'Super Admin')) &&
                                                    (FFAppState()
                                                                .relayStatusiATM !=
                                                            null &&
                                                        FFAppState()
                                                                .relayStatusiATM !=
                                                            '') &&
                                                    (_model.autoValue ==
                                                        false)) {
                                                  await actions.publishMqtt(
                                                    context,
                                                    'Settings',
                                                    '${widget.did}\$SREL${(String var1) {
                                                      return var1.split(',')[0]
                                                              [0] +
                                                          var1.split(',')[0]
                                                              [1] +
                                                          var1.split(',')[0]
                                                              [2] +
                                                          '1' +
                                                          '0';
                                                    }(FFAppState().relayStatusiATM)},',
                                                    FFAppState().deviceId,
                                                    '15.206.230.32',
                                                    'mqtt_buildint_\$\$2023',
                                                  );
                                                  setState(() {
                                                    FFAppState()
                                                            .relayStatusiATM =
                                                        (String var1) {
                                                      return var1.split(',')[0]
                                                              [0] +
                                                          var1.split(',')[0]
                                                              [1] +
                                                          var1.split(',')[0]
                                                              [2] +
                                                          '1' +
                                                          '0,' +
                                                          var1.split(',')[1];
                                                    }(FFAppState()
                                                            .relayStatusiATM);
                                                  });
                                                }
                                              },
                                              child: Container(
                                                width: 45.0,
                                                height: 45.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFA9AAAC),
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Icon(
                                                  Icons.lightbulb_outline,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            13.0, 8.0, 13.0, 8.0),
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
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
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
            ],
          ),
        ),
      ),
    );
  }
}
