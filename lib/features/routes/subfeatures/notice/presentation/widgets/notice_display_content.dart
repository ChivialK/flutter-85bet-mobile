import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/dot_separator.dart';

import '../../data/models/notice_model.dart' show NoticeData;

class NoticeDisplayContent extends StatelessWidget {
  final List<NoticeData> dataList;

  NoticeDisplayContent({@required this.dataList});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Themes.layerShadowDecorRoundBottom,
      constraints: BoxConstraints(minHeight: 60),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            itemCount: dataList.length,
            itemBuilder: (_, index) {
              NoticeData data = dataList[index];
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
                          color: Themes.defaultAccentColor,
                          fontSize: FontSize.TITLE.value,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                      child: Text(
                        data.content,
                        style: TextStyle(fontSize: FontSize.SUBTITLE.value),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 8.0),
                      child: DotSeparator(color: Themes.defaultBorderColor),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
