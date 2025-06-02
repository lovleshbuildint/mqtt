import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'firmware_management_model.dart';
export 'firmware_management_model.dart';

class FirmwareManagementWidget extends StatefulWidget {
  const FirmwareManagementWidget({super.key});

  static String routeName = 'FirmwareManagement';
  static String routePath = '/firmwareManagement';

  @override
  State<FirmwareManagementWidget> createState() =>
      _FirmwareManagementWidgetState();
}

class _FirmwareManagementWidgetState extends State<FirmwareManagementWidget> {
  late FirmwareManagementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FirmwareManagementModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.userInfoUpdate(context);
      safeSetState(() {});
    });

    _model.switchValue = false;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'FirmwareManagement',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
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
                                  'Firmware Management',
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
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 150.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FlutterFlowDropDown<String>(
                                      controller: _model
                                              .selectDeviceDDValueController ??=
                                          FormFieldController<String>(null),
                                      options: ['iATM-BS', 'iATM-BV'],
                                      onChanged: (val) async {
                                        safeSetState(() =>
                                            _model.selectDeviceDDValue = val);
                                        var _shouldSetState = false;
                                        if (_model.selectDeviceDDValue ==
                                            'iATM-BV') {
                                          if (_model.switchValue == true) {
                                            _model.getVersionBVResponse =
                                                await GetVersionBVCall.call();

                                            _shouldSetState = true;
                                            if ((_model.getVersionBVResponse
                                                    ?.succeeded ??
                                                true)) {
                                              _model.currentVersion = (_model
                                                      .getVersionBVResponse
                                                      ?.bodyText ??
                                                  '');
                                              safeSetState(() {});
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Alert'),
                                                    content: Text((_model
                                                            .getVersionBVResponse
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
                                          } else {
                                            _model.getVersionBVTestmodeResponse =
                                                await GetVersionBVtestmodeCall
                                                    .call();

                                            _shouldSetState = true;
                                            if ((_model
                                                    .getVersionBVTestmodeResponse
                                                    ?.succeeded ??
                                                true)) {
                                              _model.currentVersion = (_model
                                                      .getVersionBVTestmodeResponse
                                                      ?.bodyText ??
                                                  '');
                                              safeSetState(() {});
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Alert'),
                                                    content: Text((_model
                                                            .getVersionBVTestmodeResponse
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
                                          }
                                        } else if (_model.selectDeviceDDValue ==
                                            'iATM-BS') {
                                          if (_model.switchValue == true) {
                                            _model.getVersionBSResponse =
                                                await GetVersionBSCall.call();

                                            _shouldSetState = true;
                                            if ((_model.getVersionBSResponse
                                                    ?.succeeded ??
                                                true)) {
                                              _model.currentVersion = (_model
                                                      .getVersionBSResponse
                                                      ?.bodyText ??
                                                  '');
                                              safeSetState(() {});
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Alert'),
                                                    content: Text((_model
                                                            .getVersionBSResponse
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
                                          } else {
                                            _model.getVersionBSTestmodeResponse =
                                                await GetVersionBStestmodeCall
                                                    .call();

                                            _shouldSetState = true;
                                            if ((_model
                                                    .getVersionBSTestmodeResponse
                                                    ?.succeeded ??
                                                true)) {
                                              _model.currentVersion = (_model
                                                      .getVersionBSTestmodeResponse
                                                      ?.bodyText ??
                                                  '');
                                              safeSetState(() {});
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Alert'),
                                                    content: Text((_model
                                                            .getVersionBSTestmodeResponse
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
                                          }
                                        } else {
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                      },
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
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
                                      hintText: 'Select device...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: Color(0xFF14181B),
                                      borderWidth: 1.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Text(
                                          'Current Version: ${_model.currentVersion != null && _model.currentVersion != '' ? _model.currentVersion : '-'}',
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
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              final selectedFiles =
                                                  await selectFiles(
                                                multiFile: false,
                                              );
                                              if (selectedFiles != null) {
                                                safeSetState(() => _model
                                                        .isDataUploading_uploadDataS92 =
                                                    true);
                                                var selectedUploadedFiles =
                                                    <FFUploadedFile>[];

                                                try {
                                                  selectedUploadedFiles =
                                                      selectedFiles
                                                          .map((m) =>
                                                              FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                              ))
                                                          .toList();
                                                } finally {
                                                  _model.isDataUploading_uploadDataS92 =
                                                      false;
                                                }
                                                if (selectedUploadedFiles
                                                        .length ==
                                                    selectedFiles.length) {
                                                  safeSetState(() {
                                                    _model.uploadedLocalFile_uploadDataS92 =
                                                        selectedUploadedFiles
                                                            .first;
                                                  });
                                                } else {
                                                  safeSetState(() {});
                                                  return;
                                                }
                                              }
                                            },
                                            text: _model.uploadedLocalFile_uploadDataS92 !=
                                                        null &&
                                                    (_model.uploadedLocalFile_uploadDataS92
                                                            .bytes?.isNotEmpty ??
                                                        false)
                                                ? 'Firmware Selected'
                                                : 'Select Firmware',
                                            icon: Icon(
                                              Icons.upload_file,
                                              size: 15.0,
                                            ),
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font: GoogleFonts.readexPro(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          if (_model.uploadedLocalFile_uploadDataS92 !=
                                                  null &&
                                              (_model.uploadedLocalFile_uploadDataS92
                                                      .bytes?.isNotEmpty ??
                                                  false))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderRadius: 8.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                icon: Icon(
                                                  Icons.close_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  safeSetState(() {
                                                    _model.isDataUploading_uploadDataS92 =
                                                        false;
                                                    _model.uploadedLocalFile_uploadDataS92 =
                                                        FFUploadedFile(
                                                            bytes: Uint8List
                                                                .fromList([]));
                                                  });
                                                },
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Test\nEnvironment',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                            Switch.adaptive(
                                              value: _model.switchValue!,
                                              onChanged: (newValue) async {
                                                safeSetState(() => _model
                                                    .switchValue = newValue!);
                                                if (newValue!) {
                                                  var _shouldSetState = false;
                                                  if (_model
                                                          .selectDeviceDDValue ==
                                                      'iATM-BV') {
                                                    if (_model.switchValue ==
                                                        true) {
                                                      _model.getVersionBVResponse1 =
                                                          await GetVersionBVCall
                                                              .call();

                                                      _shouldSetState = true;
                                                      if ((_model
                                                              .getVersionBVResponse
                                                              ?.succeeded ??
                                                          true)) {
                                                        _model.currentVersion =
                                                            (_model.getVersionBVResponse1
                                                                    ?.bodyText ??
                                                                '');
                                                        safeSetState(() {});
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title:
                                                                  Text('Alert'),
                                                              content: Text((_model
                                                                      .getVersionBVResponse1
                                                                      ?.bodyText ??
                                                                  '')),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }
                                                    } else {
                                                      _model.getVersionBVTestmodeResponse1 =
                                                          await GetVersionBVtestmodeCall
                                                              .call();

                                                      _shouldSetState = true;
                                                      if ((_model
                                                              .getVersionBVTestmodeResponse1
                                                              ?.succeeded ??
                                                          true)) {
                                                        _model.currentVersion =
                                                            (_model.getVersionBVTestmodeResponse1
                                                                    ?.bodyText ??
                                                                '');
                                                        safeSetState(() {});
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title:
                                                                  Text('Alert'),
                                                              content: Text((_model
                                                                      .getVersionBVTestmodeResponse1
                                                                      ?.bodyText ??
                                                                  '')),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }
                                                    }
                                                  } else if (_model
                                                          .selectDeviceDDValue ==
                                                      'iATM-BS') {
                                                    if (_model.switchValue ==
                                                        true) {
                                                      _model.getVersionBSResponse1 =
                                                          await GetVersionBSCall
                                                              .call();

                                                      _shouldSetState = true;
                                                      if ((_model
                                                              .getVersionBSResponse1
                                                              ?.succeeded ??
                                                          true)) {
                                                        _model.currentVersion =
                                                            (_model.getVersionBSResponse1
                                                                    ?.bodyText ??
                                                                '');
                                                        safeSetState(() {});
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title:
                                                                  Text('Alert'),
                                                              content: Text((_model
                                                                      .getVersionBSResponse1
                                                                      ?.bodyText ??
                                                                  '')),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }
                                                    } else {
                                                      _model.getVersionBSTestmodeResponse1 =
                                                          await GetVersionBStestmodeCall
                                                              .call();

                                                      _shouldSetState = true;
                                                      if ((_model
                                                              .getVersionBSTestmodeResponse1
                                                              ?.succeeded ??
                                                          true)) {
                                                        _model.currentVersion =
                                                            (_model.getVersionBSTestmodeResponse1
                                                                    ?.bodyText ??
                                                                '');
                                                        safeSetState(() {});
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title:
                                                                  Text('Alert'),
                                                              content: Text((_model
                                                                      .getVersionBSTestmodeResponse1
                                                                      ?.bodyText ??
                                                                  '')),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }
                                                    }
                                                  } else {
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                } else {
                                                  var _shouldSetState = false;
                                                  if (_model
                                                          .selectDeviceDDValue ==
                                                      'iATM-BV') {
                                                    if (_model.switchValue ==
                                                        true) {
                                                      _model.getVersionBVResponse1Copy =
                                                          await GetVersionBVCall
                                                              .call();

                                                      _shouldSetState = true;
                                                      if ((_model
                                                              .getVersionBVResponse
                                                              ?.succeeded ??
                                                          true)) {
                                                        _model.currentVersion =
                                                            (_model.getVersionBVResponse1Copy
                                                                    ?.bodyText ??
                                                                '');
                                                        safeSetState(() {});
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title:
                                                                  Text('Alert'),
                                                              content: Text((_model
                                                                      .getVersionBVResponse1Copy
                                                                      ?.bodyText ??
                                                                  '')),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }
                                                    } else {
                                                      _model.getVersionBVTestmodeResponse1Copy =
                                                          await GetVersionBVtestmodeCall
                                                              .call();

                                                      _shouldSetState = true;
                                                      if ((_model
                                                              .getVersionBVTestmodeResponse1Copy
                                                              ?.succeeded ??
                                                          true)) {
                                                        _model.currentVersion =
                                                            (_model.getVersionBVTestmodeResponse1Copy
                                                                    ?.bodyText ??
                                                                '');
                                                        safeSetState(() {});
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title:
                                                                  Text('Alert'),
                                                              content: Text((_model
                                                                      .getVersionBVTestmodeResponse1Copy
                                                                      ?.bodyText ??
                                                                  '')),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }
                                                    }
                                                  } else if (_model
                                                          .selectDeviceDDValue ==
                                                      'iATM-BS') {
                                                    if (_model.switchValue ==
                                                        true) {
                                                      _model.getVersionBSResponse1Copy =
                                                          await GetVersionBSCall
                                                              .call();

                                                      _shouldSetState = true;
                                                      if ((_model
                                                              .getVersionBSResponse1Copy
                                                              ?.succeeded ??
                                                          true)) {
                                                        _model.currentVersion =
                                                            (_model.getVersionBSResponse1Copy
                                                                    ?.bodyText ??
                                                                '');
                                                        safeSetState(() {});
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title:
                                                                  Text('Alert'),
                                                              content: Text((_model
                                                                      .getVersionBSResponse1Copy
                                                                      ?.bodyText ??
                                                                  '')),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }
                                                    } else {
                                                      _model.getVersionBSTestmodeResponse1Copy =
                                                          await GetVersionBStestmodeCall
                                                              .call();

                                                      _shouldSetState = true;
                                                      if ((_model
                                                              .getVersionBSTestmodeResponse1Copy
                                                              ?.succeeded ??
                                                          true)) {
                                                        _model.currentVersion =
                                                            (_model.getVersionBSTestmodeResponse1Copy
                                                                    ?.bodyText ??
                                                                '');
                                                        safeSetState(() {});
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title:
                                                                  Text('Alert'),
                                                              content: Text((_model
                                                                      .getVersionBSTestmodeResponse1Copy
                                                                      ?.bodyText ??
                                                                  '')),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }
                                                    }
                                                  } else {
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                }
                                              },
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              activeTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              inactiveTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              inactiveThumbColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            Text(
                                              'Production\nEnvironment',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if ((_model.currentVersion != null &&
                                    _model.currentVersion != '') &&
                                (_model.uploadedLocalFile_uploadDataS92 !=
                                        null &&
                                    (_model.uploadedLocalFile_uploadDataS92
                                            .bytes?.isNotEmpty ??
                                        false)))
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('INFO'),
                                                  content: Text(
                                                      'Upload Firmware to ${_model.selectDeviceDDValue} devices at ${(bool var1) {
                                                    return var1 == true
                                                        ? "Production Enviornment"
                                                        : "Test Enviornment";
                                                  }(_model.switchValue!)} ?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Confirm'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (confirmDialogResponse) {
                                      if (_model.selectDeviceDDValue ==
                                          'iATM-BV') {
                                        if (_model.switchValue == true) {
                                          _model.setVersionBVResponse =
                                              await SetUpdateBVCall.call(
                                            version: (double.parse((_model
                                                        .currentVersion!)) +
                                                    0.1)
                                                .toStringAsFixed(1),
                                            file: _model
                                                .uploadedLocalFile_uploadDataS92,
                                          );

                                          if ((_model.setVersionBVResponse
                                                  ?.succeeded ??
                                              true)) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('INFO'),
                                                  content: Text((_model
                                                          .setVersionBVResponse
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
                                            safeSetState(() {
                                              _model.isDataUploading_uploadDataS92 =
                                                  false;
                                              _model.uploadedLocalFile_uploadDataS92 =
                                                  FFUploadedFile(
                                                      bytes: Uint8List.fromList(
                                                          []));
                                            });

                                            safeSetState(() {
                                              _model
                                                  .selectDeviceDDValueController
                                                  ?.reset();
                                            });
                                            _model.currentVersion = null;
                                            safeSetState(() {});
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Alert'),
                                                  content: Text((_model
                                                          .setVersionBVResponse
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
                                        } else {
                                          _model.setVersionBVTestmodeResponse =
                                              await SetUpdateBVtestmodeCall
                                                  .call(
                                            version: (double.parse((_model
                                                        .currentVersion!)) +
                                                    0.1)
                                                .toStringAsFixed(1),
                                            file: _model
                                                .uploadedLocalFile_uploadDataS92,
                                          );

                                          if ((_model
                                                  .setVersionBVTestmodeResponse
                                                  ?.succeeded ??
                                              true)) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('INFO'),
                                                  content: Text((_model
                                                          .setVersionBVTestmodeResponse
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
                                            safeSetState(() {
                                              _model.isDataUploading_uploadDataS92 =
                                                  false;
                                              _model.uploadedLocalFile_uploadDataS92 =
                                                  FFUploadedFile(
                                                      bytes: Uint8List.fromList(
                                                          []));
                                            });

                                            safeSetState(() {
                                              _model
                                                  .selectDeviceDDValueController
                                                  ?.reset();
                                            });
                                            _model.currentVersion = null;
                                            safeSetState(() {});
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Alert'),
                                                  content: Text((_model
                                                          .setVersionBVTestmodeResponse
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
                                        }
                                      } else {
                                        if (_model.switchValue == true) {
                                          _model.setVersionBSResponse =
                                              await SetUpdateBSCall.call(
                                            version: (double.parse((_model
                                                        .currentVersion!)) +
                                                    0.1)
                                                .toStringAsFixed(1),
                                            file: _model
                                                .uploadedLocalFile_uploadDataS92,
                                          );

                                          if ((_model.setVersionBSResponse
                                                  ?.succeeded ??
                                              true)) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('INFO'),
                                                  content: Text((_model
                                                          .setVersionBSResponse
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
                                            safeSetState(() {
                                              _model.isDataUploading_uploadDataS92 =
                                                  false;
                                              _model.uploadedLocalFile_uploadDataS92 =
                                                  FFUploadedFile(
                                                      bytes: Uint8List.fromList(
                                                          []));
                                            });

                                            safeSetState(() {
                                              _model
                                                  .selectDeviceDDValueController
                                                  ?.reset();
                                            });
                                            _model.currentVersion = null;
                                            safeSetState(() {});
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Alert'),
                                                  content: Text((_model
                                                          .setVersionBSResponse
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
                                        } else {
                                          _model.setVersionBSTestmodeResponse =
                                              await SetUpdateBStestmodeCall
                                                  .call(
                                            version: (double.parse((_model
                                                        .currentVersion!)) +
                                                    0.1)
                                                .toStringAsFixed(1),
                                            file: _model
                                                .uploadedLocalFile_uploadDataS92,
                                          );

                                          if ((_model
                                                  .setVersionBSTestmodeResponse
                                                  ?.succeeded ??
                                              true)) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('INFO'),
                                                  content: Text((_model
                                                          .setVersionBSTestmodeResponse
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
                                            safeSetState(() {
                                              _model.isDataUploading_uploadDataS92 =
                                                  false;
                                              _model.uploadedLocalFile_uploadDataS92 =
                                                  FFUploadedFile(
                                                      bytes: Uint8List.fromList(
                                                          []));
                                            });

                                            safeSetState(() {
                                              _model
                                                  .selectDeviceDDValueController
                                                  ?.reset();
                                            });
                                            _model.currentVersion = null;
                                            safeSetState(() {});
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Alert'),
                                                  content: Text((_model
                                                          .setVersionBSTestmodeResponse
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
                                        }
                                      }
                                    }

                                    safeSetState(() {});
                                  },
                                  text: 'Upload',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
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
          ),
        ));
  }
}
