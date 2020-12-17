import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';

import '../../data/models/transaction_model.dart';

class TransactionDisplayList extends StatefulWidget {
  TransactionDisplayList(Key key) : super(key: key);

  @override
  TransactionDisplayListState createState() => TransactionDisplayListState();
}

class TransactionDisplayListState extends State<TransactionDisplayList> {
  List<TransactionData> _dataList;
  List<String> _headerTexts;
  BorderSide _borderSide;

  String _textIn;
  String _textOut;

  set updateContent(List<TransactionData> list) {
    debugPrint('transaction list length: ${list?.length ?? -1}');
    if (_dataList != list) {
      _dataList = list;
      setState(() {});
    }
  }

  void updateTexts(bool state) {
    _headerTexts = [
      localeStr.transactionHeaderSerial,
      localeStr.transactionHeaderDate,
      localeStr.transactionHeaderType,
      localeStr.transactionHeaderDesc,
      localeStr.transactionHeaderAmount,
    ];
    _textIn = localeStr.transferViewTitleIn;
    _textOut = localeStr.transferViewTitleOut;
    setState(() {});
  }

  @override
  void initState() {
    updateTexts(false);
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

    _borderSide ??=
        BorderSide(color: themeColor.defaultBorderColor, width: 1.5);
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: _dataList.length,
      itemBuilder: (context, index) {
        TransactionData data = _dataList[index];
        List<dynamic> dataTexts = [
          data.key,
          data.date,
          ('${data.type}'.toLowerCase() == 'in') ? _textIn : _textOut,
          localeStr.transferMessage(data.from, data.to),
          data.amount,
        ];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          decoration: new BoxDecoration(
            color: (index % 2 == 1)
                ? themeColor.defaultCardColor
                : themeColor.chartBgColor,
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
