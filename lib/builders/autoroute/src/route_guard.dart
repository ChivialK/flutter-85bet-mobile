import 'dart:async';

import '../auto_route.dart';

abstract class RouteGuard {
  Future<bool> canNavigate(
      ExtendedNavigatorState navigator, String routeName, Object arguments);
}
