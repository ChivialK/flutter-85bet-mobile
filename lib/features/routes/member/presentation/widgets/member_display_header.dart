import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/cached_network_image.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/gradient_button.dart';
import 'package:flutter_85bet_mobile/utils/value_util.dart';

class MemberDisplayHeader extends StatefulWidget {
  final int vipLevel;
  final String userName;
  final Function onRefresh;
  final Gradient headerGradient;

  MemberDisplayHeader({
    Key key,
    @required this.userName,
    @required this.vipLevel,
    @required this.onRefresh,
    @required this.headerGradient,
  })  : assert(onRefresh != null),
        super(key: key);

  @override
  MemberDisplayHeaderState createState() => MemberDisplayHeaderState();
}

class MemberDisplayHeaderState extends State<MemberDisplayHeader> {
  double headerMinHeight = 185;
  double headerMaxHeight;

  String _credit;

  set updateCredit(String credit) {
    String newCredit;
    if (credit.startsWith(creditSymbol))
      newCredit = credit;
    else
      newCredit = formatValue(credit, creditSign: true, floorIfInt: true);
    debugPrint('current credit: $_credit, new: $newCredit');
    if (newCredit != _credit)
      setState(() {
        _credit = newCredit;
      });
  }

  @override
  void initState() {
    headerMaxHeight =
        (Global.device.height - Global.APP_BARS_HEIGHT) / 7 * 2 + 8.0;
    debugPrint('header height, max: $headerMaxHeight, min: $headerMinHeight');
    if (headerMaxHeight > 208) headerMaxHeight = 208;
    if (headerMaxHeight < headerMinHeight) headerMaxHeight = headerMinHeight;

    _credit = formatValue('0', creditSign: true, floorIfInt: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: headerMinHeight,
        maxHeight: headerMaxHeight,
        maxWidth: Global.device.width,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        gradient: widget.headerGradient,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: FontSize.MESSAGE.value * 2,
                    child: networkImageBuilder('images/vip/18.png')),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    widget.userName,
                    style: TextStyle(fontSize: FontSize.MESSAGE.value),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              _credit,
              style: TextStyle(
                fontSize: FontSize.HEADER.value * 1.5,
                fontWeight: FontWeight.w400,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GradientButton(
                  cornerRadius: 2.0,
                  lrPadding: 16.0,
                  colorType: GradientButtonColor.GOLD,
                  child: Text(
                    localeStr.btnRefresh,
                    style: TextStyle(fontSize: FontSize.MESSAGE.value),
                  ),
                  onPressed: () => widget.onRefresh(),
                ),
                GradientButton(
                  cornerRadius: 2.0,
                  lrPadding: 16.0,
                  colorType: GradientButtonColor.GOLD,
                  child: Text(
                    localeStr.memberGridTitleLogout,
                    style: TextStyle(fontSize: FontSize.MESSAGE.value),
                  ),
                  onPressed: () => getAppGlobalStreams.logout(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
