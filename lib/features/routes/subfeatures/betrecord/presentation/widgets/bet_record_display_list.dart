import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';

import '../../data/models/bet_record_model.dart';

class BetRecordDisplayList extends StatelessWidget {
  final List dataList;
  final bool isAllData;

  BetRecordDisplayList({
    Key key,
    @required this.dataList,
    this.isAllData = false,
  }) : super(key: key);

  final List<String> _headerTexts = [
    localeStr.betsHeaderDate,
    localeStr.betsHeaderId,
    localeStr.betsHeaderPlatform,
    localeStr.betsHeaderGame,
    localeStr.betsHeaderAmount,
    localeStr.betsHeaderValidBet,
    localeStr.betsHeaderBonus,
  ];

  final List<String> _platformHeaderRowTexts = [
    localeStr.betsHeaderPlatform,
    localeStr.betsHeaderAmount,
    localeStr.betsHeaderValidBet,
    localeStr.betsHeaderBonus,
  ];

  final BorderSide _borderSide =
      BorderSide(color: themeColor.chartBorderColor, width: 1.5);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        var data = dataList[index];
        bool isSumData = false;
        List<dynamic> dataTexts;
        if (data is BetRecordDataAllPlatform) {
          isSumData = data.isSumData();
          dataTexts = [
            (isSumData) ? localeStr.rollbackHeaderTextTotal : data.key,
            formatNum(data.bet),
            formatNum(data.valid),
            formatNum(data.payout),
          ];
        } else if (data is BetRecordData) {
          if (data.isSumData()) {
            isSumData = data.isSumData();
            dataTexts = [
              localeStr.rollbackHeaderTextTotal,
              '',
              '',
              '',
              data.bet ?? formatValue(0, creditSign: true),
              data.validBet ?? formatValue(0, creditSign: true),
              data.payout ?? formatValue(0, creditSign: true),
            ];
          } else {
            dataTexts = [
              data.startTime,
              '${data.betNo}',
              data.site,
              data.type,
              data.bet,
              data.activeBet,
              data.payout,
            ];
          }
        }
        return Container(
          decoration: new BoxDecoration(
            color: (index % 2 == 1)
                ? themeColor.chartBgColor
                : themeColor.defaultCardColor,
            border: (index % 2 == 1)
                ? null
                : Border.symmetric(horizontal: _borderSide),
          ),
          child: Column(
            children: (!isAllData)
                ? List.generate(_headerTexts.length, (rowIndex) {
                    return _buildRow(
                      _headerTexts[rowIndex],
                      dataTexts[rowIndex],
                      isSumData && rowIndex == 0,
                    );
                  })
                : List.generate(_platformHeaderRowTexts.length, (rowIndex) {
                    return _buildRow(
                      _platformHeaderRowTexts[rowIndex],
                      dataTexts[rowIndex],
                      isSumData && rowIndex == 0,
                    );
                  }),
          ),
        );
      },
    );
  }

  Widget _buildRow(String title, dynamic content, bool isSum) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              (isSum) ? localeStr.betsHeaderSum : '$title',
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
