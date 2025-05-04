import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'ta_widget.dart' show TaWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TaModel extends FlutterFlowModel<TaWidget> {
  ///  Local state fields for this page.

  String? searchValue;

  List<int> selectedId = [];
  void addToSelectedId(int item) => selectedId.add(item);
  void removeFromSelectedId(int item) => selectedId.remove(item);
  void removeAtIndexFromSelectedId(int index) => selectedId.removeAt(index);
  void insertAtIndexInSelectedId(int index, int item) =>
      selectedId.insert(index, item);
  void updateSelectedIdAtIndex(int index, Function(int) updateFn) =>
      selectedId[index] = updateFn(selectedId[index]);

  String? test;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<dynamic>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    paginatedDataTableController.dispose();
  }
}
