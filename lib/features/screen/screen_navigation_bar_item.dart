import 'package:flutter_85bet_mobile/features/router/route_list_item.dart';
import 'package:flutter_85bet_mobile/features/router/route_page.dart';
import 'package:vnum/vnum.dart';

export 'package:flutter_85bet_mobile/features/router/route_list_item.dart';

@VnumDefinition
class ScreenNavigationBarItem extends Vnum<RouteListItem> {
  static ScreenNavigationBarItem home =
      ScreenNavigationBarItem.define(RouteListItem(
    imageName: 'images/footer_logo1.jpg',
    // iconData: IconCode.navHome,
    route: RoutePage.home,
  ));
  static ScreenNavigationBarItem deposit =
      ScreenNavigationBarItem.define(RouteListItem(
    imageName: 'images/footer_logo2.jpg',
    // iconData: IconCode.navDeposit,
    route: RoutePage.depositFeature,
  ));
  // static ScreenNavigationBarItem agent =
  //     ScreenNavigationBarItem.define(RouteListItem(
  //   iconData: IconCode.navAgent,
  //   route: RoutePage.agentLogin,
  // ));
  // static ScreenNavigationBarItem promo =
  //     ScreenNavigationBarItem.define(RouteListItem(
  //   // iconData: IconCode.navPromo,
  //   route: RoutePage.promo,
  // ));
  static ScreenNavigationBarItem service =
      ScreenNavigationBarItem.define(RouteListItem(
    imageName: 'images/footer_logo4.gif',
    // iconData: IconCode.navService,
    route: RoutePage.service,
  ));
  static ScreenNavigationBarItem member =
      ScreenNavigationBarItem.define(RouteListItem(
    imageName: 'images/footer_logo3.jpg',
    // iconData: IconCode.navMember,
    route: RoutePage.member,
  ));
  // static ScreenNavigationBarItem more =
  //     ScreenNavigationBarItem.define(RouteListItem(
  //   id: RouteEnum.MORE,
  //   iconData: IconCode.navMore,
  // ));

  /// Used for defining cases
  const ScreenNavigationBarItem.define(RouteListItem fromValue)
      : super.define(fromValue);
}
