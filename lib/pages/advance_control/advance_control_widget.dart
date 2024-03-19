import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'advance_control_model.dart';
export 'advance_control_model.dart';

class AdvanceControlWidget extends StatefulWidget {
  const AdvanceControlWidget({
    super.key,
    required this.onlineOfflineStatus,
    required this.deviceStatus,
    required this.did,
  });

  final String? onlineOfflineStatus;
  final dynamic deviceStatus;
  final String? did;

  @override
  State<AdvanceControlWidget> createState() => _AdvanceControlWidgetState();
}

class _AdvanceControlWidgetState extends State<AdvanceControlWidget> {
  late AdvanceControlModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdvanceControlModel());

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
                            'Advance Controlling',
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
                                      color: widget.onlineOfflineStatus ==
                                              'Online'
                                          ? Color(0xFF07D95A)
                                          : FlutterFlowTheme.of(context).error,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    widget.onlineOfflineStatus,
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
                                FFAppState().mqttTime != null &&
                                        FFAppState().mqttTime != ''
                                    ? ((String var1) {
                                        return var1.split('.')[0];
                                      }(FFAppState().mqttTime))
                                    : '${(String var1) {
                                        return var1.split('T').first;
                                      }(getJsonField(
                                        widget.deviceStatus,
                                        r'''$.deviceStatus.evt_dt''',
                                      ).toString())} ${(String var1) {
                                        return var1.split('.').first;
                                      }(((String var1) {
                                        return var1.split('T').last;
                                      }(getJsonField(
                                        widget.deviceStatus,
                                        r'''$.deviceStatus.evt_dt''',
                                      ).toString())))}',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 15.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                height: 35.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(6.0),
                                  border: Border.all(
                                    color: Color(0x35404042),
                                    width: 1.0,
                                  ),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 2.0, 10.0, 0.0),
                                  child: AutoSizeText(
                                    'AC Selection',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF4D4D4D),
                                        ),
                                    minFontSize: 9.0,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 0.0, 0.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController ??=
                                            FormFieldController<String>(
                                      _model.dropDownValue ??= 'AC 1 & AC 2',
                                    ),
                                    options: [
                                      'AC 1 & AC 2',
                                      'AC 1 Only',
                                      'AC 2 Only'
                                    ],
                                    onChanged: (val) => setState(
                                        () => _model.dropDownValue = val),
                                    width: 300.0,
                                    height: 35.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF4D4D4D),
                                        ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor: Color(0x35404042),
                                    borderWidth: 1.0,
                                    borderRadius: 6.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    hidesUnderline: true,
                                    isOverButton: false,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 15.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 35.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(6.0),
                                  border: Border.all(
                                    color: Color(0x35404042),
                                    width: 1.0,
                                  ),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 2.0, 10.0, 0.0),
                                  child: AutoSizeText(
                                    'Day Time',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF4D4D4D),
                                        ),
                                    minFontSize: 9.0,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showModalBottomSheet<bool>(
                                          context: context,
                                          builder: (context) {
                                            final _datePickedCupertinoTheme =
                                                CupertinoTheme.of(context);
                                            return ScrollConfiguration(
                                              behavior:
                                                  const MaterialScrollBehavior()
                                                      .copyWith(
                                                dragDevices: {
                                                  PointerDeviceKind.mouse,
                                                  PointerDeviceKind.touch,
                                                  PointerDeviceKind.stylus,
                                                  PointerDeviceKind.unknown
                                                },
                                              ),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    3,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                child: CupertinoTheme(
                                                  data:
                                                      _datePickedCupertinoTheme
                                                          .copyWith(
                                                    textTheme:
                                                        _datePickedCupertinoTheme
                                                            .textTheme
                                                            .copyWith(
                                                      dateTimePickerTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                    ),
                                                  ),
                                                  child: CupertinoDatePicker(
                                                    mode:
                                                        CupertinoDatePickerMode
                                                            .time,
                                                    minimumDate: DateTime(1900),
                                                    initialDateTime: DateTime
                                                        .fromMicrosecondsSinceEpoch(
                                                            1710822600000000),
                                                    maximumDate: DateTime(2050),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    use24hFormat: false,
                                                    onDateTimeChanged:
                                                        (newDateTime) =>
                                                            safeSetState(() {
                                                      _model.datePicked =
                                                          newDateTime;
                                                    }),
                                                  ),
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    child: Container(
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        border: Border.all(
                                          color: Color(0x35404042),
                                          width: 1.0,
                                        ),
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 2.0, 10.0, 0.0),
                                        child: AutoSizeText(
                                          valueOrDefault<String>(
                                            _model.datePicked?.toString(),
                                            'Time',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF4D4D4D),
                                              ),
                                          minFontSize: 9.0,
                                        ),
                                      ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
