import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/table_cell_text_widget.dart';
import 'package:flutter_85bet_mobile/utils/value_util.dart';

import '../../data/models/deals_model.dart';

class DealsDisplayTable extends StatefulWidget {
  DealsDisplayTable(Key key) : super(key: key);

  @override
  DealsDisplayTableState createState() => DealsDisplayTableState();
}

class DealsDisplayTableState extends State<DealsDisplayTable> {
  List<String> _headerRowTexts;
  double _availableWidth;
  double _tableHeight;
  Map<int, TableColumnWidth> _tableWidthMap;

  List<DealsData> _dataList;
  TableRow _headerRow;

  set updateContent(List<DealsData> list) {
    debugPrint('deals list length: ${list.length}');
    if (_dataList != list) {
      _dataList = list;
      setState(() {});
    }
  }

  _updateHeaders() {
    _headerRowTexts = [
      localeStr.dealsHeaderSerial,
      localeStr.dealsHeaderDate,
      localeStr.dealsHeaderType,
      localeStr.dealsHeaderDetail,
      localeStr.dealsHeaderStatus,
      localeStr.dealsHeaderAmount,
    ];
  }

  @override
  void initState() {
    double availableHeight = Global.device.featureContentHeight -
        ThemeInterface.fieldHeight -
        Global.device.comfortButtonHeight -
        48; // 48 = padding and pager
    int availableRows =
        (availableHeight / (FontSize.NORMAL.value * 2.35)).floor();
    debugPrint('max height: $availableHeight, available rows: $availableRows');
    // FontSize.NORMAL.value * 2 = font size * 2 line + space
    _tableHeight = FontSize.NORMAL.value * 2.15 * availableRows;

    _availableWidth = Global.device.width - 16;
    double remainWidth = _availableWidth - 112 - 90;
    _tableWidthMap = {
      //指定索引及固定列宽
      0: FixedColumnWidth(48.0),
      1: FixedColumnWidth(90.0),
      2: FixedColumnWidth(64.0),
      3: FixedColumnWidth(remainWidth * 0.3),
      4: FixedColumnWidth(remainWidth * 0.4),
      5: FixedColumnWidth(remainWidth * 0.3),
    };
    _updateHeaders();
    super.initState();
  }

  @override
  void didUpdateWidget(DealsDisplayTable oldWidget) {
    _updateHeaders();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (_dataList == null) return SizedBox.shrink();
    if (_dataList.isEmpty) {
      return SizedBox(
        height: _tableHeight,
        child: Center(
          child: Text(localeStr.messageWarnNoHistoryData),
        ),
      );
    } else {
      _headerRow ??= TableRow(
        children: List.generate(
          _headerRowTexts.length,
          (index) => TableCellTextWidget(text: _headerRowTexts[index]),
        ),
      );
      return Container(
        constraints: BoxConstraints(
          maxWidth: _availableWidth,
          maxHeight: _tableHeight,
        ),
        child: SingleChildScrollView(
          child: ColoredBox(
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
              children: <TableRow>[_headerRow] +
                  List.generate(_dataList.length, (index) {
                    DealsData data = _dataList[index];
                    List<dynamic> dataTexts = [
                      data.id,
                      data.date,
                      getActionLocale(data.action),
                      getTypeLocale(data.type),
                      getStatusLocale(data.status),
                      formatValue(data.amount),
                    ];
                    /* generate cell text */
                    return TableRow(
                      children: List.generate(
                        dataTexts.length,
                        (index) =>
                            TableCellTextWidget(text: '${dataTexts[index]}'),
                      ),
                    );
                  }),
            ),
          ),
        ),
      );
    }
  }

  String getStatusLocale(String state) {
    switch (state) {
      case 'success':
        return localeStr.dealsViewSpinnerStatus1;
      case 'processing':
        return localeStr.dealsViewSpinnerStatus3;
      case 'newTransaction':
        return localeStr.dealsViewSpinnerStatus4;
      default:
        if (state.contains('reject')) {
          return state.replaceAll('reject', localeStr.dealsViewSpinnerStatus2);
        }
        return state;
    }
  }

  String getActionLocale(String action) {
    switch (action) {
      case 'deposit':
        return localeStr.dealsViewSpinnerType1;
      case 'withdraw':
        return localeStr.dealsViewSpinnerType2;
      default:
        return localeStr.dealsViewSpinnerType3;
    }
  }

  String getTypeLocale(String type) {
    switch (type) {
      case 'webBank':
        return localeStr.memberGridTitleTransfer;
      default:
        return type;
    }
  }
}
