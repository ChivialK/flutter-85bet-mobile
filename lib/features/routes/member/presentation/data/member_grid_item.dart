import 'package:flutter/widgets.dart';
import 'package:flutter_85bet_mobile/features/router/route_page.dart';
import 'package:vnum/vnum.dart';

import 'member_grid_data.dart';

export 'member_grid_data.dart' show MemberGridDataExtension;

@VnumDefinition
class MemberGridItem extends Vnum<MemberGridData> {
  static MemberGridItem deposit = MemberGridItem.define(MemberGridData(
    id: RouteEnum.DEPOSIT,
//    iconData: const IconData(0xf1c0, fontFamily: 'FontAwesome'),
    iconData: const IconData(0xe95e, fontFamily: 'IconMoon'),
    route: RoutePage.deposit,
  ));
  static MemberGridItem transfer = MemberGridItem.define(MemberGridData(
    id: RouteEnum.TRANSFER,
//    iconData: const IconData(0xf079, fontFamily: 'FontAwesome'),
    iconData: const IconData(0xe96c, fontFamily: 'IconMoon'),
    route: RoutePage.transfer,
  ));
  static MemberGridItem bankcard = MemberGridItem.define(MemberGridData(
    id: RouteEnum.BANKCARD,
//    iconData: const IconData(0xf09d, fontFamily: 'FontAwesome'),
    iconData: const IconData(0xe95a, fontFamily: 'IconMoon'),
    route: RoutePage.bankcard,
  ));
  static MemberGridItem withdraw = MemberGridItem.define(MemberGridData(
    id: RouteEnum.WITHDRAW,
//    iconData: const IconData(0xf155, fontFamily: 'FontAwesome'),
    iconData: const IconData(0xe96f, fontFamily: 'IconMoon'),
    route: RoutePage.withdraw,
  ));
  static MemberGridItem balance = MemberGridItem.define(MemberGridData(
    id: RouteEnum.BALANCE,
//    iconData: const IconData(0xf03a, fontFamily: 'FontAwesome'),
    iconData: const IconData(0xe965, fontFamily: 'IconMoon'),
    route: RoutePage.balance,
  ));
  static MemberGridItem wallet = MemberGridItem.define(MemberGridData(
    id: RouteEnum.WALLET,
//    iconData: const IconData(0xf155, fontFamily: 'FontAwesome'),
    iconData: const IconData(0xe964, fontFamily: 'IconMoon'),
    route: RoutePage.wallet,
  ));
  static MemberGridItem stationMessages = MemberGridItem.define(MemberGridData(
    id: RouteEnum.MESSAGE,
//    iconData: const IconData(0xf0e0, fontFamily: 'FontAwesome'),
    iconData: const IconData(0xe969, fontFamily: 'IconMoon'),
    route: RoutePage.message,
  ));
  static MemberGridItem accountCenter = MemberGridItem.define(MemberGridData(
    id: RouteEnum.CENTER,
//    iconData: const IconData(0xf2b9, fontFamily: 'FontAwesome'),
    iconData: const IconData(0xe95d, fontFamily: 'IconMoon'),
    route: RoutePage.center,
  ));
  static MemberGridItem transferRecord = MemberGridItem.define(MemberGridData(
    id: RouteEnum.TRANSFER_RECORD,
//    iconData: const IconData(0xf0ca, fontFamily: 'FontAwesome'),
    iconData: const IconData(0xe96d, fontFamily: 'IconMoon'),
    route: RoutePage.transaction,
  ));
  static MemberGridItem betRecord = MemberGridItem.define(MemberGridData(
    id: RouteEnum.BETS,
//    iconData: const IconData(0xf1cd, fontFamily: 'FontAwesome'),
    iconData: const IconData(0xe95b, fontFamily: 'IconMoon'),
    route: RoutePage.betRecord,
  ));
  static MemberGridItem dealRecord = MemberGridItem.define(MemberGridData(
    id: RouteEnum.DEALS,
//    iconData: const IconData(0xf0cb, fontFamily: 'FontAwesome'),
    iconData: const IconData(0xe96b, fontFamily: 'IconMoon'),
    route: RoutePage.deals,
  ));
  static MemberGridItem flowRecord = MemberGridItem.define(MemberGridData(
    id: RouteEnum.FLOW,
//    iconData: const IconData(0xf06d, fontFamily: 'FontAwesome'),
    iconData: const IconData(0xe95c, fontFamily: 'IconMoon'),
    route: RoutePage.flows,
  ));

  /// Optional
  static MemberGridItem agent = MemberGridItem.define(MemberGridData(
    id: RouteEnum.AGENT,
    iconData: const IconData(0xf2ba, fontFamily: 'FontAwesome'),
    route: RoutePage.agent,
  ));
  static MemberGridItem vip = MemberGridItem.define(MemberGridData(
    id: RouteEnum.VIP,
//    iconData: const IconData(0xf219, fontFamily: 'FontAwesome'),
    iconData: const IconData(0xe96e, fontFamily: 'IconMoon'),
    route: RoutePage.vipLevel,
  ));
  static MemberGridItem notice = MemberGridItem.define(MemberGridData(
    id: RouteEnum.NOTICE,
//    iconData: const IconData(0xf028, fontFamily: 'FontAwesome'),
    iconData: const IconData(0xe967, fontFamily: 'IconMoon'),
    route: RoutePage.noticeBoard,
  ));

  /// No Route
  static MemberGridItem logout = MemberGridItem.define(MemberGridData(
    id: RouteEnum.LOGOUT,
    iconData: const IconData(0xf08b, fontFamily: 'FontAwesome'),
  ));
  static MemberGridItem password = MemberGridItem.define(MemberGridData(
    id: RouteEnum.PASSWORD,
//    iconData: const IconData(0xf023, fontFamily: 'FontAwesome'),
    iconData: const IconData(0xe95d, fontFamily: 'IconMoon'),
  ));
  static MemberGridItem register = MemberGridItem.define(MemberGridData(
    id: RouteEnum.REGISTER,
//    iconData: const IconData(0xf0c0, fontFamily: 'FontAwesome'),
    iconData: const IconData(0xe95d, fontFamily: 'IconMoon'),
  ));

  /// Used for defining cases
  const MemberGridItem.define(MemberGridData fromValue)
      : super.define(fromValue);
}
