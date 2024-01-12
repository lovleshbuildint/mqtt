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
) {
  for (int i = 0; i < list['result'].length; i++) {
    if (list['result'][i]['org_name'] == value) {
      return list['result'][i]['org_id'];
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
