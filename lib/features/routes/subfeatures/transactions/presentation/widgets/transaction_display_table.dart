import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/table_cell_text_widget.dart';

import '../../data/models/transaction_model.dart';

class TransactionDisplayTable extends StatefulWidget {
  TransactionDisplayTable(Key key) : super(key: key);

  @override
  TransactionDisplayTableState createState() => TransactionDisplayTableState();
}

class TransactionDisplayTableState extends State<TransactionDisplayTable> {
  double _availableWidth;
  double _tableHeight;
  Map<int, TableColumnWidth> _tableWidthMap;

  List<TransactionData> _dataList;
  List<String> _headerRowTexts;
  TableRow _headerRow;

  String _textIn;
  String _textOut;

  set updateContent(List<TransactionData> list) {
    debugPrint('transaction list length: ${list.length}');
    if (_dataList != list) {
      _dataList = list;
      setState(() {});
    }
  }

  void updateTexts(bool state) {
    _headerRowTexts = [
      localeStr.transactionHeaderSerial,
      localeStr.transactionHeaderDate,
      localeStr.transactionHeaderType,
      localeStr.transactionHeaderDesc,
      localeStr.transactionHeaderAmount,
    ];
    _textIn = localeStr.transferViewTitleIn;
    _textOut = localeStr.transferViewTitleOut;
    if (state) setState(() {});
  }

  @override
  void initState() {
    double availableHeight = Global.device.featureContentHeight -
        ThemeInterface.fieldHeight -
        Global.device.comfortButtonHeight -
        48; // 96 = padding and pager
    int availableRows =
        (availableHeight / (FontSize.NORMAL.value * 2.35)).floor();
    debugPrint('max height: $availableHeight, available rows: $availableRows');
    // FontSize.NORMAL.value * 2 = font size * 2 line + space
    _tableHeight = FontSize.NORMAL.value * 2.15 * availableRows;

    bool shrinkDate = Global.device.width < 320;
    _availableWidth = Global.device.width - 16;
    double remainWidth =
        (shrinkDate) ? _availableWidth - 72 - 90 : _availableWidth - 72 - 140;
    _tableWidthMap = {
      //指定索引及固定列宽
      0: FixedColumnWidth(36.0),
      1: FixedColumnWidth((shrinkDate) ? 90.0 : 140.0),
      2: FixedColumnWidth(36.0),
      3: FixedColumnWidth(remainWidth * 0.525),
      4: FixedColumnWidth(remainWidth * 0.475),
    };
    super.initState();
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
      if (_headerRowTexts == null) updateTexts(false);
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
                  List.generate(
                    _dataList.length,
                    (index) {
                      TransactionData data = _dataList[index];
                      String explanation =
                          (data.type == localeStr.transferViewTitleOut)
                              ? '${data.from} ${data.type}'
                              : '${data.type} ${data.to}';
                      List<dynamic> dataTexts = [
                        data.key,
                        data.date,
                        ('${data.type}'.toLowerCase() == 'in')
                            ? _textIn
                            : _textOut,
                        explanation,
                        data.amount,
                      ];
                      /* generate cell text */
                      return TableRow(
                        children: List.generate(
                          dataTexts.length,
                          (index) =>
                              TableCellTextWidget(text: '${dataTexts[index]}'),
                        ),
                      );
                    },
                  ),
            ),
          ),
        ),
      );
    }
  }

  String _localeTransferDesc(String from, String to) {
    final _from = (from == 'centerWallet') ? localeStr.walletViewTitle : from;
    final _to = (to == 'centerWallet') ? localeStr.walletViewTitle : to;
    return localeStr.transferMessage(_from, _to);
  }
}
