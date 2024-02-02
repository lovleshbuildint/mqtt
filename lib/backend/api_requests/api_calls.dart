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
  static AddOrCreateUserCall addOrCreateUserCall = AddOrCreateUserCall();
  static UserInfoCall userInfoCall = UserInfoCall();
  static GetUserListCall getUserListCall = GetUserListCall();
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

class AddOrCreateUserCall {
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
      callName: 'Add Or Create User',
      apiUrl: '${MasterGroup.baseUrl}/updateOrCreateUser',
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

class GetUserListCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? deviceId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get User List',
      apiUrl: '${MasterGroup.baseUrl}/getUsersList',
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

/// End Master Group Code

class DashboardCall {
  static Future<ApiCallResponse> call({
    String? deviceId = '',
    String? token = '',
    String? orgId = '',
    String? project = '',
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
  static List<String>? onlineStatus(dynamic response) => (getJsonField(
        response,
        r'''$.locationDetails[:].OnlineStatus''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? orgLogo(dynamic response) => (getJsonField(
        response,
        r'''$.locationDetails[:].OrgLogo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetOrganizationCall {
  static Future<ApiCallResponse> call({
    String? deviceId = '',
    String? token = '',
    String? project = '',
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
}

class GetDeviceDetailsCall {
  static Future<ApiCallResponse> call({
    String? deviceId = '',
    String? project = '',
    int? locId,
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Device Details',
      apiUrl:
          'https://api.app.${project}.buildint.co/api/deviceDetails/${locId}',
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

class GetDeviceStatusCall {
  static Future<ApiCallResponse> call({
    String? deviceId = '',
    String? token = '',
    String? did = '',
    String? project = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Device Status',
      apiUrl: 'https://api.app.${project}.buildint.co/api/deviceStatus/${did}',
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
