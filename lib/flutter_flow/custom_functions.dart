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
  int? status,
) {
  mainData['locationDetails'].sort((a, b) =>
      (a['BranchCode'] as String).compareTo(b['BranchCode'] as String));

  if (searchValue == null || searchValue.isEmpty) {
    List<dynamic> filteredData = [];
    if (status == 2) {
      for (dynamic data in mainData['locationDetails']) {
        if (data['OnlineStatus'] == 'Online') {
          filteredData.add(data);
        }
      }
      return filteredData;
    } else if (status == 3) {
      for (dynamic data in mainData['locationDetails']) {
        if (data['OnlineStatus'] == 'Offline') {
          filteredData.add(data);
        }
      }
      return filteredData;
    } else {
      return mainData['locationDetails'];
    }
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

String? decimalToBinary(int decimal) {
  // convert decimal to binary
  if (decimal == null) {
    return null;
  }

  String binary = '';
  binary = decimal.toRadixString(2);

  while (binary.length < 4) {
    binary = '0' + binary;
  }

  if (binary.length > 4) {
    // If it's longer than 4 digits, remove the excess digits
    binary = binary.substring(0, binary.length - 1);
  }

  binary = binary.split('').reversed.join();

  return binary;
}
