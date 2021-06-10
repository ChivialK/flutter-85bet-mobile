import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/utils/value_util.dart';

class MemberDisplayHeader extends StatefulWidget {
  final int vipLevel;
  final String userName;
  final Function onRefresh;

  MemberDisplayHeader({
    Key key,
    @required this.userName,
    @required this.vipLevel,
    @required this.onRefresh,
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
    if (newCredit != _credit)
      setState(() {
        _credit = newCredit;
      });
  }

  @override
  void initState() {
    headerMaxHeight = Global.device.featureContentHeight / 7 * 2 + 8.0;
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
        color: themeColor.memberLinearColor1,
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        boxShadow: ThemeInterface.layerShadowLight,
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
                  child: Image.asset(
                    'assets/images/vip/user_vip_${widget.vipLevel}.png',
                    scale: 1.05,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    widget.userName,
                    style: TextStyle(
                      fontSize: FontSize.MESSAGE.value,
                      color: themeColor.defaultAccentColor,
                    ),
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
                color: themeColor.defaultAccentColor,
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
                RaisedButton(
                  child: Text(
                    localeStr.btnRefresh,
                    style: TextStyle(fontSize: FontSize.MESSAGE.value),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(24.0),
                  ),
                  visualDensity: VisualDensity(horizontal: 2.0),
                  color: themeColor.buttonSubColor,
                  onPressed: () => widget.onRefresh(),
                ),
                RaisedButton(
                  child: Text(
                    localeStr.memberGridTitleLogout,
                    style: TextStyle(fontSize: FontSize.MESSAGE.value),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(24.0),
                  ),
                  visualDensity: VisualDensity(horizontal: 2.0),
                  color: themeColor.buttonSubColor,
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
