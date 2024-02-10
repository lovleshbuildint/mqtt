import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _token = prefs.getString('ff_token') ?? _token;
    });
    _safeInit(() {
      _deviceId = prefs.getString('ff_deviceId') ?? _deviceId;
    });
    _safeInit(() {
      _fullName = prefs.getString('ff_fullName') ?? _fullName;
    });
    _safeInit(() {
      _role = prefs.getString('ff_role') ?? _role;
    });
    _safeInit(() {
      _userOrg = prefs.getString('ff_userOrg') ?? _userOrg;
    });
    _safeInit(() {
      _userProject = prefs.getString('ff_userProject') ?? _userProject;
    });
    _safeInit(() {
      _deviceStateDid = prefs.getString('ff_deviceStateDid') ?? _deviceStateDid;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _token = '';
  String get token => _token;
  set token(String _value) {
    _token = _value;
    prefs.setString('ff_token', _value);
  }

  String _deviceId = '';
  String get deviceId => _deviceId;
  set deviceId(String _value) {
    _deviceId = _value;
    prefs.setString('ff_deviceId', _value);
  }

  String _fullName = '';
  String get fullName => _fullName;
  set fullName(String _value) {
    _fullName = _value;
    prefs.setString('ff_fullName', _value);
  }

  String _role = '';
  String get role => _role;
  set role(String _value) {
    _role = _value;
    prefs.setString('ff_role', _value);
  }

  String _userOrg = '';
  String get userOrg => _userOrg;
  set userOrg(String _value) {
    _userOrg = _value;
    prefs.setString('ff_userOrg', _value);
  }

  String _userProject = '';
  String get userProject => _userProject;
  set userProject(String _value) {
    _userProject = _value;
    prefs.setString('ff_userProject', _value);
  }

  String _deviceStateDid = '';
  String get deviceStateDid => _deviceStateDid;
  set deviceStateDid(String _value) {
    _deviceStateDid = _value;
    prefs.setString('ff_deviceStateDid', _value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
