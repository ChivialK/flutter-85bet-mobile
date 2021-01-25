import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';

import '../../data/models/notice_model.dart' show NoticeData;

class NoticeDisplayContent extends StatelessWidget {
  final List<NoticeData> dataList;

  NoticeDisplayContent({@required this.dataList});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 60),
      child: ListView.builder(
          primary: true,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: dataList.length,
          itemBuilder: (_, index) {
            NoticeData data = dataList[index];
            String content = '';
            switch (Global.localeCode) {
              case 'zh':
                content = data.content;
                break;
              case 'en':
                content = data.contentEN;
                break;
              case 'th':
                content = data.contentTH;
                break;
              case 'vi':
                content = data.contentVI;
                break;
            }
            if (content.isEmpty && Global.localeCode != 'zh') {
              content = data.content ?? 'ERROR';
            }
            return Container(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 4.0),
                    child: Text(
                      data.date.replaceAll(' ~ ', ' ~ \n'),
                      style: TextStyle(
                        color: themeColor.defaultAccentColor,
                        fontSize: FontSize.TITLE.value,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 20.0),
                    child: Text(
                      data.content,
                      style: TextStyle(
                          fontSize: FontSize.SUBTITLE.value,
                          color: themeColor.noticeTextColor,
                          fontWeight: FontWeight.w400,
                          height: 1.5),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
