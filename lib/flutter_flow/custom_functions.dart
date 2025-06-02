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

String? checkIndexta(
  dynamic list,
  List<int> values,
) {
  List<int> cIds = [];
  for (int value in values) {
    if (value >= 0 && value < list.length) {
      cIds.add(list[value]['c_id']);
    }
  }
  return cIds.join(',');
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

dynamic filterDashboard(
  dynamic mainData,
  String? searchValue,
  int? status,
  String? orgName,
) {
// Step 1: Sort by BranchCode
  mainData['locationDetails'].sort((a, b) =>
      (a['BranchCode'] as String).compareTo(b['BranchCode'] as String));

  // Step 2: Filter by OrgName
  List<dynamic> filteredByOrg = [];
  if (orgName != null && orgName != 'All') {
    for (dynamic data in mainData['locationDetails']) {
      if (data['OrgName'] == orgName) {
        filteredByOrg.add(data);
      }
    }
  } else {
    filteredByOrg = List.from(mainData['locationDetails']);
  }

  // Step 3: Calculate OrgDetails counts
  int totalLocations = filteredByOrg.length;
  int onlineLocations =
      filteredByOrg.where((d) => d['OnlineStatus'] == 'Online').length;
  int offlineLocations =
      filteredByOrg.where((d) => d['OnlineStatus'] == 'Offline').length;

  Map<String, dynamic> orgDetails = {
    'OrgName': orgName ?? 'All',
    'Total_Locations': totalLocations,
    'Online_Locations': onlineLocations,
    'Offline_Locations': offlineLocations,
  };

  // Step 4: Filter by Status
  List<dynamic> filteredByStatus = [];
  if (status == 2) {
    filteredByStatus =
        filteredByOrg.where((d) => d['OnlineStatus'] == 'Online').toList();
  } else if (status == 3) {
    filteredByStatus =
        filteredByOrg.where((d) => d['OnlineStatus'] == 'Offline').toList();
  } else if (status == 4) {
    filteredByStatus =
        filteredByOrg.where((d) => d['OnlineStatus'] == 'No Data').toList();
  } else {
    filteredByStatus = filteredByOrg;
  }

  // Step 5: Filter by Search (BranchCode)
  if (searchValue != null && searchValue.isNotEmpty) {
    String searchValueLowerCase = searchValue.toLowerCase();
    filteredByStatus = filteredByStatus
        .where((data) => (data['BranchCode'] as String)
            .toLowerCase()
            .contains(searchValueLowerCase))
        .toList();
  }

  return {
    'filteredData': filteredByStatus,
    'OrgDetails': orgDetails,
  };
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

dynamic searchFilter(
  dynamic mainData,
  String? searchValue,
  String? mainKey,
) {
  if (searchValue == null || searchValue.isEmpty) {
    return mainData;
  }

  List<dynamic> filteredData = [];
  String searchValueLowerCase = searchValue.toLowerCase();
  for (dynamic data in mainData) {
    if (data[mainKey].toLowerCase().contains(searchValueLowerCase)) {
      filteredData.add(data);
    }
  }

  return filteredData;
}

dynamic returnMatrix() {
  //  return a json value
  return {
    "levels": [
      {
        "level": "LEVEL-1",
        "name": "SURESHBHAI SOJITRA",
        "email": "svsojitra@varachhabank.in",
        "mobile": "7069055426"
      },
      {
        "level": "LEVEL-2",
        "name": "Janak B. Vadadoriya",
        "email": "jbvadadoriya@varachhabank.in",
        "mobile": "6352906273"
      },
      {
        "level": "LEVEL-3",
        "name": "Kalpesh D. Ribadiya",
        "email": "kdribadiya@varachhabank.in",
        "mobile": "9879825893"
      },
      {
        "level": "LEVEL-4",
        "name": "Paresh D. Kelawala",
        "email": "pdkelawala@varachhabank.in",
        "mobile": "9737514000"
      }
    ]
  };
}

dynamic returnJson(String plainText) {
  Map<String, dynamic> jsondecodedPT = jsonDecode(plainText);
  return jsondecodedPT;
}

String? returnEncodeJson(dynamic inputMap) {
  return jsonEncode(inputMap);
}

bool? mapContainsAll(
  String bigMaps,
  dynamic smallMap,
) {
  try {
    if (bigMaps == null || bigMaps.trim().isEmpty) {
      return false;
    }

    final decoded = jsonDecode(bigMaps);
    if (decoded is! Map<String, dynamic>) {
      return false;
    }

    final Map<String, dynamic> bigMap = decoded;
    if (smallMap is! Map) {
      return false;
    }

    for (final entry in smallMap.entries) {
      if (!bigMap.containsKey(entry.key) || bigMap[entry.key] != entry.value) {
        return false;
      }
    }

    return true;
  } catch (e) {
    print('Error parsing JSON or checking map: $e');
    return false;
  }
}
