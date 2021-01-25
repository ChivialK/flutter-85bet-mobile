// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_85bet_mobile/builders/autoroute/auto_route.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/features/screen/feature_screen.dart';
import 'package:flutter_85bet_mobile/features/screen/web_game_screen.dart';
import 'package:flutter_85bet_mobile/temp/test_screen.dart';
import 'package:flutter_85bet_mobile/temp/test_nested_nav_screen.dart';

abstract class ScreenRoutes {
  static const featureScreen = '/';
  static const webGameScreen = '/web-game-screen';
  static const testScreen = '/test-screen';
  static const testScreenNav = '/test-screen-nav';
  static const all = {
    featureScreen,
    webGameScreen,
    testScreen,
    testScreenNav,
  };
}

class ScreenRouter extends RouterBase {
  @override
  Set<String> get allRoutes => ScreenRoutes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<ScreenRouter>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case ScreenRoutes.featureScreen:
        return buildAdaptivePageRoute<dynamic>(
          builder: (context) => FeatureScreen(),
          settings: settings,
          maintainState: true,
        );
      case ScreenRoutes.webGameScreen:
        if (hasInvalidArgs<WebGameScreenArguments>(args)) {
          return misTypedArgsRoute<WebGameScreenArguments>(args);
        }
        final typedArgs =
            args as WebGameScreenArguments ?? WebGameScreenArguments();
        return buildAdaptivePageRoute<dynamic>(
          builder: (context) => WebGameScreen(startUrl: typedArgs.startUrl),
          settings: settings,
        );
      case ScreenRoutes.testScreen:
        return buildAdaptivePageRoute<dynamic>(
          builder: (context) => TestScreen(),
          settings: settings,
        );
      case ScreenRoutes.testScreenNav:
        return buildAdaptivePageRoute<dynamic>(
          builder: (context) => TestNestedNavScreen(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//WebGameScreen arguments holder class
class WebGameScreenArguments {
  final String startUrl;
  WebGameScreenArguments({this.startUrl = Global.CURRENT_BASE});
}

// *************************************************************************
// Navigation helper methods extension
// **************************************************************************

extension ScreenRouterNavigationHelperMethods on ExtendedNavigatorState {
  Future pushFeatureScreen() => pushNamedAndRemoveUntil(
        ScreenRoutes.featureScreen,
        (route) => false, // true => same as push, false => push and clear stack
      );

  Future pushWebGameScreen({
    String startUrl = Global.CURRENT_BASE,
  }) =>
      pushNamed(
        ScreenRoutes.webGameScreen,
        arguments: WebGameScreenArguments(startUrl: startUrl),
      );

  Future pushTestScreen() => pushNamed(ScreenRoutes.testScreen);

  Future pushTestScreenNav() => pushNamed(ScreenRoutes.testScreenNav);
}
