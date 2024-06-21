import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future userInfoUpdate(BuildContext context) async {
  ApiCallResponse? userInfoRespnse;

  userInfoRespnse = await MasterGroup.userInfoCall.call(
    token: FFAppState().token,
    deviceId: FFAppState().deviceId,
  );

  if ((userInfoRespnse?.succeeded ?? true)) {
    FFAppState().fullName = getJsonField(
      (userInfoRespnse?.jsonBody ?? ''),
      r'''$.user_data.fullName''',
    ).toString().toString();
    FFAppState().role = getJsonField(
      (userInfoRespnse?.jsonBody ?? ''),
      r'''$.user_data.role''',
    ).toString().toString();
    FFAppState().contactNum = getJsonField(
      (userInfoRespnse?.jsonBody ?? ''),
      r'''$.user_data.contact_num''',
    );
    FFAppState().accessRoleId = getJsonField(
      (userInfoRespnse?.jsonBody ?? ''),
      r'''$.user_data.user_access_role''',
    );
    FFAppState().regionId = getJsonField(
      (userInfoRespnse?.jsonBody ?? ''),
      r'''$.user_data.user_region''',
      true,
    )!
        .toList()
        .cast<int>();
    FFAppState().userOrg = getJsonField(
      (userInfoRespnse?.jsonBody ?? ''),
      r'''$.user_data.user_org''',
    );
    FFAppState().update(() {});
    return;
  } else {
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text(
              'Unauthorized access or your device is not registered. Try login again'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
    FFAppState().deleteToken();
    FFAppState().token = '';

    FFAppState().update(() {});

    context.goNamed('LogIn');

    return;
  }
}
