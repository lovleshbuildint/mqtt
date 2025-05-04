import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'splash_screen_model.dart';
export 'splash_screen_model.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  static String routeName = 'splashScreen';
  static String routePath = '/splashScreen';

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  late SplashScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 3000));
      _model.versionCheck = await MasterGroup.appVersionCheckCall.call();

      if ((_model.versionCheck?.succeeded ?? true)) {
        if ((_model.versionCheck?.bodyText ?? '') ==
            FFAppConstants.appVersion) {
          if ((FFAppState().token != null && FFAppState().token != '') &&
              (FFAppState().deviceId != null && FFAppState().deviceId != '')) {
            _model.userInfoRespnse = await MasterGroup.userInfoCall.call(
              token: FFAppState().token,
              deviceId: FFAppState().deviceId,
            );

            if ((_model.userInfoRespnse?.succeeded ?? true)) {
              FFAppState().fullName = getJsonField(
                (_model.userInfoRespnse?.jsonBody ?? ''),
                r'''$.user_data.fullName''',
              ).toString().toString();
              FFAppState().role = getJsonField(
                (_model.userInfoRespnse?.jsonBody ?? ''),
                r'''$.user_data.role''',
              ).toString().toString();
              FFAppState().contactNum = getJsonField(
                (_model.userInfoRespnse?.jsonBody ?? ''),
                r'''$.user_data.contact_num''',
              );
              FFAppState().userOrg = getJsonField(
                (_model.userInfoRespnse?.jsonBody ?? ''),
                r'''$.user_data.user_org''',
              );
              safeSetState(() {});

              context.goNamed(
                DashboardWidget.routeName,
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );

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

              safeSetState(() {});

              context.goNamed(LogInWidget.routeName);

              return;
            }
          } else {
            context.goNamed(
              LogInWidget.routeName,
              extra: <String, dynamic>{
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );

            return;
          }
        } else {
          var confirmDialogResponse = await showDialog<bool>(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    title: Text('Alert'),
                    content: Text(
                        'New version of SyncIoT is available. Please update to continue.'),
                    actions: [
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(alertDialogContext, false),
                        child: Text('Not Now'),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(alertDialogContext, true),
                        child: Text('Update'),
                      ),
                    ],
                  );
                },
              ) ??
              false;
          if (confirmDialogResponse) {
            await launchURL(
                'https://play.google.com/store/apps/details?id=com.buildint.syncatm');
          } else {
            Navigator.pop(context);
          }

          return;
        }
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Alert'),
              content: Text('Sorry, somthing went wrong.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        return;
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'splashScreen',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                color: Color(0xFF0C172A),
              ),
              child: FlutterFlowVideoPlayer(
                path: 'assets/videos/VN20240425_110707.mp4',
                videoType: VideoType.asset,
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 1.0,
                autoPlay: true,
                looping: false,
                showControls: false,
                allowFullScreen: true,
                allowPlaybackSpeedMenu: false,
              ),
            ),
          ),
        ));
  }
}
