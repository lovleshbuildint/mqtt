// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IntegerStruct extends BaseStruct {
  IntegerStruct({
    double? temperature,
  }) : _temperature = temperature;

  // "Temperature" field.
  double? _temperature;
  double get temperature => _temperature ?? 0.0;
  set temperature(double? val) => _temperature = val;
  void incrementTemperature(double amount) =>
      _temperature = temperature + amount;
  bool hasTemperature() => _temperature != null;

  static IntegerStruct fromMap(Map<String, dynamic> data) => IntegerStruct(
        temperature: castToType<double>(data['Temperature']),
      );

  static IntegerStruct? maybeFromMap(dynamic data) =>
      data is Map ? IntegerStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Temperature': _temperature,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Temperature': serializeParam(
          _temperature,
          ParamType.double,
        ),
      }.withoutNulls;

  static IntegerStruct fromSerializableMap(Map<String, dynamic> data) =>
      IntegerStruct(
        temperature: deserializeParam(
          data['Temperature'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'IntegerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IntegerStruct && temperature == other.temperature;
  }

  @override
  int get hashCode => const ListEquality().hash([temperature]);
}

IntegerStruct createIntegerStruct({
  double? temperature,
}) =>
    IntegerStruct(
      temperature: temperature,
    );
