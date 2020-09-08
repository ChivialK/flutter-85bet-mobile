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
    id: RouteEnum.NOTICE,
    iconData: const IconData(0xf028, fontFamily: 'FontAwesome'),
    route: RoutePage.noticeBoard,
  ));
  static MoreGridItem download = MoreGridItem.define(RouteListItem(
    id: RouteEnum.DOWNLOAD,
    iconData: const IconData(0xf0ed, fontFamily: 'FontAwesome'),
    route: RoutePage.downloadArea,
  ));
  static MoreGridItem tutorial = MoreGridItem.define(RouteListItem(
    id: RouteEnum.TUTORIAL,
    iconData: const IconData(0xf059, fontFamily: 'FontAwesome'),
    route: RoutePage.tutorial,
  ));
  static MoreGridItem service = MoreGridItem.define(RouteListItem(
    id: RouteEnum.SERVICE,
    iconData: const IconData(0xf025, fontFamily: 'FontAwesome'),
    route: RoutePage.service,
  ));
  static MoreGridItem routeChange = MoreGridItem.define(RouteListItem(
    id: RouteEnum.ROUTE_CHANGE,
    iconData: const IconData(0xf1eb, fontFamily: 'FontAwesome'),
  ));
//  static MoreGridItem store = MoreGridItem.define(RouteListItem(
//    id: RouteEnum.STORE,
//    iconData: const IconData(0xf290, fontFamily: 'FontAwesome'),
//    isUserOnly: true,
//    route: RoutePage.pointStore,
//  ));
//  static MoreGridItem roller = MoreGridItem.define(RouteListItem(
//    id: RouteEnum.ROLLER,
//    imageName: 'images/moreShow_lucky.png',
//    route: RoutePage.roller,
//  ));
  static MoreGridItem task = MoreGridItem.define(RouteListItem(
    id: RouteEnum.TASK,
    imageName: 'images/moreShow_mission.png',
    isUserOnly: true,
  ));
  static MoreGridItem sign = MoreGridItem.define(RouteListItem(
    id: RouteEnum.SIGN,
    imageName: 'images/flico_sign.png?1',
    isUserOnly: true,
  ));
  static MoreGridItem agentAbout = MoreGridItem.define(RouteListItem(
    id: RouteEnum.AGENT_ABOUT,
    imageName: 'images/footer/ftico_agent.png',
    route: RoutePage.agentAbout,
  ));
  static MoreGridItem collect = MoreGridItem.define(RouteListItem(
    id: RouteEnum.COLLECT,
    imageName: Res.flico_word,
    isUserOnly: true,
  ));

  /// Used for defining cases
  const MoreGridItem.define(RouteListItem fromValue) : super.define(fromValue);

  /// Used for loading enum using value
  factory MoreGridItem(RouteListItem value) =>
      Vnum.fromValue(value, MoreGridItem);
}
