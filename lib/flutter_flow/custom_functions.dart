import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

int? checkIndex(
  dynamic list,
  String? value,
  String? checkKey,
  String? resultKey,
) {
  for (int i = 0; i < list['result'].length; i++) {
    if (list['result'][i][checkKey] == value) {
      return list['result'][i][resultKey];
    }
  }
}

String? editUserOrg(
  dynamic list,
  int? value,
  String? checkKey,
  String? resultKey,
) {
  for (int i = 0; i < list['result'].length; i++) {
    if (list['result'][i][checkKey] == value) {
      var resultValue = list['result'][i][resultKey];
      if (resultValue is int) {
        // Convert integer to string
        return resultValue.toString();
      }
      return resultValue;
    }
  }
}

dynamic filter(
  dynamic mainData,
  String? searchValue,
) {
  if (searchValue == null || searchValue.isEmpty) {
    return mainData['locationDetails'];
  }

  List<dynamic> filteredData = [];
  String searchValueLowerCase = searchValue.toLowerCase();
  for (dynamic data in mainData['locationDetails']) {
    if (data['BranchCode'].toLowerCase().contains(searchValueLowerCase)) {
      filteredData.add(data);
    }
  }

  return filteredData;
}
