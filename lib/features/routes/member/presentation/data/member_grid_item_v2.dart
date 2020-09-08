import 'package:flutter_85bet_mobile/features/router/route_list_item.dart';
import 'package:flutter_85bet_mobile/features/router/route_page.dart';
import 'package:vnum/vnum.dart';

export 'package:flutter_85bet_mobile/features/router/route_list_item.dart';

@VnumDefinition
class MemberGridItemV2 extends Vnum<RouteListItem> {
  static MemberGridItemV2 deposit = MemberGridItemV2.define(RouteListItem(
    id: RouteEnum.DEPOSIT,
    imageName: 'images/user/macico_dsp.png',
    route: RoutePage.deposit,
    isUserOnly: true,
  ));
  static MemberGridItemV2 transfer = MemberGridItemV2.define(RouteListItem(
    id: RouteEnum.TRANSFER,
    imageName: 'images/user/macico_tsf.png',
    route: RoutePage.transfer,
    isUserOnly: true,
  ));
  static MemberGridItemV2 bankcard = MemberGridItemV2.define(RouteListItem(
    id: RouteEnum.BANKCARD,
    imageName: 'images/user/macico_bkcard.png',
    route: RoutePage.bankcard,
    isUserOnly: true,
  ));
  static MemberGridItemV2 withdraw = MemberGridItemV2.define(RouteListItem(
    id: RouteEnum.WITHDRAW,
    imageName: 'images/user/macico_wdl.png',
    route: RoutePage.withdraw,
    isUserOnly: true,
  ));
  static MemberGridItemV2 balance = MemberGridItemV2.define(RouteListItem(
    id: RouteEnum.BALANCE,
    imageName: 'images/user/macico_plaf.png',
    route: RoutePage.balance,
    isUserOnly: true,
  ));
  static MemberGridItemV2 wallet = MemberGridItemV2.define(RouteListItem(
    id: RouteEnum.WALLET,
    imageName: 'images/user/macico_tsfwa.png',
    route: RoutePage.wallet,
    isUserOnly: true,
  ));
  static MemberGridItemV2 stationMessages =
      MemberGridItemV2.define(RouteListItem(
    id: RouteEnum.MESSAGE,
    imageName: 'images/user/macico_msg.png',
    route: RoutePage.message,
    isUserOnly: true,
  ));
  static MemberGridItemV2 accountCenter = MemberGridItemV2.define(RouteListItem(
    id: RouteEnum.CENTER,
    imageName: 'images/user/macico_cent.png',
    route: RoutePage.center,
    isUserOnly: true,
  ));
  static MemberGridItemV2 transferRecord =
      MemberGridItemV2.define(RouteListItem(
    id: RouteEnum.TRANSFER_RECORD,
    imageName: 'images/user/macico_tsfre.png',
    route: RoutePage.transaction,
    isUserOnly: true,
  ));
  static MemberGridItemV2 betRecord = MemberGridItemV2.define(RouteListItem(
    id: RouteEnum.BETS,
    imageName: 'images/user/macico_bthis.png',
    route: RoutePage.betRecord,
    isUserOnly: true,
  ));
  static MemberGridItemV2 dealRecord = MemberGridItemV2.define(RouteListItem(
    id: RouteEnum.DEALS,
    imageName: 'images/user/macico_trans.png',
    route: RoutePage.deals,
    isUserOnly: true,
  ));
  static MemberGridItemV2 flowRecord = MemberGridItemV2.define(RouteListItem(
    id: RouteEnum.FLOW,
    imageName: 'images/user/macico_rolb.png',
    route: RoutePage.flows,
    isUserOnly: true,
  ));
  static MemberGridItemV2 agent = MemberGridItemV2.define(RouteListItem(
    id: RouteEnum.AGENT,
    imageName: 'images/user/macico_agent.png',
    route: RoutePage.agent,
    isUserOnly: true,
  ));
  static MemberGridItemV2 logout = MemberGridItemV2.define(RouteListItem(
    id: RouteEnum.LOGOUT,
    imageName: 'images/user/macico_logout.png',
    isUserOnly: true,
  ));

  /// Used for defining cases
  const MemberGridItemV2.define(RouteListItem fromValue)
      : super.define(fromValue);

  /// Used for loading enum using value
  factory MemberGridItemV2(RouteListItem value) =>
      Vnum.fromValue(value, MemberGridItemV2);
}
