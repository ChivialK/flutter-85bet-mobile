import 'dart:async' show StreamController;

import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter_85bet_mobile/builders/autoroute/auto_route.dart';
import 'package:flutter_85bet_mobile/core/internal/orientation_helper.dart';
import 'package:flutter_85bet_mobile/mylogger.dart';
import 'package:flutter_85bet_mobile/utils/platform_util.dart';

import 'app_global_streams.dart';
import 'route_info.dart';
import 'route_page.dart';
import 'router.gr.dart';
import 'screen_router.dart' show ScreenEnum;
import 'screen_router.gr.dart';

export 'route_info.dart';
export 'route_page.dart';
export 'router.gr.dart';
export 'screen_router.dart' show ScreenEnum;
export 'screen_router.gr.dart';

///
/// Main Screen Navigation
///
class ScreenNavigate {
  static final String _tag = 'ScreenNavigate';
  static int screenIndex = 0;

  static ExtendedNavigatorState get screenNavigator =>
      ExtendedNavigator.ofRouter<ScreenRouter>();

  /// Switch to different screen, default is [ScreenRouter.featureScreen]
  /// Calls app restart if switch screen failed (UI will freeze).
  /// [web] = true, will open a fullscreen web page, use [webUrl] to pass the url.
  /// [force] = true, clean stack and push [ScreenRouter.featureScreen]
  static switchScreen({
    bool force = false,
    ScreenEnum screen,
    Object webUrl,
  }) {
    if (force) {
      // Router's failed safe
      MyLogger.warn(
        msg: 'force screen to switch, current screen: $screenIndex',
        tag: _tag,
      );
      try {
        if (screenIndex == 0)
          RouterNavigate.navigateClean();
        else if (screenNavigator.canPop())
          screenNavigator.popUntil(
              (route) => route.settings.name == ScreenRoutes.featureScreen);
        else
          screenNavigator.pushFeatureScreen();
        screenIndex = 0;
      } catch (e) {
        MyLogger.error(
          msg: 'force screen to switch has exception, restarting app!!',
          error: e,
          tag: _tag,
        );
        // restart app
        Future.delayed(
            Duration(milliseconds: 200), () => PlatformUtil.restart());
      }
    } else {
      try {
        switch (screen) {
          case ScreenEnum.Game:
            screenNavigator.pushWebGameScreen(startUrl: webUrl);
            // to hide only bottom bar:
            //        SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
            // to hide only status bar:
            //        SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
            // to hide both:
            OrientationHelper.disabledSystemUIOverlays();
            screenIndex = 1;
            break;
          case ScreenEnum.Test:
            screenNavigator.pushTestScreen();
            screenIndex = 2;
            break;
          case ScreenEnum.TestNav:
            screenNavigator.pushTestScreenNav();
            screenIndex = 2;
            break;
          case ScreenEnum.Feature:
          default:
            debugPrint('can pop screen: ${screenNavigator.canPop()}');
            if (screenNavigator.canPop())
              screenNavigator.pop();
            else
              screenNavigator.pushFeatureScreen();
            screenIndex = 0;
            break;
        }
        MyLogger.print(
          msg: 'switch screen to $screen, index: $screenIndex',
          tag: _tag,
        );
      } catch (e) {
        MyLogger.error(
          msg: 'switch screen to $screen has exception!!',
          error: e,
          tag: _tag,
        );
        switchScreen(force: true);
      }
    }
    if (screenIndex != 1) {
      debugPrint('restoring screen orientation...');
      OrientationHelper.restoreUI();
    }
  }
}

///
/// Feature Router Action class to switch between routes
///
class RouterNavigate {
  static final String _tag = 'RouterNavigate';
  static final routerStreams = getAppGlobalStreams;
  static final homeName = Routes.homeRoute;
  static final refreshList = [
    Routes.depositRoute,
    Routes.transferRoute,
    Routes.balanceRoute,
    Routes.walletRoute,
    Routes.messageRoute
  ];

  static int screenIndex = 0;
  static String _current = homeName;
  static String _previous = homeName;
  static bool _isWeb = false;

  static String get current => _current;
  static bool get isAtHome => _current == homeName;
  static bool get isWebRoute => _isWeb;

  static StreamController<RouteInfo> _routeInfo =
      StreamController<RouteInfo>.broadcast();

  static Stream<RouteInfo> get routeStream => _routeInfo.stream;

  static dispose() {
    MyLogger.warn(msg: 'disposing router stream!!', tag: _tag);
    _routeInfo.close();
  }

  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<FeatureRouter>();

