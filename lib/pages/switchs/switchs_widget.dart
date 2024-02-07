import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'switchs_model.dart';
export 'switchs_model.dart';

class SwitchsWidget extends StatefulWidget {
  const SwitchsWidget({
    super.key,
    required this.value,
    required this.username,
    required this.deviceState,
  });

  final int? value;
  final String? username;
  final int? deviceState;

  @override
  State<SwitchsWidget> createState() => _SwitchsWidgetState();
}

class _SwitchsWidgetState extends State<SwitchsWidget> {
  late SwitchsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwitchsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.switchValue = (widget.value == 1 ? true : false);
      });
    });
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
          _model.updateUserStateOn =
              await MasterGroup.updateUserOrDeviceStateCall.call(
            username: widget.username,
            newUserState: 1,
            token: FFAppState().token,
            deviceId: FFAppState().deviceId,
            deviceState: widget.deviceState,
          );
          if ((_model.updateUserStateOn?.succeeded ?? true)) {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  content: Text((_model.updateUserStateOn?.bodyText ?? '')),
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
                  content: Text((_model.updateUserStateOn?.bodyText ?? '')),
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
          _model.updateUserStateOff =
              await MasterGroup.updateUserOrDeviceStateCall.call(
            username: widget.username,
            newUserState: 0,
            token: FFAppState().token,
            deviceId: FFAppState().deviceId,
            deviceState: widget.deviceState,
          );
          if ((_model.updateUserStateOff?.succeeded ?? true)) {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  content: Text((_model.updateUserStateOff?.bodyText ?? '')),
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
                  content: Text((_model.updateUserStateOff?.bodyText ?? '')),
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
