import 'package:flutter/material.dart' show IconData, Icons;
import 'package:flutter_85bet_mobile/features/router/route_list_item.dart';
import 'package:flutter_85bet_mobile/features/router/route_page.dart';
import 'package:vnum/vnum.dart';

export 'package:flutter_85bet_mobile/features/router/route_list_item.dart';

@VnumDefinition
class ScreenNavigationBarItem extends Vnum<RouteListItem> {
  static ScreenNavigationBarItem home =
      ScreenNavigationBarItem.define(RouteListItem(
    id: RouteEnum.HOME,
//    iconData: const IconData(0xf015, fontFamily: 'FontAwesome'),
    iconData: const IconData(0xe95e, fontFamily: 'IconMoon'),
    route: RoutePage.home,
  ));
  static ScreenNavigationBarItem deposit =
      ScreenNavigationBarItem.define(RouteListItem(
    id: RouteEnum.DEPOSIT,
//    iconData: const IconData(0xf09d, fontFamily: 'FontAwesome'),
    iconData: const IconData(0xe95d, fontFamily: 'IconMoon'),
    route: RoutePage.depositFeature,
    isUserOnly: true,
  ));
  static ScreenNavigationBarItem agent =
      ScreenNavigationBarItem.define(RouteListItem(
    id: RouteEnum.AGENT,
    iconData: const IconData(0xf2b5, fontFamily: 'FontAwesome'),
    route: RoutePage.agentFeature,
    isUserOnly: true,
  ));
  static ScreenNavigationBarItem promo =
      ScreenNavigationBarItem.define(RouteListItem(
    id: RouteEnum.PROMO,
    iconData: const IconData(0xf06b, fontFamily: 'FontAwesome'),
    route: RoutePage.promo,
  ));
  static ScreenNavigationBarItem service =
      ScreenNavigationBarItem.define(RouteListItem(
    id: RouteEnum.SERVICE,
//    iconData: const IconData(0xf27a, fontFamily: 'FontAwesome'),
    iconData: const IconData(0xe967, fontFamily: 'IconMoon'),
    route: RoutePage.service,
  ));
  static ScreenNavigationBarItem member =
      ScreenNavigationBarItem.define(RouteListItem(
    id: RouteEnum.MEMBER,
//    iconData: const IconData(0xf2bd, fontFamily: 'FontAwesome'),
    iconData: const IconData(0xe961, fontFamily: 'IconMoon'),
    route: RoutePage.member,
    isUserOnly: true,
  ));
  static ScreenNavigationBarItem more =
      ScreenNavigationBarItem.define(RouteListItem(
    id: RouteEnum.MORE,
    iconData: Icons.more_horiz,
  ));

  /// Used for defining cases
  const ScreenNavigationBarItem.define(RouteListItem fromValue)
      : super.define(fromValue);
}
