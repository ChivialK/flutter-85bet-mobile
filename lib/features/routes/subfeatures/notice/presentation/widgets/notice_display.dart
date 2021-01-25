import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/types_grid_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/warning_display.dart';
import 'package:flutter_85bet_mobile/features/routes/member/presentation/data/member_grid_item.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/notice/data/models/notice_type.dart';

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

  final int tabsPerRow = 3;
  final double expectTabHeight = 42.0;

  final List<NoticeTypeEnum> tabs = [
    NoticeTypeEnum.general,
    NoticeTypeEnum.maintenance,
  ];

  int _clicked = 0;

  @override
  void didUpdateWidget(NoticeDisplay oldWidget) {
    super.didUpdateWidget(oldWidget);
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
                      style: TextStyle(
                          fontSize: FontSize.HEADER.value,
                          color: themeColor.defaultTitleColor),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 16.0, 9.0, 0.0),
              child: TypesGridWidget<NoticeTypeEnum>(
                types: tabs,
                titleKey: 'label',
                onTypeGridTap: (_, type) {
                  int index = tabs.indexOf(type);
                  if (index != _clicked) {
                    setState(() {
                      _clicked = index;
                    });
                  }
                },
                tabsPerRow: tabsPerRow,
                itemSpace: 0,
                expectTabHeight: expectTabHeight,
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
