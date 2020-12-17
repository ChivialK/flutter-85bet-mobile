import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/table_cell_text_widget.dart';
import 'package:flutter_85bet_mobile/features/themes/theme_interface.dart';
import 'package:flutter_85bet_mobile/utils/value_util.dart';

import '../../data/models/bet_record_model.dart';

class BetRecordDisplayTable extends StatelessWidget {
  final List dataList;
  final bool isAllData;

  BetRecordDisplayTable({
    @required this.dataList,
    this.isAllData = false,
  });

  final List<String> _headerRowTexts = [
    localeStr.betsHeaderDate,
    localeStr.betsHeaderId,
    localeStr.betsHeaderPlatform,
    localeStr.betsHeaderGame,
    localeStr.betsHeaderAmount,
    localeStr.betsHeaderBonus,
  ];

  final List<String> _platformHeaderRowTexts = [
    localeStr.betsHeaderPlatform,
    localeStr.betsHeaderAmount,
    localeStr.betsHeaderBonus,
  ];

  @override
  Widget build(BuildContext context) {
    double _availableWidth = Global.device.width - 16;
    Map<int, TableColumnWidth> _tableWidthMap = (!isAllData)
        ? {
            //指定索引及固定列宽
            0: FixedColumnWidth(_availableWidth * 0.1),
            1: FixedColumnWidth(_availableWidth * 0.2),
            2: FixedColumnWidth(_availableWidth * 0.1),
            3: FixedColumnWidth(_availableWidth * 0.2),
            4: FixedColumnWidth(_availableWidth * 0.2),
            5: FixedColumnWidth(_availableWidth * 0.2),
          }
        : {
            //指定索引及固定列宽
            0: FixedColumnWidth(_availableWidth * 0.4),
            1: FixedColumnWidth(_availableWidth * 0.25),
            2: FixedColumnWidth(_availableWidth * 0.35),
          };

    return Container(
      constraints: BoxConstraints(
        maxWidth: _availableWidth,
      ),
      color: themeColor.chartBgColor,
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: _tableWidthMap,
        border: TableBorder.all(
          color: themeColor.chartBorderColor,
          width: 2.0,
          style: BorderStyle.solid,
        ),
        /* create table header and generate rows */
        children: _buildContent(),
      ),
    );
  }

  List<TableRow> _buildContent() {
    List<TableRow> rows;
    if (dataList != null && dataList.isNotEmpty) {
      rows = _buildContentRows();
      rows.insert(0, _buildHeaderRow());
    } else {
      rows = [_buildHeaderRow()];
    }
    return rows;
  }

  List<TableRow> _buildContentRows() {
    int sumRowIndex = 0;
    List<TableRow> list = List.generate(dataList.length, (index) {
      var data = dataList[index];
      List<dynamic> dataTexts;
      if (data is BetRecordDataAllPlatform) {
        if (data.isSumData()) sumRowIndex = index;
        dataTexts = [
          (data.isSumData()) ? localeStr.rollbackHeaderTextTotal : data.key,
          formatNum(data.bet),
          formatNum(data.payout),
        ];
      } else if (data is BetRecordData) {
        if (data.isSumData()) {
          sumRowIndex = index;
          dataTexts = [
            localeStr.rollbackHeaderTextTotal,
            '',
            '',
            '',
            data.bet ?? formatValue(0, creditSign: true),
            data.payout ?? formatValue(0, creditSign: true),
          ];
        } else {
          dataTexts = [
            data.startTime,
            '${data.betNo}',
            data.site,
            data.type,
            data.bet,
            data.payout,
          ];
        }
      }
      /* generate cell text */
      return TableRow(
        children: List.generate(
          dataTexts.length,
          (index) => TableCellTextWidget(text: '${dataTexts[index]}'),
        ),
      );
    });
    TableRow lastRow = list[sumRowIndex];
    list.removeAt(sumRowIndex);
    list.add(lastRow);
    return list;
  }

  TableRow _buildHeaderRow() {
    return (!isAllData)
        ? TableRow(
            children: List.generate(
              _headerRowTexts.length,
              (index) => TableCellTextWidget(text: _headerRowTexts[index]),
            ),
          )
        : TableRow(
            children: List.generate(
              _platformHeaderRowTexts.length,
              (index) =>
                  TableCellTextWidget(text: _platformHeaderRowTexts[index]),
            ),
          );
  }
}
