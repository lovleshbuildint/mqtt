// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LatLongStruct extends BaseStruct {
  LatLongStruct({
    LatLng? latLog,
  }) : _latLog = latLog;

  // "LatLog" field.
  LatLng? _latLog;
  LatLng? get latLog => _latLog;
  set latLog(LatLng? val) => _latLog = val;

  bool hasLatLog() => _latLog != null;

  static LatLongStruct fromMap(Map<String, dynamic> data) => LatLongStruct(
        latLog: data['LatLog'] as LatLng?,
      );

  static LatLongStruct? maybeFromMap(dynamic data) =>
      data is Map ? LatLongStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'LatLog': _latLog,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'LatLog': serializeParam(
          _latLog,
          ParamType.LatLng,
        ),
      }.withoutNulls;

  static LatLongStruct fromSerializableMap(Map<String, dynamic> data) =>
      LatLongStruct(
        latLog: deserializeParam(
          data['LatLog'],
          ParamType.LatLng,
          false,
        ),
      );

  @override
  String toString() => 'LatLongStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LatLongStruct && latLog == other.latLog;
  }

  @override
  int get hashCode => const ListEquality().hash([latLog]);
}

LatLongStruct createLatLongStruct({
  LatLng? latLog,
}) =>
    LatLongStruct(
      latLog: latLog,
    );
