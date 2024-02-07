import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'switchs2_model.dart';
export 'switchs2_model.dart';

class Switchs2Widget extends StatefulWidget {
  const Switchs2Widget({
    super.key,
    required this.value,
    required this.username,
    required this.newUserState,
  });

  final int? value;
  final String? username;
  final int? newUserState;

  @override
  State<Switchs2Widget> createState() => _Switchs2WidgetState();
}

class _Switchs2WidgetState extends State<Switchs2Widget> {
  late Switchs2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Switchs2Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Switch.adaptive(
      value: _model.switchValue ??= widget.value == 1,
      onChanged: (newValue) async {
        setState(() => _model.switchValue = newValue!);
        if (newValue!) {
          _model.updateDeviceStateOn =
              await MasterGroup.updateUserOrDeviceStateCall.call(
            username: widget.username,
            newUserState: widget.newUserState,
            token: FFAppState().token,
            deviceId: FFAppState().deviceId,
            deviceState: 1,
          );
          if ((_model.updateDeviceStateOn?.succeeded ?? true)) {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  content: Text((_model.updateDeviceStateOn?.bodyText ?? '')),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('Ok'),
                    ),
                  ],
                );
              },
            );
          } else {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  content: Text((_model.updateDeviceStateOn?.bodyText ?? '')),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('Ok'),
                    ),
                  ],
                );
              },
            );
          }

          setState(() {});
        } else {
          _model.updateDeviceStateOff =
              await MasterGroup.updateUserOrDeviceStateCall.call(
            username: widget.username,
            newUserState: widget.newUserState,
            token: FFAppState().token,
            deviceId: FFAppState().deviceId,
            deviceState: 0,
          );
          if ((_model.updateDeviceStateOff?.succeeded ?? true)) {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  content: Text((_model.updateDeviceStateOff?.bodyText ?? '')),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('Ok'),
                    ),
                  ],
                );
              },
            );
          } else {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  content: Text((_model.updateDeviceStateOff?.bodyText ?? '')),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('Ok'),
                    ),
                  ],
                );
              },
            );
          }

          setState(() {});
        }
      },
      activeColor: FlutterFlowTheme.of(context).primary,
      activeTrackColor: FlutterFlowTheme.of(context).accent1,
      inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
      inactiveThumbColor: FlutterFlowTheme.of(context).secondaryText,
    );
  }
}
