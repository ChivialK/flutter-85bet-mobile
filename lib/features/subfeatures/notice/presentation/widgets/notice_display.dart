import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/warning_display.dart';
import 'package:flutter_85bet_mobile/features/member/presentation/data/member_grid_item.dart';

import '../state/notice_store.dart';
import 'notice_display_content.dart';

class NoticeDisplay extends StatefulWidget {
  final NoticeStore store;

  NoticeDisplay(this.store);

  @override
  _NoticeDisplayState createState() => _NoticeDisplayState();
}

class _NoticeDisplayState extends State<NoticeDisplay> {
  final MemberGridItem pageItem = MemberGridItem.notice;
  final List<String> tabs = [
    localeStr.noticeTabGeneral,
    localeStr.noticeTabMaintenance,
  ];

  final int tabsPerRow = 3;
  final double expectTabHeight = 42.0;

  int _clicked = 0;
  double gridRatio;

  @override
  void initState() {
    double gridItemWidth =
        (Global.device.width - 6 * (tabsPerRow + 2) - 48) / tabsPerRow;
    gridRatio = gridItemWidth / expectTabHeight;
//    debugPrint('grid item width: $gridItemWidth, gridRatio: $gridRatio');
    if (gridRatio > 4.16) gridRatio = 4.16;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.store.dataModel == null || widget.store.dataModel.code != '0')
      return WarningDisplay(message: localeStr.messageErrorServerData);
    else
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
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Themes.memberIconColor,
                      boxShadow: Themes.roundIconShadow,
                    ),
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
              padding: const EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 0.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: tabsPerRow,
                  crossAxisSpacing: 2.0,
                  childAspectRatio: gridRatio,
                ),
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: tabs.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      if (_clicked == index) return;
                      setState(() {
                        _clicked = index;
                      });
                    },
                    child: Material(
                      color: Colors.transparent,
                      elevation: 8.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: (_clicked == index)
                              ? Themes.buttonTextPrimaryColor
                              : Themes.walletBoxButtonColor,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(6.0)),
                        ),
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(
                            tabs[index],
                            style: TextStyle(
                              color: (_clicked == index)
                                  ? Themes.walletBoxButtonColor
                                  : Themes.buttonTextPrimaryColor,
                              fontSize: FontSize.SUBTITLE.value,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 8.0),
              child: IndexedStack(
                index: _clicked,
                children: <Widget>[
                  NoticeDisplayContent(dataList: widget.store.getMarqueeList),
                  NoticeDisplayContent(
                      dataList: widget.store.getMaintenanceList),
                ],
              ),
            ),
          ],
        ),
      );
  }
}
