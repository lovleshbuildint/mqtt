import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'set_d_i_d_model.dart';
export 'set_d_i_d_model.dart';

class SetDIDWidget extends StatefulWidget {
  const SetDIDWidget({
    super.key,
    required this.deviceMacId,
  });

  final String? deviceMacId;

  @override
  State<SetDIDWidget> createState() => _SetDIDWidgetState();
}

class _SetDIDWidgetState extends State<SetDIDWidget>
    with TickerProviderStateMixin {
  late SetDIDModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetDIDModel());

    _model.setDidTextController ??= TextEditingController();
    _model.setDidFocusNode ??= FocusNode();

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 310.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 310.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: SafeArea(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 210.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(14.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                      child: Text(
                        'Enter Device ID',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF4D4D4D),
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _model.setDidTextController,
                              focusNode: _model.setDidFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.done,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: false,
                                hintText: 'Enter DID',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFB3B3B3),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFF2F2F2),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF4154F1),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 24.0, 14.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF2D2D2D),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              validator: _model.setDidTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 25.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                setState(() {
                                  _model.maxTry = 0;
                                  _model.setResponse = false;
                                  _model.notSetResponse = false;
                                  _model.checkResponse = true;
                                });
                                unawaited(
                                  () async {
                                    await actions.publishMqtt(
                                      context,
                                      'Settings',
                                      '${widget.deviceMacId}\$SDID${_model.setDidTextController.text},',
                                      FFAppState().deviceId,
                                      '15.206.230.32',
                                      'mqtt_buildint_\$\$2023',
                                    );
                                  }(),
                                );
                                unawaited(
                                  () async {
                                    await actions.subscribeMqtt(
                                      context,
                                      'Response',
                                      FFAppState().deviceId,
                                      widget.deviceMacId,
                                      '15.206.230.32',
                                      'mqtt_buildint_\$\$2023',
                                    );
                                  }(),
                                );
                                while (!_model.setResponse &&
                                    (_model.maxTry! < 17) &&
                                    !_model.notSetResponse) {
                                  if (('${(String var1) {
                                            return var1.split(',')[0] +
                                                var1.split(',')[2] +
                                                var1.split(',')[3];
                                          }(FFAppState().mqttResponse)}' ==
                                          '${widget.deviceMacId},\$SDID,OK') &&
                                      (_model.maxTry! < 15)) {
                                    setState(() {
                                      _model.setResponse = true;
                                    });
                                  } else if (('${(String var1) {
                                            return var1.split(',')[0] +
                                                var1.split(',')[2] +
                                                var1.split(',')[3];
                                          }(FFAppState().mqttResponse)}' !=
                                          '${widget.deviceMacId},\$SDID,OK') &&
                                      (_model.maxTry! > 14)) {
                                    setState(() {
                                      _model.notSetResponse = true;
                                      _model.checkResponse = false;
                                    });
                                  } else {
                                    await Future.delayed(
                                        const Duration(milliseconds: 1000));
                                    setState(() {
                                      _model.maxTry = _model.maxTry! + 1;
                                    });
                                  }
                                }
                              },
                              text: 'SET',
                              options: FFButtonOptions(
                                width: 351.0,
                                height: 46.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF4154F1),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
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
        if (_model.checkResponse)
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: SafeArea(
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 210.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                        child: Text(
                          '${FFAppState().mqttResponse} ${_model.maxTry?.toString()}',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF4D4D4D),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      Icon(
                        Icons.api_rounded,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 50.0,
                      ).animateOnPageLoad(
                          animationsMap['iconOnPageLoadAnimation']!),
                    ],
                  ),
                ),
              ),
            ),
          ),
        if (_model.setResponse)
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: SafeArea(
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 210.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                        child: Text(
                          'DID SET SUCCESSFULLY',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF4D4D4D),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      Icon(
                        Icons.done_outlined,
                        color: Color(0xFF07D95A),
                        size: 50.0,
                      ),
                    ],
                  ).animateOnPageLoad(
                      animationsMap['columnOnPageLoadAnimation1']!),
                ),
              ),
            ),
          ),
        if (_model.setResponse)
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: SafeArea(
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 210.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                        child: Text(
                          'Device Didn\'t Responded',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF4D4D4D),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      Icon(
                        Icons.close,
                        color: Color(0xC4F71A1A),
                        size: 50.0,
                      ),
                    ],
                  ).animateOnPageLoad(
                      animationsMap['columnOnPageLoadAnimation2']!),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
