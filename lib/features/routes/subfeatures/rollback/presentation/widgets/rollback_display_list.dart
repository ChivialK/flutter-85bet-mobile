import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';

import '../../data/models/rollback_model.dart';

class FlowsDisplayList extends StatelessWidget {
  final List<RollbackModel> dataList;

  FlowsDisplayList(this.dataList);

  final List<String> _headerTexts = [
    localeStr.rollbackHeaderTextTime,
    localeStr.rollbackHeaderTextCode,
    localeStr.rollbackHeaderTextType,
    localeStr.rollbackHeaderTextAmount,
    localeStr.rollbackHeaderTextMultiple,
    localeStr.rollbackHeaderTextPromo,
    localeStr.rollbackHeaderTextRequire,
    localeStr.rollbackHeaderTextCurrent,
    localeStr.rollbackHeaderTextNeed,
  ];

  final List<String> _totalHeaderTexts = [
    localeStr.rollbackHeaderTextTotal,
    // localeStr.rollbackHeaderTextCode,
    // localeStr.rollbackHeaderTextType,
    localeStr.rollbackHeaderTextAmount,
    // localeStr.rollbackHeaderTextMultiple,
    // localeStr.rollbackHeaderTextPromo,
    localeStr.rollbackHeaderTextRequire,
    localeStr.rollbackHeaderTextCurrent,
    localeStr.rollbackHeaderTextNeed,
  ];

  final BorderSide _borderSide =
      BorderSide(color: themeColor.defaultBorderColor, width: 1.5);

  List<String> countTotal() {
    double totalAmount = 0;
    double totalTurnOver = 0;
    double totalRollOver = 0;
    double totalBetResult = 0;

    dataList.forEach((data) {
      totalAmount += data.amount.strToDouble;
      totalTurnOver += data.turnOver.strToDouble;
      totalRollOver += data.rollOver.strToDouble;
      totalBetResult += data.betResult.strToDouble;
    });

    return [
      localeStr.rollbackHeaderTextTotal,
//      '',
//      '',
      formatValue(totalAmount, floorIfInt: true, creditSign: true),
//      '',
//      '',
      formatValue(totalTurnOver, floorIfInt: true, creditSign: true),
      formatValue(totalRollOver, floorIfInt: true, creditSign: true),
      formatValue(totalBetResult, floorIfInt: true, creditSign: true),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: dataList.length + 1,
      itemBuilder: (context, index) {
        bool isTotal = false;
        List<dynamic> dataTexts;
        if (index == dataList.length) {
          isTotal = true;
          dataTexts = countTotal();
        } else {
          RollbackModel data = dataList[index];
          dataTexts = [
            "${data.startTime} ~ ${data.endTime}",
            data.code ?? data.key,
            data.index,
            formatValue(data.amount, creditSign: true),
            '${data.multiply}',
            '${data.promoSimplified}',
            formatValue(data.turnOver, creditSign: true),
            formatValue(data.rollOver, creditSign: true),
            formatValue(data.betResult, creditSign: true),
          ];
        }
        return Container(
          decoration: new BoxDecoration(
            color: (index % 2 == 1)
                ? themeColor.defaultCardColor
                : themeColor.chartBgColor,
            border: (index % 2 == 1)
                ? null
                : Border.symmetric(vertical: _borderSide),
          ),
          child: Column(
            children: List.generate(
                (isTotal) ? _totalHeaderTexts.length : _headerTexts.length,
                (rowIndex) {
              return _buildRow(
                (isTotal)
                    ? _totalHeaderTexts[rowIndex]
                    : _headerTexts[rowIndex],
                dataTexts[rowIndex],
              );
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
            flex: 4,
            child: Text(
              '$title',
              style: TextStyle(
                fontSize: FontSize.SUBTITLE.value,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 7,
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
