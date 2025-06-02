import 'package:flutter/material.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

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
      _deviceStateDid =
          await secureStorage.getString('ff_deviceStateDid') ?? _deviceStateDid;
    });
    await _safeInitAsync(() async {
      _mqttTime = await secureStorage.getString('ff_mqttTime') ?? _mqttTime;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_deviceStatusDIDJson') != null) {
        try {
          _deviceStatusDIDJson = jsonDecode(
              await secureStorage.getString('ff_deviceStatusDIDJson') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _contactNum = await secureStorage.getInt('ff_contactNum') ?? _contactNum;
    });
    await _safeInitAsync(() async {
      _relayStatusiATM = await secureStorage.getString('ff_relayStatusiATM') ??
          _relayStatusiATM;
    });
    await _safeInitAsync(() async {
      _accessRoleId =
          await secureStorage.getInt('ff_accessRoleId') ?? _accessRoleId;
    });
    await _safeInitAsync(() async {
      _regionId = (await secureStorage.getStringList('ff_regionId'))
              ?.map(int.parse)
              .toList() ??
          _regionId;
    });
    await _safeInitAsync(() async {
      _stateId = (await secureStorage.getStringList('ff_stateId'))
              ?.map(int.parse)
              .toList() ??
          _stateId;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_BSIATMMQTT') != null) {
        try {
          _BSIATMMQTT =
              jsonDecode(await secureStorage.getString('ff_BSIATMMQTT') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _userOrg = (await secureStorage.getStringList('ff_userOrg'))
              ?.map(int.parse)
              .toList() ??
          _userOrg;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _token = '';
  String get token => _token;
  set token(String value) {
    _token = value;
    secureStorage.setString('ff_token', value);
  }

  void deleteToken() {
    secureStorage.delete(key: 'ff_token');
  }

  String _deviceId = '';
  String get deviceId => _deviceId;
  set deviceId(String value) {
    _deviceId = value;
    secureStorage.setString('ff_deviceId', value);
  }

  void deleteDeviceId() {
    secureStorage.delete(key: 'ff_deviceId');
  }

  String _fullName = '';
  String get fullName => _fullName;
  set fullName(String value) {
    _fullName = value;
    secureStorage.setString('ff_fullName', value);
  }

  void deleteFullName() {
    secureStorage.delete(key: 'ff_fullName');
  }

  String _role = '';
  String get role => _role;
  set role(String value) {
    _role = value;
    secureStorage.setString('ff_role', value);
  }

  void deleteRole() {
    secureStorage.delete(key: 'ff_role');
  }

  String _deviceStateDid = '';
  String get deviceStateDid => _deviceStateDid;
  set deviceStateDid(String value) {
    _deviceStateDid = value;
    secureStorage.setString('ff_deviceStateDid', value);
  }

  void deleteDeviceStateDid() {
    secureStorage.delete(key: 'ff_deviceStateDid');
  }

  String _mqttTime = '';
  String get mqttTime => _mqttTime;
  set mqttTime(String value) {
    _mqttTime = value;
    secureStorage.setString('ff_mqttTime', value);
  }

  void deleteMqttTime() {
    secureStorage.delete(key: 'ff_mqttTime');
  }

  dynamic _deviceStatusDIDJson;
  dynamic get deviceStatusDIDJson => _deviceStatusDIDJson;
  set deviceStatusDIDJson(dynamic value) {
    _deviceStatusDIDJson = value;
    secureStorage.setString('ff_deviceStatusDIDJson', jsonEncode(value));
  }

  void deleteDeviceStatusDIDJson() {
    secureStorage.delete(key: 'ff_deviceStatusDIDJson');
  }

  int _contactNum = 0;
  int get contactNum => _contactNum;
  set contactNum(int value) {
    _contactNum = value;
    secureStorage.setInt('ff_contactNum', value);
  }

  void deleteContactNum() {
    secureStorage.delete(key: 'ff_contactNum');
  }

  String _relayStatusiATM = '';
  String get relayStatusiATM => _relayStatusiATM;
  set relayStatusiATM(String value) {
    _relayStatusiATM = value;
    secureStorage.setString('ff_relayStatusiATM', value);
  }

  void deleteRelayStatusiATM() {
    secureStorage.delete(key: 'ff_relayStatusiATM');
  }

  int _accessRoleId = 0;
  int get accessRoleId => _accessRoleId;
  set accessRoleId(int value) {
    _accessRoleId = value;
    secureStorage.setInt('ff_accessRoleId', value);
  }

  void deleteAccessRoleId() {
    secureStorage.delete(key: 'ff_accessRoleId');
  }

  List<int> _regionId = [];
  List<int> get regionId => _regionId;
  set regionId(List<int> value) {
    _regionId = value;
    secureStorage.setStringList(
        'ff_regionId', value.map((x) => x.toString()).toList());
  }

  void deleteRegionId() {
    secureStorage.delete(key: 'ff_regionId');
  }

  void addToRegionId(int value) {
    regionId.add(value);
    secureStorage.setStringList(
        'ff_regionId', _regionId.map((x) => x.toString()).toList());
  }

  void removeFromRegionId(int value) {
    regionId.remove(value);
    secureStorage.setStringList(
        'ff_regionId', _regionId.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromRegionId(int index) {
    regionId.removeAt(index);
    secureStorage.setStringList(
        'ff_regionId', _regionId.map((x) => x.toString()).toList());
  }

  void updateRegionIdAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    regionId[index] = updateFn(_regionId[index]);
    secureStorage.setStringList(
        'ff_regionId', _regionId.map((x) => x.toString()).toList());
  }

  void insertAtIndexInRegionId(int index, int value) {
    regionId.insert(index, value);
    secureStorage.setStringList(
        'ff_regionId', _regionId.map((x) => x.toString()).toList());
  }

  String _mqttResponse = '';
  String get mqttResponse => _mqttResponse;
  set mqttResponse(String value) {
    _mqttResponse = value;
  }

  List<int> _stateId = [];
  List<int> get stateId => _stateId;
  set stateId(List<int> value) {
    _stateId = value;
    secureStorage.setStringList(
        'ff_stateId', value.map((x) => x.toString()).toList());
  }

  void deleteStateId() {
    secureStorage.delete(key: 'ff_stateId');
  }

  void addToStateId(int value) {
    stateId.add(value);
    secureStorage.setStringList(
        'ff_stateId', _stateId.map((x) => x.toString()).toList());
  }

  void removeFromStateId(int value) {
    stateId.remove(value);
    secureStorage.setStringList(
        'ff_stateId', _stateId.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromStateId(int index) {
    stateId.removeAt(index);
    secureStorage.setStringList(
        'ff_stateId', _stateId.map((x) => x.toString()).toList());
  }

  void updateStateIdAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    stateId[index] = updateFn(_stateId[index]);
    secureStorage.setStringList(
        'ff_stateId', _stateId.map((x) => x.toString()).toList());
  }

  void insertAtIndexInStateId(int index, int value) {
    stateId.insert(index, value);
    secureStorage.setStringList(
        'ff_stateId', _stateId.map((x) => x.toString()).toList());
  }

  dynamic _BSIATMMQTT;
  dynamic get BSIATMMQTT => _BSIATMMQTT;
  set BSIATMMQTT(dynamic value) {
    _BSIATMMQTT = value;
    secureStorage.setString('ff_BSIATMMQTT', jsonEncode(value));
  }

  void deleteBSIATMMQTT() {
    secureStorage.delete(key: 'ff_BSIATMMQTT');
  }

  List<int> _userOrg = [];
  List<int> get userOrg => _userOrg;
  set userOrg(List<int> value) {
    _userOrg = value;
    secureStorage.setStringList(
        'ff_userOrg', value.map((x) => x.toString()).toList());
  }

  void deleteUserOrg() {
    secureStorage.delete(key: 'ff_userOrg');
  }

  void addToUserOrg(int value) {
    userOrg.add(value);
    secureStorage.setStringList(
        'ff_userOrg', _userOrg.map((x) => x.toString()).toList());
  }

  void removeFromUserOrg(int value) {
    userOrg.remove(value);
    secureStorage.setStringList(
        'ff_userOrg', _userOrg.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromUserOrg(int index) {
    userOrg.removeAt(index);
    secureStorage.setStringList(
        'ff_userOrg', _userOrg.map((x) => x.toString()).toList());
  }

  void updateUserOrgAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    userOrg[index] = updateFn(_userOrg[index]);
    secureStorage.setStringList(
        'ff_userOrg', _userOrg.map((x) => x.toString()).toList());
  }

  void insertAtIndexInUserOrg(int index, int value) {
    userOrg.insert(index, value);
    secureStorage.setStringList(
        'ff_userOrg', _userOrg.map((x) => x.toString()).toList());
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
