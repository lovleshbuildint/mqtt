import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Master Group Code

class MasterGroup {
  static String baseUrl = 'https://api.app.master.buildint.co/api';
  static Map<String, String> headers = {
    'Authorization': '[token]',
  };
  static LoginCall loginCall = LoginCall();
  static RegisterDeviceCall registerDeviceCall = RegisterDeviceCall();
  static GetNotificationCall getNotificationCall = GetNotificationCall();
  static ChangeDeviceStateCall changeDeviceStateCall = ChangeDeviceStateCall();
  static GetProjectCall getProjectCall = GetProjectCall();
  static AddUserCall addUserCall = AddUserCall();
  static UserInfoCall userInfoCall = UserInfoCall();
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
    String? token = '',
    String? deviceId = '',
  }) async {
    final ffApiRequestBody = '''
{
    "username": "${username}",
    "password": "${password}",
    "deviceId": "${deviceId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '${MasterGroup.baseUrl}/login',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RegisterDeviceCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? token = '',
    String? deviceId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "username": "${username}",
  "deviceId": "${deviceId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register Device',
      apiUrl: '${MasterGroup.baseUrl}/createDevice',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetNotificationCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? deviceId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Notification',
      apiUrl: '${MasterGroup.baseUrl}/getNotification',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${token}',
      },
      params: {
        'deviceId': deviceId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ChangeDeviceStateCall {
  Future<ApiCallResponse> call({
    String? username = '',
    int? newState,
    String? token = '',
    String? deviceId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "username": "${username}",
  "newState": "${newState}",
  "deviceId": "${deviceId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Change Device State',
      apiUrl: '${MasterGroup.baseUrl}/changeDeviceState',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetProjectCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? deviceId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Project',
      apiUrl: '${MasterGroup.baseUrl}/getProject',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${token}',
      },
      params: {
        'deviceId': deviceId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AddUserCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
    String? userRole = '',
    int? userOrg,
    String? fullName = '',
    String? userProject = '',
    String? token = '',
    String? deviceId = '',
  }) async {
    final ffApiRequestBody = '''
{
    "username": "${username}",
    "password": "${password}",
    "userRole": "${userRole}",
    "fullName": "${fullName}",
    "user_org": ${userOrg},
    "user_project": "${userProject}",
    "deviceId": "${deviceId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add User',
      apiUrl: '${MasterGroup.baseUrl}/addUser',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UserInfoCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? deviceId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'User Info',
      apiUrl: '${MasterGroup.baseUrl}/getUserInfo',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Master Group Code

class GetOrganizationCall {
  static Future<ApiCallResponse> call({
    String? project = '',
    String? deviceId = '',
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Organization',
      apiUrl: 'https://api.app.${project}.buildint.co/api/getOrganization',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${token}',
      },
      params: {
        'deviceId': deviceId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? result(dynamic response) => getJsonField(
        response,
        r'''$.result''',
        true,
      ) as List?;
  static List<int>? orgId(dynamic response) => (getJsonField(
        response,
        r'''$.result[:].org_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? orgName(dynamic response) => (getJsonField(
        response,
        r'''$.result[:].org_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class DashboardCall {
  static Future<ApiCallResponse> call({
    String? deviceId = '',
    String? project = '',
    String? orgId = '',
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Dashboard',
      apiUrl: 'https://api.app.${project}.buildint.co/api/dashboard/${orgId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${token}',
      },
      params: {
        'deviceId': deviceId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static int? totalSites(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.siteDetails.out_total_sites''',
      ));
  static int? totalDevice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.siteDetails.out_total_devices''',
      ));
  static int? onlineSites(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.siteDetails.out_online_count''',
      ));
  static int? offlineSites(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.siteDetails.out_offline_count''',
      ));
  static List? locationDetails(dynamic response) => getJsonField(
        response,
        r'''$.locationDetails''',
        true,
      ) as List?;
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
