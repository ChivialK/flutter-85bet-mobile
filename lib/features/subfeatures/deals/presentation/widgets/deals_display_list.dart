import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';

import '../../data/models/deals_model.dart';

class DealsDisplayList extends StatefulWidget {
  DealsDisplayList(Key key) : super(key: key);

  @override
  DealsDisplayListState createState() => DealsDisplayListState();
}

class DealsDisplayListState extends State<DealsDisplayList> {
  List<DealsData> _dataList;
  List<String> _headerTexts;
  BorderSide _borderSide;

  set updateContent(List<DealsData> list) {
    debugPrint('deals list length: ${list?.length ?? -1}');
    if (_dataList != list) {
      _dataList = list;
      setState(() {});
    }
  }

  @override
  void initState() {
    _headerTexts ??= [
      localeStr.dealsHeaderSerial,
      localeStr.dealsHeaderDate,
      localeStr.dealsHeaderType,
      localeStr.dealsHeaderDetail,
      localeStr.dealsHeaderStatus,
      localeStr.dealsHeaderAmount,
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_dataList == null) return SizedBox.shrink();
    if (_dataList.isEmpty)
      return Container(
        margin: const EdgeInsets.all(24.0),
        child: Center(child: Text(localeStr.messageWarnNoHistoryData)),
      );

    _borderSide ??= BorderSide(color: Themes.defaultBorderColor, width: 1.5);
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: _dataList.length,
      itemBuilder: (context, index) {
        DealsData data = _dataList[index];
        List<dynamic> dataTexts = [
          data.id,
          data.date,
          data.action,
          data.type,
          data.status,
          data.amount
        ];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          decoration: new BoxDecoration(
            color: (index % 2 == 1)
                ? Themes.defaultCardColor
                : Themes.chartBgColor,
            border: (index % 2 == 1)
                ? null
                : Border.symmetric(vertical: _borderSide),
          ),
          child: Column(
            children: List.generate(_headerTexts.length, (rowIndex) {
              return _buildRow(_headerTexts[rowIndex], dataTexts[rowIndex]);
            }),
          ),
        );
      },
    );
  }

  Widget _buildRow(String title, dynamic content) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '$title',
              style: TextStyle(
                fontSize: FontSize.SUBTITLE.value,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              '$content',
              style: TextStyle(
                fontSize: FontSize.SUBTITLE.value,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