  /// Navigate to [page], and clean the stack if route is declared feature
  /// use [arg] to pass [page]'s arguments.
  static navigateToPage(RoutePage page, {Object arg}) {
    if (page.pageName == _current) {
      MyLogger.info(
          msg: 'should be on the same page. '
              'current: $_current, request: ${page.pageName}',
          tag: _tag);
      return;
    }
    if (page.pageName == Routes.homeRoute) {
      navigateClean();
      return;
    }
    try {
      if ((_current != Routes.homeRoute && page.hasBottomNav)) {
        debugPrint('navigate feature, from:$_current to:${page.pageName}');
        navigator.pushNamedAndRemoveUntil(
          page.pageName,
          (route) =>
              route.settings.name == page.pageName ||
              route.settings.name == Routes.homeRoute,
          arguments: arg ?? page.value.routeArg,
        );
        _setPath(page.pageName,
            parentRoute: (page.hasBottomNav || current != Routes.memberRoute)
                ? page.pageRoot
                : current);
      } else {
        debugPrint('navigate page, from:$_current to:${page.pageName}');
        navigator.pushNamed(page.pageName,
            arguments: arg ?? page.value.routeArg);
        _setPath(page.pageName);
      }
    } catch (e) {
      MyLogger.error(
          msg:
              'navigate to page has exception!! Router current: $_current, previous: $_previous',
          error: e,
          tag: _tag);
    }
    _routeInfo.sink.add(page.value);
  }

  static replacePage(RoutePage page, {Object arg}) {
    try {
      debugPrint('replacing page, '
          'from:$_current to:${page.pageName}, '
          'arg: ${arg ?? page.value.routeArg}');

      if (_previous != '/') {
        navigator.pushReplacementNamed(page.pageName,
            arguments: arg ?? page.value.routeArg);
      } else {
        navigateToPage(page, arg: arg);
      }

      _setPath(page.pageName,
          parentRoute: (page.hasBottomNav || current != Routes.memberRoute)
              ? page.pageRoot
              : current);
    } catch (e) {
      MyLogger.warn(
          msg: 'replace page has exception!! '
              'Router current: $_current, previous: $_previous',
          error: e,
          tag: _tag);

      navigateClean();
      navigateToPage(page, arg: arg ?? page.value.routeArg);
    }
    _routeInfo.sink.add(page.value);
  }

  /// Pop the current page
  /// if pop action fails, will attempt to return to home screen.
  static navigateBack() async {
    bool isFeature;
    try {
      isFeature = _current.toRoutePage.hasBottomNav;
    } catch (e) {
      isFeature = false;
    }
    debugPrint('navigate back, current:$_current, previous: $_previous, '
        'canPop: ${navigator.canPop()}, isFeature: $isFeature');

    var page = _previous.toRoutePage;
    try {
      if (ScreenNavigate.screenIndex != 0) {
        ScreenNavigate.switchScreen();
      } else if (_previous == Routes.homeRoute) {
        navigateClean();
        return;
      } else if (isFeature) {
        navigateToPage(_previous.toRoutePage);
        return;
      } else if (navigator.canPop()) {
        try {
          if (_previous == Routes.memberRoute &&
              refreshList.contains(_current)) {
            // update member route credit and badge
            routerStreams.setCheck(true);
          }
          navigator.popUntil((route) => route.settings.name == _previous);
        } catch (e) {
          navigator.popAndPushNamed(_previous, arguments: page.value.routeArg);
        }
      }
    } catch (e) {
      MyLogger.error(
        msg: 'navigate back has exception!! '
            'Router current: $_current, previous: $_previous',
        error: e,
        tag: _tag,
      );
      // switch to home screen
      ScreenNavigate.switchScreen(force: true);
    }

    _setPath(page.pageName, parentRoute: page.pageRoot);
    _routeInfo.sink.add(page.value);
  }

  /// Navigate to [Router.homeRoute] and clean the stack
  static navigateClean({bool force = false}) {
    debugPrint('navigate to home, from:$_current');
    try {
      if (force && _current == Routes.homeRoute) {
        navigator.pushReplacementNamed(Routes.homeRoute);
      } else if (_current != Routes.homeRoute) {
        navigator.pushNamedAndRemoveUntil(
          Routes.homeRoute,
          (route) => false,
        );
      }
      routerStreams.setCheck(true);
    } catch (e) {
      MyLogger.error(
          msg: 'navigate clean has exception!! '
              'Router current: $_current, '
              'previous: $_previous',
          error: e,
          tag: _tag);
    }
    _setPath(Routes.homeRoute, parentRoute: Routes.homeRoute);
//    debugPrint('update home app bar on clean');
    _routeInfo.sink.add(RoutePage.home.value);
  }

  static updateRoute(RoutePage page) {
    _routeInfo.sink.add(page.value);
  }

  static _setPath(String route, {String parentRoute = ''}) {
    _previous = parentRoute.isEmpty ? _current : parentRoute;
    _current = route;
    debugPrint('set navigate path, current:$_current, previous: $_previous');
  }

  static resetCheckUser() => routerStreams.setCheck(false);

  static testNavigate(RoutePage page) {
    debugPrint('test navigate...page: ${page.value}');
    _setPath(page.pageName, parentRoute: page.pageRoot);
    _routeInfo.sink.add(page.value);
  }
}
