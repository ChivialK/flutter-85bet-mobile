import 'package:flutter/material.dart' show Icons;
import 'package:flutter_85bet_mobile/features/router/route_list_item.dart';
import 'package:flutter_85bet_mobile/features/router/route_page.dart';
import 'package:flutter_85bet_mobile/features/themes/icon_code.dart';
import 'package:vnum/vnum.dart';

export 'package:flutter_85bet_mobile/features/router/route_list_item.dart';

@VnumDefinition
class ScreenDrawerItem extends Vnum<RouteListItem> {
  static ScreenDrawerItem home = ScreenDrawerItem.define(RouteListItem(
    iconData: IconCode.navHome,
    route: RoutePage.home,
  ));
  // static ScreenDrawerItem download = ScreenDrawerItem.define(RouteListItem(
  //   iconData: IconCode.drawerDownload,
  //   route: RoutePage.downloadArea,
  //   userOnly: true,
  // ));
  static ScreenDrawerItem tutorial = ScreenDrawerItem.define(RouteListItem(
    iconData: IconCode.drawerTutorial,
    route: RoutePage.sideTutorial,
  ));
  // static ScreenDrawerItem notice = ScreenDrawerItem.define(RouteListItem(
  //   iconData: IconCode.drawerNotice,
  //   route: RoutePage.sideNoticeBoard,
  // ));
  static ScreenDrawerItem promo = ScreenDrawerItem.define(RouteListItem(
    iconData: IconCode.navPromo,
    route: RoutePage.promo,
  ));
  // static ScreenDrawerItem wallet = ScreenDrawerItem.define(RouteListItem(
  //   iconData: IconCode.gridWallet,
  //   route: RoutePage.sideWallet,
  // ));
  static ScreenDrawerItem vip = ScreenDrawerItem.define(RouteListItem(
    iconData: IconCode.gridVip,
    route: RoutePage.sideVipLevel,
  ));
  // static ScreenDrawerItem agent = ScreenDrawerItem.define(RouteListItem(
  //   imageName: 'images/aside/85.png',
  //   route: RoutePage.agentLogin,
  // ));
  // static ScreenDrawerItem sign = ScreenDrawerItem.define(RouteListItem(
  //   routeId: RouteEnum.SIGN,
  //   iconData: IconCode.drawerEvent,
  //   userOnly: true,
  // ));
  static ScreenDrawerItem store = ScreenDrawerItem.define(RouteListItem(
    iconData: IconCode.drawerStore,
    route: RoutePage.sideStore,
  ));
  static ScreenDrawerItem roller = ScreenDrawerItem.define(RouteListItem(
    // imageName: 'images/mobile-turntable_Color1.png',
    // imageSubName: 'images/mobile-turntable.png',
    iconData: IconCode.drawerRoller,
    route: RoutePage.sideRoller,
  ));
  static ScreenDrawerItem about = ScreenDrawerItem.define(RouteListItem(
    // imageName: 'images/mobile-turntable_Color1.png',
    // imageSubName: 'images/mobile-turntable.png',
    route: RoutePage.sideAbout,
    iconData: IconCode.tabAbout,
  ));
  static ScreenDrawerItem website = ScreenDrawerItem.define(RouteListItem(
    routeId: RouteEnum.WEBSITE,
    iconData: IconCode.tabWebsite,
  ));
  static ScreenDrawerItem logout = ScreenDrawerItem.define(RouteListItem(
    routeId: RouteEnum.LOGOUT,
    iconData: IconCode.gridLogout,
    userOnly: true,
  ));
  // static ScreenDrawerItem testUI = ScreenDrawerItem.define(RouteListItem(
  //   iconData: IconCode.drawerTest,
  //   route: RoutePage.testArea,
  // ));
  // static ScreenDrawerItem test = ScreenDrawerItem.define(RouteListItem(
  //   routeId: RouteEnum.TEST,
  //   iconData: IconCode.drawerTest,
  // ));

  /// for web game screen drawer
  static ScreenDrawerItem backHome = ScreenDrawerItem.define(RouteListItem(
    routeId: RouteEnum.BACK_HOME,
    iconData: Icons.home,
    route: RoutePage.home,
  ));
  static ScreenDrawerItem rotate = ScreenDrawerItem.define(RouteListItem(
    routeId: RouteEnum.ROTATE,
    iconData: Icons.rotate_90_degrees_ccw,
  ));
  static ScreenDrawerItem rotateLock = ScreenDrawerItem.define(RouteListItem(
    routeId: RouteEnum.ROTATE_LOCK,
    iconData: Icons.crop_rotate,
  ));

  /// Used for defining cases
  const ScreenDrawerItem.define(RouteListItem fromValue)
      : super.define(fromValue);
}
