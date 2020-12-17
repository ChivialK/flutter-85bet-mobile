import 'package:flutter_85bet_mobile/builders/autoroute/auto_route_annotations.dart';
import 'package:flutter_85bet_mobile/temp/test_home_size_calc.dart';
import 'package:flutter_85bet_mobile/temp/test_input_route.dart';
import 'package:flutter_85bet_mobile/temp/test_nested_nav_screen_view.dart';
import 'package:flutter_85bet_mobile/temp/test_permission_screen.dart';

@CupertinoAutoRouter(routesClassName: 'TestRoutes')
class $TestRouter {
  TestNestedNavScreenView testScreenInnerView;
  TestPermissionScreen testPermissionScreen;
  TestInputRoute testInputRoute;
  TestHomeSizeCalc testHomeSizeCalc;
}
