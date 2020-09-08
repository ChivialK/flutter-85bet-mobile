import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter_85bet_mobile/temp/test_nested_nav_screen.dart';
import 'package:flutter_85bet_mobile/temp/test_screen.dart';

import '../screen/feature_screen.dart';
import '../screen/web_game_screen.dart';

@AdaptiveAutoRouter(
  generateNavigationHelperExtension: true,
  routesClassName: 'ScreenRoutes',
)
class $ScreenRouter {
  @AdaptiveRoute(initial: true, maintainState: true)
  FeatureScreen featureScreen;

  WebGameScreen webGameScreen;
  TestScreen testScreen;
  TestNestedNavScreen testScreenNav;
}

enum ScreenEnum { Feature, Game, Test, TestNav }
