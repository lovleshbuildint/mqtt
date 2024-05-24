import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Master Group Code

class MasterGroup {
  static String getBaseUrl({
    String? token = '',
    String? deviceId = '',
  }) =>
      'https://api.app.master.buildint.co/api';
  static Map<String, String> headers = {
    'Authorization': '[token]',
  };
  static LoginCall loginCall = LoginCall();
  static RegisterDeviceCall registerDeviceCall = RegisterDeviceCall();
  static GetNotificationCall getNotificationCall = GetNotificationCall();
  static ChangeDeviceStateCall changeDeviceStateCall = ChangeDeviceStateCall();
  static GetProjectCall getProjectCall = GetProjectCall();
  static GetChecklistViewCall getChecklistViewCall = GetChecklistViewCall();
  static GetChecklistOTPCall getChecklistOTPCall = GetChecklistOTPCall();
  static CreateUserCall createUserCall = CreateUserCall();
  static UpdateUserCall updateUserCall = UpdateUserCall();
  static DeleteChecklistCall deleteChecklistCall = DeleteChecklistCall();
  static UserInfoCall userInfoCall = UserInfoCall();
  static GetUserListCall getUserListCall = GetUserListCall();
  static UpdateUserOrDeviceStateCall updateUserOrDeviceStateCall =
      UpdateUserOrDeviceStateCall();
  static DeleteUserOrDeviceCall deleteUserOrDeviceCall =
      DeleteUserOrDeviceCall();
  static AppVersionCheckCall appVersionCheckCall = AppVersionCheckCall();
  static GetAccessRoleCall getAccessRoleCall = GetAccessRoleCall();
  static GetRegionCall getRegionCall = GetRegionCall();
  static GetDashboardCall getDashboardCall = GetDashboardCall();
  static RawDataIATMCall rawDataIATMCall = RawDataIATMCall();
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
    String? token = '',
    String? deviceId = '',
  }) async {
    final baseUrl = MasterGroup.getBaseUrl(
      token: token,
      deviceId: deviceId,
    );

    final ffApiRequestBody = '''
{
    "username": "${username}",
    "password": "${password}",
    "deviceId": "${deviceId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '${baseUrl}/login',
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
    final baseUrl = MasterGroup.getBaseUrl(
      token: token,
      deviceId: deviceId,
    );

    final ffApiRequestBody = '''
{
  "username": "${username}",
  "deviceId": "${deviceId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register Device',
      apiUrl: '${baseUrl}/createDevice',
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
    final baseUrl = MasterGroup.getBaseUrl(
      token: token,
      deviceId: deviceId,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Notification',
      apiUrl: '${baseUrl}/getNotification',
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
    final baseUrl = MasterGroup.getBaseUrl(
      token: token,
      deviceId: deviceId,
    );

    final ffApiRequestBody = '''
{
  "username": "${username}",
  "newState": "${newState}",
  "deviceId": "${deviceId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Change Device State',
      apiUrl: '${baseUrl}/changeDeviceState',
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
    final baseUrl = MasterGroup.getBaseUrl(
      token: token,
      deviceId: deviceId,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Project',
      apiUrl: '${baseUrl}/getProject',
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

class GetChecklistViewCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? deviceId = '',
  }) async {
    final baseUrl = MasterGroup.getBaseUrl(
      token: token,
      deviceId: deviceId,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Checklist View',
      apiUrl: '${baseUrl}/checklistView',
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

class GetChecklistOTPCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? deviceId = '',
  }) async {
    final baseUrl = MasterGroup.getBaseUrl(
      token: token,
      deviceId: deviceId,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Checklist OTP',
      apiUrl: '${baseUrl}/checklistOtp',
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

class CreateUserCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
    String? userRole = '',
    int? userOrg,
    String? fullName = '',
    int? contactNum,
    int? userAccessRole,
    List<int>? userRegionList,
    String? token = '',
    String? deviceId = '',
  }) async {
    final baseUrl = MasterGroup.getBaseUrl(
      token: token,
      deviceId: deviceId,
    );
    final userRegion = _serializeList(userRegionList);

    final ffApiRequestBody = '''
{
  "username": "${username}",
  "password": "${password}",
  "userRole": "${userRole}",
  "fullName": "${fullName}",
  "user_org": ${userOrg},
  "deviceId": "${deviceId}",
  "contact_num": "${contactNum}",
  "user_access_role": "${userAccessRole}",
  "user_region": "${userRegion}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create User',
      apiUrl: '${baseUrl}/createUser',
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

class UpdateUserCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
    String? userRole = '',
    int? userOrg,
    String? fullName = '',
    int? contactNum,
    int? userAccessRole,
    List<int>? userRegionList,
    String? token = '',
    String? deviceId = '',
  }) async {
    final baseUrl = MasterGroup.getBaseUrl(
      token: token,
      deviceId: deviceId,
    );
    final userRegion = _serializeList(userRegionList);

    final ffApiRequestBody = '''
{
  "username": "${username}",
  "password": "${password}",
  "userRole": "${userRole}",
  "fullName": "${fullName}",
  "user_org": ${userOrg},
  "deviceId": "${deviceId}",
  "contact_num": "${contactNum}",
  "user_access_role": "${userAccessRole}",
"user_region": "${userRegion}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update User',
      apiUrl: '${baseUrl}/updateUser',
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

class DeleteChecklistCall {
  Future<ApiCallResponse> call({
    int? cId,
    String? token = '',
    String? deviceId = '',
  }) async {
    final baseUrl = MasterGroup.getBaseUrl(
      token: token,
      deviceId: deviceId,
    );

    final ffApiRequestBody = '''
{
  "deviceId": "${deviceId}",
  "c_id": "${cId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Delete Checklist',
      apiUrl: '${baseUrl}/checklistDelete',
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
    final baseUrl = MasterGroup.getBaseUrl(
      token: token,
      deviceId: deviceId,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'User Info',
      apiUrl: '${baseUrl}/getUserInfo',
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
    final baseUrl = MasterGroup.getBaseUrl(
      token: token,
      deviceId: deviceId,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get User List',
      apiUrl: '${baseUrl}/getUsersList',
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

class UpdateUserOrDeviceStateCall {
  Future<ApiCallResponse> call({
    String? username = '',
    int? newUserState,
    int? deviceState,
    String? token = '',
    String? deviceId = '',
  }) async {
    final baseUrl = MasterGroup.getBaseUrl(
      token: token,
      deviceId: deviceId,
    );

    final ffApiRequestBody = '''
{
  "username": "${username}",
  "newUserState": "${newUserState}",
  "deviceState": "${deviceState}",
  "deviceId": "${deviceId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update User or Device State',
      apiUrl: '${baseUrl}/updateUserDeviceState',
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

class DeleteUserOrDeviceCall {
  Future<ApiCallResponse> call({
    String? username = '',
    int? deleteUser,
    int? deleteDevice,
    String? token = '',
    String? deviceId = '',
  }) async {
    final baseUrl = MasterGroup.getBaseUrl(
      token: token,
      deviceId: deviceId,
    );

    final ffApiRequestBody = '''
{
  "username": "${username}",
  "deleteUser": "${deleteUser}",
  "deleteDevice": "${deleteDevice}",
  "deviceId": "${deviceId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Delete User or Device',
      apiUrl: '${baseUrl}/deleteUserDevice',
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

class AppVersionCheckCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? deviceId = '',
  }) async {
    final baseUrl = MasterGroup.getBaseUrl(
      token: token,
      deviceId: deviceId,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'App Version Check',
      apiUrl: '${baseUrl}/appVersionInfo',
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

class GetAccessRoleCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? deviceId = '',
  }) async {
    final baseUrl = MasterGroup.getBaseUrl(
      token: token,
      deviceId: deviceId,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Access Role',
      apiUrl: '${baseUrl}/getAccessRole',
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

class GetRegionCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? deviceId = '',
  }) async {
    final baseUrl = MasterGroup.getBaseUrl(
      token: token,
      deviceId: deviceId,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Region',
      apiUrl: '${baseUrl}/getRegion',
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

class GetDashboardCall {
  Future<ApiCallResponse> call({
    int? orgId,
    int? accessRoleId,
    List<int>? regionIdList,
    String? token = '',
    String? deviceId = '',
  }) async {
    final baseUrl = MasterGroup.getBaseUrl(
      token: token,
      deviceId: deviceId,
    );
    final regionId = _serializeList(regionIdList);

    final ffApiRequestBody = '''
{
  "orgId": "${orgId}",
  "accessRoleId": "${accessRoleId}",
  "regionId": "${regionId}",
  "deviceId": "${deviceId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Dashboard',
      apiUrl: '${baseUrl}/getDashboard',
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

  int? totalLocation(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.siteDetails[:].Total_Locations''',
      ));
  int? onlineLocation(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.siteDetails[:].Online_Locations''',
      ));
  int? offlineLocation(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.siteDetails[:].Offline_Locations''',
      ));
  List? locationDetails(dynamic response) => getJsonField(
        response,
        r'''$.locationDetails''',
        true,
      ) as List?;
}

class RawDataIATMCall {
  Future<ApiCallResponse> call({
    String? did = '',
    String? token = '',
    String? deviceId = '',
  }) async {
    final baseUrl = MasterGroup.getBaseUrl(
      token: token,
      deviceId: deviceId,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Raw Data iATM',
      apiUrl: '${baseUrl}/rawDataiATM/${did}',
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
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Dashboard',
      apiUrl: 'https://api.app.master.buildint.co/api/dashboard/${orgId}',
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

class GetAlertCall {
  static Future<ApiCallResponse> call({
    String? deviceId = '',
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Alert',
      apiUrl: 'https://api.app.master.buildint.co/api/getAlert',
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
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Organization',
      apiUrl: 'https://api.app.master.buildint.co/api/getOrganization',
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
    int? locId,
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Device Details',
      apiUrl: 'https://api.app.master.buildint.co/api/deviceDetails/${locId}',
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
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Device Status',
      apiUrl: 'https://api.app.master.buildint.co/api/deviceStatus/${did}',
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

class UpdateAlertsCall {
  static Future<ApiCallResponse> call({
    String? deviceId = '',
    String? token = '',
    int? alertID,
    String? assignTo = '',
    int? assignToNum,
    int? isActive,
    String? closedOn = '',
  }) async {
    final ffApiRequestBody = '''
{
  "deviceId": "${deviceId}",
  "alertID": "${alertID}",
  "assign_to": "${assignTo}",
  "assign_to_num": "${assignToNum}",
  "is_active": "${isActive}",
  "closed_on": "${closedOn}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Alerts',
      apiUrl: 'https://api.app.master.buildint.co/api/updateAlerts',
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

class PostChecklstLoginCall {
  static Future<ApiCallResponse> call({
    int? contactNum,
  }) async {
    final ffApiRequestBody = '''
{"contact_num": "${contactNum}"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Post Checklst Login',
      apiUrl: 'https://api.app.master.buildint.co/checklist/login',
      callType: ApiCallType.POST,
      headers: {},
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

class PostChecklistVerifyTokensCall {
  static Future<ApiCallResponse> call({
    int? contactNum,
    String? otp = '',
  }) async {
    final ffApiRequestBody = '''
{
  "contact_num": "${contactNum}",
  "otp": "${otp}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Post Checklist Verify Tokens',
      apiUrl: 'https://api.app.master.buildint.co/checklist/verify',
      callType: ApiCallType.POST,
      headers: {},
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

class PostRevisitChecklistMainCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    int? cId,
    int? checklistStatus,
  }) async {
    final ffApiRequestBody = '''
{
  "c_id": "${cId}",
  "checklist_status": "${checklistStatus}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Post Revisit Checklist Main',
      apiUrl: 'https://api.app.master.buildint.co/checklist/project',
      callType: ApiCallType.POST,
      headers: {
        'authorization': '${token}',
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
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
