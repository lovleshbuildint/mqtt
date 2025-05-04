// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class NewCustomWidget extends StatefulWidget {
  const NewCustomWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<NewCustomWidget> createState() => _NewCustomWidgetState();
}

class _NewCustomWidgetState extends State<NewCustomWidget> {
  int _currentValue = 18; // Initial integer value

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 250,
      height: widget.height ?? 250,
      child: SleekCircularSlider(
        min: 18,
        max: 32,
        initialValue: _currentValue.toDouble(), // Set initial value as double
        onChange: (double value) {
          setState(() {
            _currentValue = value.round(); // Round to the nearest integer
          });
        },
        appearance: CircularSliderAppearance(
          customColors: CustomSliderColors(
            trackColor: Colors.grey, // Color of the unfilled track
            progressBarColor: Colors.blue, // Color of the filled progress
            shadowColor: Colors.blue.withOpacity(0.3), // Shadow color
            dotColor: Colors.blueAccent, // Color of the knob
          ),
          size: widget.width ?? 250, // Adjust size dynamically
          animationEnabled: true, // Enable animation
        ),
        innerWidget: (double value) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Temperature',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  '${_currentValue}°C', // Display integer value
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
