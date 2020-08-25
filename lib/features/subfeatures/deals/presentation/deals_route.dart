import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_dropdown_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/pager_widget.dart';
import 'package:flutter_85bet_mobile/features/member/presentation/data/member_grid_item.dart';
import 'package:flutter_85bet_mobile/features/subfeatures/deals/presentation/widgets/deals_display_list.dart';

import '../data/enum/deals_date_enum.dart';
import '../data/enum/deals_status_enum.dart';
import '../data/enum/deals_type_enum.dart';
import '../data/form/deals_form.dart';
import 'state/deals_store.dart';

class DealsRoute extends StatefulWidget {
  @override
  _DealsRouteState createState() => _DealsRouteState();
}

class _DealsRouteState extends State<DealsRoute> {
  final MemberGridItem pageItem = MemberGridItem.dealRecord;
  DealsStore _store;
  List<ReactionDisposer> _disposers;
  CancelFunc toastDismiss;

  final GlobalKey<DealsDisplayListState> contentKey =
      new GlobalKey(debugLabel: 'content');
  final GlobalKey<PagerWidgetState> pagerKey =
      new GlobalKey(debugLabel: 'pager');

  final List<String> _selectorDateStrings = [
    localeStr.spinnerDateToday,
    localeStr.spinnerDateYesterday,
    localeStr.spinnerDateMonth,
    localeStr.spinnerDateAll,
  ];
  final List<String> _selectorTypeStrings = [
    localeStr.dealsViewSpinnerType0,
    localeStr.dealsViewSpinnerType1,
    localeStr.dealsViewSpinnerType2,
    localeStr.dealsViewSpinnerType3,
  ];
  final List<String> _selectorStatusStrings = [
    localeStr.dealsViewSpinnerStatus0,
    localeStr.dealsViewSpinnerStatus1,
    localeStr.dealsViewSpinnerStatus2,
    localeStr.dealsViewSpinnerStatus3,
    localeStr.dealsViewSpinnerStatus4,
  ];

  DealsDateEnum _selectedDate;
  DealsTypeEnum _selectedType;
  DealsStatusEnum _selectedStatus;

  void getPageData(int page) {
    if (_store == null) {
      callToastError(
          Failure.internal(FailureCode(type: FailureType.INJECTOR)).message,
          delayedMilli: 200);
      return;
    }
    contentKey.currentState.updateContent = null;
    _store.getRecord(DealsForm(
      page: page,
      time: _selectedDate.value,
      type: _selectedType.value,
      status: _selectedStatus.value,
    ));
  }

  @override
  void initState() {
    _store ??= sl.get<DealsStore>();
    _selectedDate = DealsDateEnum.LIST[0];
    _selectedType = DealsTypeEnum.LIST[0];
    _selectedStatus = DealsStatusEnum.LIST[0];
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
          debugPrint('reaction on wait deals: $wait');
          if (wait) {
            toastDismiss = callToastLoading();
          } else if (toastDismiss != null) {
            toastDismiss();
            toastDismiss = null;
            if (_store.dataModel != null) {
              debugPrint(
                  'updating deals record, page: ${_store.dataModel.currentPage}');
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
        debugPrint('pop deals route');
        Future.delayed(
            Duration(milliseconds: 100), () => RouterNavigate.navigateBack());
        return Future(() => true);
      },
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(12.0),
          child: InkWell(
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
                  padding: const EdgeInsets.fromLTRB(4.0, 20.0, 4.0, 12.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Themes.memberIconColor,
                          boxShadow: Themes.roundIconShadow,
                        ),
                        child: Icon(
                          pageItem.value.iconData,
                          size: 32 * Global.device.widthScale,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          pageItem.value.label,
                          style: TextStyle(fontSize: FontSize.HEADER.value),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4.0, 20.0, 4.0, 16.0),
                  child: Container(
                    decoration: Themes.layerShadowDecorRound,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(height: 24.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: CustomizeDropdownWidget(
                                  optionValues: DealsDateEnum.LIST,
                                  optionStrings: _selectorDateStrings,
                                  changeNotify: (data) {
                                    _selectedDate = data;
                                    debugPrint('selected date: $data');
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: CustomizeDropdownWidget(
                                  optionValues: DealsTypeEnum.LIST,
                                  optionStrings: _selectorTypeStrings,
                                  changeNotify: (data) {
                                    _selectedType = data;
                                    debugPrint('selected type: $data');
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: CustomizeDropdownWidget(
                                  optionValues: DealsStatusEnum.LIST,
                                  optionStrings: _selectorStatusStrings,
                                  changeNotify: (data) {
                                    _selectedStatus = data;
                                    debugPrint('selected status: $data');
                                  },
                                ),
                              ),
                            ],
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
                                  height: Global.device.comfortButtonHeight,
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
                          padding: EdgeInsets.fromLTRB(2.0, 12.0, 2.0, 8.0),
                          child: DealsDisplayList(contentKey),
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
