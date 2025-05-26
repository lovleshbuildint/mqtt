import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'switch3_b_s_a_t_m_auto_manual_widget.dart'
    show Switch3BSATMAutoManualWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Switch3BSATMAutoManualModel
    extends FlutterFlowModel<Switch3BSATMAutoManualWidget> {
  ///  Local state fields for this component.

  String? prevMqttTime;

  /// Relay ON/OFF
  String relayState = '1';

  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
