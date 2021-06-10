import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/types_grid_widget.dart';
import 'package:flutter_85bet_mobile/features/routes/member/presentation/data/member_grid_item.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/accountcenter/presentation/data/center_category.dart';

import 'center_display_account.dart';
import 'center_display_vip.dart';

class CenterDisplay extends StatefulWidget {
  @override
  _CenterDisplayState createState() => _CenterDisplayState();
}

class _CenterDisplayState extends State<CenterDisplay> {
  final MemberGridItem pageItem = MemberGridItem.accountCenter;
  final List<CenterCategoryEnum> tabs = CenterCategoryEnum.mapAll;

  final int tabsPerRow = 3;
  final double expectTabHeight = 42.0;

  int _clicked = 0;
  double gridRatio;

  @override
  void initState() {
    double gridItemWidth =
        (Global.device.width - 6 * (tabsPerRow + 2) - 48) / tabsPerRow;
    gridRatio = gridItemWidth / expectTabHeight;
    print('grid item width: $gridItemWidth, gridRatio: $gridRatio');
    if (gridRatio > 4.16) gridRatio = 4.16;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Global.device.width - 24.0,
      child: ListView(
        primary: true,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(4.0, 20.0, 4.0, 12.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: ThemeInterface.pageIconContainerDecor,
                  child: Icon(
                    pageItem.value.iconData,
                    size: 32 * Global.device.widthScale,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    pageItem.value.label,
                    style: TextStyle(fontSize: FontSize.HEADER.value),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: TypesGridWidget<CenterCategoryEnum>(
              types: tabs,
              titleKey: 'label',
              itemSpaceHorFactor: 1.0,
              onTypeGridTap: (_, type) {
                int index = tabs.indexOf(type);
                if (index != _clicked) {
                  setState(() {
                    _clicked = index;
                  });
                }
              },
              tabsPerRow: tabsPerRow,
              expectTabHeight: expectTabHeight,
            ),
          ),
          Container(
            child: IndexedStack(
              index: _clicked,
              children: <Widget>[
                CenterDisplayAccount(),
                CenterDisplayVip(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
