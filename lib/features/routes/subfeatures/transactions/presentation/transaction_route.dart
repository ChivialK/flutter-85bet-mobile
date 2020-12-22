import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_dropdown_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/pager_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/warning_display.dart';
import 'package:flutter_85bet_mobile/features/routes/member/presentation/data/member_grid_item.dart';

import '../data/enum/transaction_date_enum.dart';
import 'state/transaction_store.dart';
import 'widgets/transaction_display_list.dart';

class TransactionRoute extends StatefulWidget {
  @override
  _TransactionRouteState createState() => _TransactionRouteState();
}

class _TransactionRouteState extends State<TransactionRoute> {
  final MemberGridItem pageItem = MemberGridItem.transferRecord;
  TransactionStore _store;
  List<ReactionDisposer> _disposers;
  CancelFunc toastDismiss;

  final GlobalKey<CustomizeDropdownWidgetState> _selectorKey =
      new GlobalKey(debugLabel: 'selector');
  final GlobalKey<TransactionDisplayListState> contentKey =
      new GlobalKey(debugLabel: 'content');
  final GlobalKey<PagerWidgetState> pagerKey =
      new GlobalKey(debugLabel: 'pager');

  final List<TransactionDateSelected> _selectorValues = [
    TransactionDateSelected.all,
    TransactionDateSelected.today,
    TransactionDateSelected.yesterday,
    TransactionDateSelected.month,
  ];

  List<String> _selectorStrings;
  TransactionDateSelected _selected;

  void getPageData(int page) {
    if (_store == null) return;
    contentKey.currentState?.updateContent = null;
    _store.getRecord(page: page, selection: _selected);
  }

  @override
  void initState() {
    _store ??= sl.get<TransactionStore>();
    _selectorStrings = [
      localeStr.spinnerDateAll,
      localeStr.spinnerDateToday,
      localeStr.spinnerDateYesterday,
      localeStr.spinnerDateMonth,
    ];
    _selected = _selectorValues[0];
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposers ??= [
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _store.errorMessage,
        // Run some logic with the content of the observed field
        (String message) {
          if (message != null && message.isNotEmpty) {
            callToastError(message, delayedMilli: 200);
          }
        },
      ),
      /* Reaction on search action */
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _store.waitForPageData,
        // Run some logic with the content of the observed field
        (bool wait) {
          debugPrint('reaction on wait transaction: $wait');
          if (wait) {
            toastDismiss = callToastLoading();
          } else if (toastDismiss != null) {
            toastDismiss();
            toastDismiss = null;
            if (_store.dataModel != null) {
              debugPrint(
                  'updating transaction record, page: ${_store.dataModel.currentPage}');
              try {
                if (_store.dataModel.total > 0) {
                  pagerKey.currentState.updateTotalPage =
                      _store.dataModel.lastPage;
                  pagerKey.currentState.updateCurrentPage =
                      _store.dataModel.currentPage;
                } else {
                  pagerKey.currentState.updateTotalPage = 0;
                }
                contentKey.currentState.updateContent = _store.dataModel.data;
              } on Exception {
                callToastError(localeStr.messageActionFailed);
              }
            }
          }
        },
      ),
    ];
  }

  @override
  void didUpdateWidget(TransactionRoute oldWidget) {
    super.didUpdateWidget(oldWidget);
    _selectorStrings = [
      localeStr.spinnerDateAll,
      localeStr.spinnerDateToday,
      localeStr.spinnerDateYesterday,
      localeStr.spinnerDateMonth,
    ];
    if (contentKey.currentState?.mounted ?? false) {
      contentKey.currentState?.updateTexts(true);
    }
  }

  @override
  void dispose() {
    if (toastDismiss != null) {
      toastDismiss();
      toastDismiss = null;
    }
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        debugPrint('pop transactions route');
        Future.delayed(
            Duration(milliseconds: 100), () => RouterNavigate.navigateBack());
        return Future(() => true);
      },
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(12.0),
          child: (_store == null)
              ? Center(
                  child: WarningDisplay(
                    message:
                        Failure.internal(FailureCode(type: FailureType.INHERIT))
                            .message,
                  ),
                )
              : InkWell(
                  // to dismiss the keyboard when the user tabs out of the TextField
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: ListView(
                    primary: true,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(4.0, 20.0, 4.0, 12.0),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: themeColor.memberIconColor,
                                boxShadow: ThemeInterface.iconBottomShadow,
                              ),
                              child: Icon(
                                pageItem.value.iconData,
                                size: 32 * Global.device.widthScale,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                pageItem.value.label,
                                style:
                                    TextStyle(fontSize: FontSize.HEADER.value),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(4.0, 20.0, 8.0, 16.0),
                        child: Container(
                          decoration: ThemeInterface.layerShadowDecorRound,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              SizedBox(height: 24.0),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: CustomizeDropdownWidget(
                                  key: _selectorKey,
                                  horizontalInset: 56.0,
                                  prefixText:
                                      localeStr.transactionViewSpinnerTitle,
                                  prefixTextSize: FontSize.SUBTITLE.value,
                                  titleWidthFactor: 0.4,
                                  optionValues: _selectorValues,
                                  optionStrings: _selectorStrings,
                                  changeNotify: (data) {
                                    _selected = data;
                                    debugPrint('selected: $data');
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 24.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: SizedBox(
                                        height:
                                            Global.device.comfortButtonHeight,
                                        child: RaisedButton(
                                          child: Text(localeStr.btnQueryNow),
                                          onPressed: () => getPageData(1),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(2.0, 12.0, 2.0, 8.0),
                                child: TransactionDisplayList(contentKey),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    PagerWidget(
                                      pagerKey,
                                      horizontalInset: 20.0,
                                      onAction: (page) => getPageData(page),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
