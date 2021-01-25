import 'package:flutter_85bet_mobile/core/internal/hex_color.dart';
import 'package:flutter_85bet_mobile/features/router/route_page.dart';
import 'package:flutter_85bet_mobile/features/themes/icon_code.dart';
import 'package:vnum/vnum.dart';

import 'member_grid_data.dart';

export 'member_grid_data.dart' show MemberGridDataExtension;

@VnumDefinition
class MemberGridItemLinear extends Vnum<MemberGridData> {
  static MemberGridItemLinear deposit =
      MemberGridItemLinear.define(MemberGridData(
    id: RouteEnum.DEPOSIT,
    iconData: IconCode.gridDeposit,
    iconDecorColorStart: HexColor.fromHex('#ffb468'),
    iconDecorColorEnd: HexColor.fromHex('#f36500'),
    route: RoutePage.deposit,
  ));
  static MemberGridItemLinear transfer =
      MemberGridItemLinear.define(MemberGridData(
    id: RouteEnum.TRANSFER,
    iconData: IconCode.gridTransfer,
    iconDecorColorStart: HexColor.fromHex('#6ede52'),
    iconDecorColorEnd: HexColor.fromHex('#32a063'),
    route: RoutePage.transfer,
  ));
  static MemberGridItemLinear bankcard =
      MemberGridItemLinear.define(MemberGridData(
    id: RouteEnum.BANKCARD,
    iconData: IconCode.gridBankcard,
    iconDecorColorStart: HexColor.fromHex('#7bdefb'),
    iconDecorColorEnd: HexColor.fromHex('#0082ce'),
    route: RoutePage.bankcard,
  ));
  static MemberGridItemLinear withdraw =
      MemberGridItemLinear.define(MemberGridData(
    id: RouteEnum.WITHDRAW,
    iconData: IconCode.gridWithdraw,
    iconDecorColorStart: HexColor.fromHex('#7294f5'),
    iconDecorColorEnd: HexColor.fromHex('#3054bb'),
    route: RoutePage.withdraw,
  ));
  static MemberGridItemLinear balance =
      MemberGridItemLinear.define(MemberGridData(
    id: RouteEnum.DEPOSIT,
    iconData: IconCode.gridBalance,
    iconDecorColorStart: HexColor.fromHex('#ff88f0'),
    iconDecorColorEnd: HexColor.fromHex('#ad2087'),
    route: RoutePage.balance,
  ));
  static MemberGridItemLinear wallet =
      MemberGridItemLinear.define(MemberGridData(
    id: RouteEnum.WALLET,
    iconData: IconCode.gridWallet,
    iconDecorColorStart: HexColor.fromHex('#3df3c0'),
    iconDecorColorEnd: HexColor.fromHex('#119c8f'),
    route: RoutePage.wallet,
  ));
  static MemberGridItemLinear stationMessages =
      MemberGridItemLinear.define(MemberGridData(
    id: RouteEnum.MESSAGE,
    iconData: IconCode.gridMessage,
    iconDecorColorStart: HexColor.fromHex('#d265ff'),
    iconDecorColorEnd: HexColor.fromHex('#7c2fad'),
    route: RoutePage.message,
  ));
  static MemberGridItemLinear accountCenter =
      MemberGridItemLinear.define(MemberGridData(
    id: RouteEnum.CENTER,
    iconData: IconCode.gridCenter,
    iconDecorColorStart: HexColor.fromHex('#e65757'),
    iconDecorColorEnd: HexColor.fromHex('#ce0909'),
    route: RoutePage.center,
  ));
  static MemberGridItemLinear transferRecord =
      MemberGridItemLinear.define(MemberGridData(
    id: RouteEnum.TRANSFER_RECORD,
    iconData: IconCode.gridTransactions,
    iconDecorColorStart: HexColor.fromHex('#f1dd98'),
    iconDecorColorEnd: HexColor.fromHex('#9c7407'),
    route: RoutePage.transaction,
  ));
  static MemberGridItemLinear betRecord =
      MemberGridItemLinear.define(MemberGridData(
    id: RouteEnum.BETS,
    iconData: IconCode.gridBets,
    iconDecorColorStart: HexColor.fromHex('#33c8ff'),
    iconDecorColorEnd: HexColor.fromHex('#185cc3'),
    route: RoutePage.betRecord,
  ));
  static MemberGridItemLinear dealRecord =
      MemberGridItemLinear.define(MemberGridData(
    id: RouteEnum.DEALS,
    iconData: IconCode.gridDeals,
    iconDecorColorStart: HexColor.fromHex('#c8de59'),
    iconDecorColorEnd: HexColor.fromHex('#7c9c1f'),
    route: RoutePage.deals,
  ));
  static MemberGridItemLinear flowRecord =
      MemberGridItemLinear.define(MemberGridData(
    id: RouteEnum.ROLLBACK,
    iconData: IconCode.gridFlows,
    iconDecorColorStart: HexColor.fromHex('#ed6b72'),
    iconDecorColorEnd: HexColor.fromHex('#b72541'),
    route: RoutePage.rollback,
  ));
  static MemberGridItemLinear vip = MemberGridItemLinear.define(MemberGridData(
    id: RouteEnum.VIP,
    iconData: IconCode.gridVip,
    iconDecorColorStart: HexColor.fromHex('#e68f63'),
    iconDecorColorEnd: HexColor.fromHex('#a75433'),
    route: RoutePage.vipLevel,
  ));
  // static MemberGridItemLinear agent =
  //     MemberGridItemLinear.define(MemberGridData(
  //   id: RouteEnum.AGENT,
  //   iconData: IconCode.gridAgent,
  //   iconDecorColorStart: HexColor.fromHex('#e68f63'),
  //   iconDecorColorEnd: HexColor.fromHex('#a75433'),
  //   route: RoutePage.agent,
  // ));
  static MemberGridItemLinear logout =
      MemberGridItemLinear.define(MemberGridData(
    id: RouteEnum.LOGOUT,
    iconData: IconCode.gridLogout,
    iconDecorColorStart: HexColor.fromHex('#cccccc'),
    iconDecorColorEnd: HexColor.fromHex('#929292'),
  ));

  /// Used for defining cases
  const MemberGridItemLinear.define(MemberGridData fromValue)
      : super.define(fromValue);
}
