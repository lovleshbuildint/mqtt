// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_gauges/gauges.dart';

class NewCustomWidget extends StatefulWidget {
  const NewCustomWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  State<NewCustomWidget> createState() => _NewCustomWidgetState();
}

class _NewCustomWidgetState extends State<NewCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SfRadialGauge(axes: <RadialAxis>[
        RadialAxis(
            axisLineStyle: const AxisLineStyle(
              thickness: 0.07,
              thicknessUnit: GaugeSizeUnit.factor,
              cornerStyle: CornerStyle.bothCurve,
            ),
            showTicks: false,
            labelOffset: 25,
            pointers: <GaugePointer>[
              RangePointer(
                  color: _rangeColor,
                  value: _markerValue,
                  cornerStyle: CornerStyle.startCurve,
                  width: 0.07,
                  sizeUnit: GaugeSizeUnit.factor),
              MarkerPointer(
                value: _markerValue,
                overlayRadius: 0,
                borderColor: _borderColor,
                overlayColor: _borderColor.withOpacity(0.125),
                borderWidth: 10,
                color: Colors.white,
                onValueChanged: handlePointerValueChanged,
                onValueChangeEnd: handlePointerValueChanged,
                onValueChanging: handlePointerValueChanging,
                elevation: 5,
                enableDragging: true,
                markerHeight: _firstMarkerSize,
                markerWidth: _firstMarkerSize,
                markerType: MarkerType.circle,
              ),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      _annotationValue,
                      style: TextStyle(
                        fontSize: _annotationFontSize,
                        fontFamily: 'Times',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                positionFactor: 0.08,
              )
            ])
      ]),
    );
  }

  void handlePointerValueChanged(double value) {
    setState(() {
      _markerValue = value;
      final int _value = _markerValue.round();
      if (_value < 100 && _annotationValue != 'In-progress') {
        _annotationValue = 'In-progress';
        if (_rangeColor != const Color.fromRGBO(255, 150, 0, 1)) {
          _rangeColor = const Color.fromRGBO(255, 150, 0, 1);
          _borderColor = const Color.fromRGBO(255, 150, 0, 1);
        }
      } else if (_value == 100) {
        _annotationValue = 'Done';
        _rangeColor = null;
        _borderColor = const Color(0xFF00A8B5);
      }
    });
  }

  void handlePointerValueChanging(ValueChangingArgs args) {
    if (args.value.toInt() <= 3) {
      args.cancel = true;
    }
  }

  double _markerValue = 60;
  double _firstMarkerSize = 10;
  double _annotationFontSize = 25;
  String _annotationValue = 'In-progress';
  Color? _rangeColor = const Color.fromRGBO(255, 150, 0, 1);
  Color _borderColor = const Color.fromRGBO(255, 150, 0, 1);
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
