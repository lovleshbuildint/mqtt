import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
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
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _token = await secureStorage.getString('ff_token') ?? _token;
    });
    await _safeInitAsync(() async {
      _deviceId = await secureStorage.getString('ff_deviceId') ?? _deviceId;
    });
    await _safeInitAsync(() async {
      _fullName = await secureStorage.getString('ff_fullName') ?? _fullName;
    });
    await _safeInitAsync(() async {
      _role = await secureStorage.getString('ff_role') ?? _role;
    });
    await _safeInitAsync(() async {
      _userOrg = await secureStorage.getString('ff_userOrg') ?? _userOrg;
    });
    await _safeInitAsync(() async {
      _userProject =
          await secureStorage.getString('ff_userProject') ?? _userProject;
    });
    await _safeInitAsync(() async {
      _deviceStateDid =
          await secureStorage.getString('ff_deviceStateDid') ?? _deviceStateDid;
    });
    await _safeInitAsync(() async {
      _mqttTime = await secureStorage.getString('ff_mqttTime') ?? _mqttTime;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _token = '';
  String get token => _token;
  set token(String _value) {
    _token = _value;
    secureStorage.setString('ff_token', _value);
  }

  void deleteToken() {
    secureStorage.delete(key: 'ff_token');
  }

  String _deviceId = '';
  String get deviceId => _deviceId;
  set deviceId(String _value) {
    _deviceId = _value;
    secureStorage.setString('ff_deviceId', _value);
  }

  void deleteDeviceId() {
    secureStorage.delete(key: 'ff_deviceId');
  }

  String _fullName = '';
  String get fullName => _fullName;
  set fullName(String _value) {
    _fullName = _value;
    secureStorage.setString('ff_fullName', _value);
  }

  void deleteFullName() {
    secureStorage.delete(key: 'ff_fullName');
  }

  String _role = '';
  String get role => _role;
  set role(String _value) {
    _role = _value;
    secureStorage.setString('ff_role', _value);
  }

  void deleteRole() {
    secureStorage.delete(key: 'ff_role');
  }

  String _userOrg = '';
  String get userOrg => _userOrg;
  set userOrg(String _value) {
    _userOrg = _value;
    secureStorage.setString('ff_userOrg', _value);
  }

  void deleteUserOrg() {
    secureStorage.delete(key: 'ff_userOrg');
  }

  String _userProject = '';
  String get userProject => _userProject;
  set userProject(String _value) {
    _userProject = _value;
    secureStorage.setString('ff_userProject', _value);
  }

  void deleteUserProject() {
    secureStorage.delete(key: 'ff_userProject');
  }

  String _deviceStateDid = '';
  String get deviceStateDid => _deviceStateDid;
  set deviceStateDid(String _value) {
    _deviceStateDid = _value;
    secureStorage.setString('ff_deviceStateDid', _value);
  }

  void deleteDeviceStateDid() {
    secureStorage.delete(key: 'ff_deviceStateDid');
  }

  String _mqttTime = '';
  String get mqttTime => _mqttTime;
  set mqttTime(String _value) {
    _mqttTime = _value;
    secureStorage.setString('ff_mqttTime', _value);
  }

  void deleteMqttTime() {
    secureStorage.delete(key: 'ff_mqttTime');
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
