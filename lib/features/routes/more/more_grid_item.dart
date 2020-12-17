import 'package:flutter/widgets.dart' show IconData;
import 'package:flutter_85bet_mobile/features/router/route_list_item.dart';
import 'package:flutter_85bet_mobile/features/router/route_page.dart';
import 'package:flutter_85bet_mobile/res.dart';
import 'package:vnum/vnum.dart';

export 'package:flutter_85bet_mobile/features/router/route_list_item.dart';

@VnumDefinition
class MoreGridItem extends Vnum<RouteListItem> {
  /// Case Definition
  static MoreGridItem notice = MoreGridItem.define(RouteListItem(
    iconData: const IconData(0xf028, fontFamily: 'FontAwesome'),
    route: RoutePage.noticeBoard,
  ));
  static MoreGridItem download = MoreGridItem.define(RouteListItem(
    iconData: const IconData(0xf0ed, fontFamily: 'FontAwesome'),
    route: RoutePage.sideDownload,
  ));
  static MoreGridItem tutorial = MoreGridItem.define(RouteListItem(
    iconData: const IconData(0xf059, fontFamily: 'FontAwesome'),
    route: RoutePage.sideTutorial,
  ));
  static MoreGridItem service = MoreGridItem.define(RouteListItem(
    iconData: const IconData(0xf025, fontFamily: 'FontAwesome'),
    route: RoutePage.service,
  ));
  static MoreGridItem routeChange = MoreGridItem.define(RouteListItem(
    routeId: RouteEnum.ROUTE_CHANGE,
    iconData: const IconData(0xf1eb, fontFamily: 'FontAwesome'),
  ));

//  static MoreGridItem store = MoreGridItem.define(RouteListItem(
//    iconData: const IconData(0xf290, fontFamily: 'FontAwesome'),
//    route: RoutePage.pointStore,
//    userOnly: true,
//  ));
//  static MoreGridItem roller = MoreGridItem.define(RouteListItem(
//    imageName: 'images/moreShow_lucky.png',
//    route: RoutePage.roller,
//  ));
  static MoreGridItem task = MoreGridItem.define(RouteListItem(
    routeId: RouteEnum.TASK,
    imageName: 'images/moreShow_mission.png',
    userOnly: true,
  ));
  static MoreGridItem sign = MoreGridItem.define(RouteListItem(
    routeId: RouteEnum.SIGN,
    imageName: 'images/flico_sign.png?1',
    userOnly: true,
  ));
  static MoreGridItem agentAbout = MoreGridItem.define(RouteListItem(
    routeId: RouteEnum.AGENT_ABOUT,
    imageName: 'images/footer/ftico_agent.png',
    route: RoutePage.moreAgentAbout,
  ));
  static MoreGridItem collect = MoreGridItem.define(RouteListItem(
    routeId: RouteEnum.COLLECT,
    imageName: Res.flico_word,
    userOnly: true,
  ));

  /// Used for defining cases
  const MoreGridItem.define(RouteListItem fromValue) : super.define(fromValue);

  /// Used for loading enum using value
  factory MoreGridItem(RouteListItem value) =>
      Vnum.fromValue(value, MoreGridItem);
}
