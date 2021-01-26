import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/table_cell_span_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/table_cell_text_widget.dart';

import '../../data/models/store_exchange_model.dart';

class StoreDisplayRecordTable extends StatelessWidget {
  final StoreExchangeModel tableData;
  final double availableHeight;

  StoreDisplayRecordTable({
    @required this.tableData,
    this.availableHeight,
  });

  final List<String> _headerRowTexts = [
    localeStr.storeRecordTableTitleNo,
    localeStr.storeRecordTableTitleProduct,
    localeStr.storeRecordTableTitlePoint,
    localeStr.storeRecordTableTitleDate,
    localeStr.storeRecordTableTitleState,
  ];

  @override
  Widget build(BuildContext context) {
    double availableWidth = Global.device.width - 24;
    bool hasData = tableData != null &&
        tableData.data != null &&
        tableData.data.isNotEmpty;
    double dateWidth = (Global.device.isIos) ? 86 : 80;
    double remainWidth = availableWidth - dateWidth;
    Map<int, TableColumnWidth> _tableWidthMap = (hasData)
        ? {
            //指定索引及固定列宽
            0: FixedColumnWidth(remainWidth * 0.1),
            1: FixedColumnWidth(remainWidth * 0.7),
            2: FixedColumnWidth(remainWidth * 0.1),
            3: FixedColumnWidth(dateWidth),
            4: FixedColumnWidth(remainWidth * 0.1),
          }
        : {
            //指定索引及固定列宽
            0: FixedColumnWidth(remainWidth * 0.175),
            1: FixedColumnWidth(remainWidth * 0.475),
            2: FixedColumnWidth(remainWidth * 0.175),
            3: FixedColumnWidth(dateWidth),
            4: FixedColumnWidth(remainWidth * 0.175),
          };

    return ColoredBox(
      color: themeColor.chartBgColor,
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: _tableWidthMap,
        border: TableBorder.all(
          color: themeColor.chartBorderColor,
          width: 1.0,
          style: BorderStyle.solid,
        ),
        /* create table header and generate rows */
        children: (hasData)
            ? <TableRow>[_buildHeaderRow()] + _buildContentRows()
            : <TableRow>[_buildHeaderRow()],
      ),
    );
  }

  List<TableRow> _buildContentRows() {
    return List.generate(tableData.data.length, (index) {
      StoreExchangeData data = tableData.data[index];
      List<dynamic> dataTexts = [
        tableData.from + index,
        data.product,
        data.point,
        data.date,
        getStatusIndex(data.status),
      ];
      /* generate cell text */
      return TableRow(
        children: List.generate(
          dataTexts.length,
          (index) {
            if (index == 1) {
              return TableCellSpanWidget(
                span: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: '${dataTexts[index]}\n'),
                    TextSpan(
                      text:
                          '${localeStr.storeRecordTableDetailName(data.name)}; ',
                      style: TextStyle(color: themeColor.defaultHintSubColor),
                    ),
                    TextSpan(
                      text:
                          '${localeStr.storeRecordTableDetailPhone(data.phone)};\n',
                      style: TextStyle(color: themeColor.defaultHintSubColor),
                    ),
                    TextSpan(
                      text:
                          '${localeStr.storeRecordTableDetailPostCode(data.code)}; ',
                      style: TextStyle(color: themeColor.defaultHintSubColor),
                    ),
                    TextSpan(
                      text:
                          '${localeStr.storeRecordTableDetailAddress(data.address)};',
                      style: TextStyle(color: themeColor.defaultHintSubColor),
                    ),
                  ],
                ),
              );
            } else if (index == 4) {
              return TableCellTextWidget(
                text: (dataTexts[index] == '1')
                    ? localeStr.storeRecordTableStatusPending
                    : dataTexts[index],
              );
            } else {
              return TableCellTextWidget(text: '${dataTexts[index]}');
            }
          },
        ),
      );
    });
  }

  TableRow _buildHeaderRow() {
    return TableRow(
      decoration: BoxDecoration(
        color: themeColor.chartHeaderBgColor,
      ),
      children: List.generate(
        _headerRowTexts.length,
        (index) => TableCellTextWidget(
          text: _headerRowTexts[index],
          textColor: themeColor.chartPrimaryHeaderTextColor,
        ),
      ),
    );
  }

  String getStatusIndex(String state) {
    switch (state.toLowerCase()) {
      case '1':
        return localeStr.storeRecordOrderStateShipping;
      case '0':
        return localeStr.storeRecordOrderStateCancel;
      case 'success order':
        return localeStr.storeRecordOrderStateSuccess;
      case 'refuse':
        return localeStr.storeRecordOrderStateRefuse;
      case 'adjust':
        return localeStr.storeRecordOrderStateAdjust;
      default:
        return state;
    }
  }
}
