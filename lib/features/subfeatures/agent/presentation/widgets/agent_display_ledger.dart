import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_dropdown_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_field_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/pager_widget.dart';
import 'package:flutter_85bet_mobile/features/subfeatures/transactions/data/enum/transaction_date_enum.dart';

import '../../data/models/agent_ledger_model.dart';
import '../state/agent_store.dart';
import 'agent_display_ledger_table.dart';
import 'agent_inherit_widget.dart';

class AgentDisplayLedger extends StatefulWidget {
  final double availableHeight;

  AgentDisplayLedger(this.availableHeight);

  @override
  _AgentDisplayLedgerState createState() => _AgentDisplayLedgerState();
}

class _AgentDisplayLedgerState extends State<AgentDisplayLedger>
    with AfterLayoutMixin {
  final GlobalKey _streamKey = new GlobalKey(debugLabel: 'ledgerstream');
  final GlobalKey<CustomizeDropdownWidgetState> _selectorKey =
      new GlobalKey(debugLabel: 'selector');
  final GlobalKey<CustomizeFieldWidgetState> _fieldKey =
      new GlobalKey(debugLabel: 'field');
  final GlobalKey<PagerWidgetState> pagerKey =
      new GlobalKey(debugLabel: 'pager');

  final List<String> _selectorStrings = [
    localeStr.spinnerDateToday,
    localeStr.spinnerDateYesterday,
    localeStr.spinnerDateMonth,
    localeStr.spinnerDateAll,
  ];

  final List<TransactionDateSelected> _selectorValues = [
    TransactionDateSelected.today,
    TransactionDateSelected.yesterday,
    TransactionDateSelected.month,
    TransactionDateSelected.all,
  ];

  AgentStore _store;
  TransactionDateSelected _dateSelected;
  bool layoutReady = false;
  int totalPage;
  double tableMaxHeight;

  void getPageData(int page, bool requestNewData) {
    if (_store == null) return;
    if (!requestNewData && page == pagerKey.currentState.currentPage) return;
    _store.getLedger(
      agent: _fieldKey.currentState.getInput,
      page: page,
      dateSelected: _dateSelected,
    );
  }

  @override
  void initState() {
    _dateSelected = _selectorValues[0];
    tableMaxHeight = widget.availableHeight -
        Themes.fieldHeight * 2 -
        Global.device.comfortButtonHeight -
        136;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _store ??= AgentStoreInheritedWidget.of(context).store;
    if (_store == null) {
      return Center(
        child: WarningDisplay(
          message:
              Failure.internal(FailureCode(type: FailureType.AGENT)).message,
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 4.0),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          CustomizeDropdownWidget(
            key: _selectorKey,
            horizontalInset: 16.0,
            prefixText: localeStr.transactionViewSpinnerTitle,
//            minusPrefixWidth: 13,
            optionValues: _selectorValues,
            optionStrings: _selectorStrings,
            changeNotify: (data) {
              _dateSelected = data;
              debugPrint('selected: $data');
            },
          ),
          new CustomizeFieldWidget(
            key: _fieldKey,
            horizontalInset: 16.0,
            fieldType: FieldType.Account,
            hint: localeStr.agentLedgerFieldTitleAccount,
            persistHint: false,
            prefixText: localeStr.agentLedgerHeaderAccount,
            maxInputLength: 12,
            minusHeight: 12.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text(localeStr.btnQueryNow),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      getPageData(1, true);
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(2.0, 6.0, 2.0, 10.0),
            child: StreamBuilder<AgentLedgerModel>(
              key: _streamKey,
              stream: _store.ledgerStream,
              initialData: AgentLedgerModel(data: []),
              builder: (_, snapshot) {
                if (snapshot != null &&
                    snapshot.data != null &&
                    snapshot.data.lastPage != null) {
                  totalPage = snapshot.data.lastPage;
                  debugPrint('update total page: $totalPage');

                  if (layoutReady && totalPage != null) {
                    Future.delayed(Duration(milliseconds: 200), () {
                      pagerKey.currentState.updateTotalPage = totalPage;
                      pagerKey.currentState.updateCurrentPage =
                          snapshot.data.currentPage;
                    });
                  }
                }
                return AgentDisplayLedgerTable(
                  dataList: snapshot.data.data,
                  sumColumn: snapshot.data.sumEachColumn,
                  availableHeight: tableMaxHeight,
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              PagerWidget(
                pagerKey,
                onAction: (page) => getPageData(page, false),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    layoutReady = true;
  }
}
