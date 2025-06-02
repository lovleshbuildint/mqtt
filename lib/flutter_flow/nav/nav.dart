import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => SplashScreenWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => SplashScreenWidget(),
        ),
        FFRoute(
          name: LogInWidget.routeName,
          path: LogInWidget.routePath,
          builder: (context, params) => LogInWidget(),
        ),
        FFRoute(
          name: DashboardWidget.routeName,
          path: DashboardWidget.routePath,
          builder: (context, params) => DashboardWidget(),
        ),
        FFRoute(
          name: LocationDetailsWidget.routeName,
          path: LocationDetailsWidget.routePath,
          builder: (context, params) => LocationDetailsWidget(
            locName: params.getParam(
              'locName',
              ParamType.String,
            ),
            locStatus: params.getParam(
              'locStatus',
              ParamType.String,
            ),
            locDevices: params.getParam(
              'locDevices',
              ParamType.String,
            ),
            locId: params.getParam(
              'locId',
              ParamType.int,
            ),
            locImage: params.getParam(
              'locImage',
              ParamType.String,
            ),
            branchCode: params.getParam(
              'branchCode',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ProfileWidget.routeName,
          path: ProfileWidget.routePath,
          builder: (context, params) => ProfileWidget(),
        ),
        FFRoute(
          name: CreateUserWidget.routeName,
          path: CreateUserWidget.routePath,
          builder: (context, params) => CreateUserWidget(),
        ),
        FFRoute(
          name: NotificationWidget.routeName,
          path: NotificationWidget.routePath,
          builder: (context, params) => NotificationWidget(),
        ),
        FFRoute(
          name: UserManagementWidget.routeName,
          path: UserManagementWidget.routePath,
          builder: (context, params) => UserManagementWidget(),
        ),
        FFRoute(
          name: UpdateUsersWidget.routeName,
          path: UpdateUsersWidget.routePath,
          builder: (context, params) => UpdateUsersWidget(
            fullName: params.getParam(
              'fullName',
              ParamType.String,
            ),
            username: params.getParam(
              'username',
              ParamType.String,
            ),
            userOrg: params.getParam<int>(
              'userOrg',
              ParamType.int,
              isList: true,
            ),
            userRole: params.getParam(
              'userRole',
              ParamType.String,
            ),
            userContactNum: params.getParam(
              'userContactNum',
              ParamType.int,
            ),
            userAccessRoleId: params.getParam(
              'userAccessRoleId',
              ParamType.int,
            ),
            userRegion: params.getParam<int>(
              'userRegion',
              ParamType.int,
              isList: true,
            ),
            userStateId: params.getParam<int>(
              'userStateId',
              ParamType.int,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: SplashScreenWidget.routeName,
          path: SplashScreenWidget.routePath,
          builder: (context, params) => SplashScreenWidget(),
        ),
        FFRoute(
          name: DevControlWidget.routeName,
          path: DevControlWidget.routePath,
          builder: (context, params) => DevControlWidget(
            did: params.getParam(
              'did',
              ParamType.String,
            ),
            deviceType: params.getParam(
              'deviceType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ChecklistViewWidget.routeName,
          path: ChecklistViewWidget.routePath,
          builder: (context, params) => ChecklistViewWidget(),
        ),
        FFRoute(
          name: AlertViewWidget.routeName,
          path: AlertViewWidget.routePath,
          builder: (context, params) => AlertViewWidget(
            locationIdList: params.getParam<int>(
              'locationIdList',
              ParamType.int,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: DeviceDetailsATMWidget.routeName,
          path: DeviceDetailsATMWidget.routePath,
          builder: (context, params) => DeviceDetailsATMWidget(
            did: params.getParam(
              'did',
              ParamType.String,
            ),
            onlineOfflineStatus: params.getParam(
              'onlineOfflineStatus',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: DeviceDetailsPLCWidget.routeName,
          path: DeviceDetailsPLCWidget.routePath,
          builder: (context, params) => DeviceDetailsPLCWidget(
            did: params.getParam(
              'did',
              ParamType.String,
            ),
            onlineOfflineStatus: params.getParam(
              'onlineOfflineStatus',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: LiveDataWidget.routeName,
          path: LiveDataWidget.routePath,
          builder: (context, params) => LiveDataWidget(
            did: params.getParam(
              'did',
              ParamType.String,
            ),
            deviceType: params.getParam(
              'deviceType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: AdvanceSettingsWidget.routeName,
          path: AdvanceSettingsWidget.routePath,
          builder: (context, params) => AdvanceSettingsWidget(
            macId: params.getParam(
              'macId',
              ParamType.String,
            ),
            deviceType: params.getParam(
              'deviceType',
              ParamType.String,
            ),
            iATMDID: params.getParam(
              'iATMDID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CheckDataWidget.routeName,
          path: CheckDataWidget.routePath,
          builder: (context, params) => CheckDataWidget(
            did: params.getParam(
              'did',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: TaWidget.routeName,
          path: TaWidget.routePath,
          builder: (context, params) => TaWidget(),
        ),
        FFRoute(
          name: DeviceDetailsSurveillanceWidget.routeName,
          path: DeviceDetailsSurveillanceWidget.routePath,
          builder: (context, params) => DeviceDetailsSurveillanceWidget(
            did: params.getParam(
              'did',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: DeviceDetailsNeonWidget.routeName,
          path: DeviceDetailsNeonWidget.routePath,
          builder: (context, params) => DeviceDetailsNeonWidget(
            did: params.getParam(
              'did',
              ParamType.String,
            ),
            onlineOfflineStatus: params.getParam(
              'onlineOfflineStatus',
              ParamType.String,
            ),
            deviceName: params.getParam(
              'deviceName',
              ParamType.String,
            ),
            mqttTopic: params.getParam(
              'mqttTopic',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: DeviceDetailsATMBuildintWidget.routeName,
          path: DeviceDetailsATMBuildintWidget.routePath,
          builder: (context, params) => DeviceDetailsATMBuildintWidget(
            did: params.getParam(
              'did',
              ParamType.String,
            ),
            onlineOfflineStatus: params.getParam(
              'onlineOfflineStatus',
              ParamType.String,
            ),
            macID: params.getParam(
              'macID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: BSiATMRelaySettingsWidget.routeName,
          path: BSiATMRelaySettingsWidget.routePath,
          builder: (context, params) => BSiATMRelaySettingsWidget(
            did: params.getParam(
              'did',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: FirmwareManagementWidget.routeName,
          path: FirmwareManagementWidget.routePath,
          builder: (context, params) => FirmwareManagementWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
