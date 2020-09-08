import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_dropdown_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_field_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/pager_widget.dart';
import 'package:flutter_85bet_mobile/utils/datetime_format.dart';

import '../../data/enum/bet_record_time_enum.dart';
import '../../data/form/bet_record_form.dart';
import '../../data/models/bet_record_model.dart';
import '../../data/models/bet_record_type_model.dart';
import '../state/bet_record_store.dart';
import 'bet_record_display_list.dart';

class BetRecordDisplay extends StatefulWidget {
  final BetRecordStore store;

  BetRecordDisplay({@required this.store});

  @override
  _BetRecordDisplayState createState() => _BetRecordDisplayState();
}

class _BetRecordDisplayState extends State<BetRecordDisplay>
    with AfterLayoutMixin {
  final MemberGridItem pageItem = MemberGridItem.betRecord;
  final GlobalKey _streamKey = new GlobalKey(debugLabel: 'betstream');
  final GlobalKey<PagerWidgetState> pagerKey =
      new GlobalKey(debugLabel: 'pager');

  final GlobalKey<CustomizeDropdownWidgetState> _platformKey =
      new GlobalKey(debugLabel: 'platform');
  final GlobalKey<CustomizeDropdownWidgetState> _timeKey =
      new GlobalKey(debugLabel: 'time');
  final GlobalKey<CustomizeFieldWidgetState> _startTimeKey =
      new GlobalKey(debugLabel: 'start');
  final GlobalKey<CustomizeFieldWidgetState> _endTimeKey =
      new GlobalKey(debugLabel: 'end');

  final int categoryPerRow = 5;
  double gridRatio;
  List<String> categories;
  List<String> platforms;

  /// current tab
  String _category;

  /// current tab index, controls tab color
  int _categorySelected;

  /// platform drop down widget's current value
  String _platform;

  /// platform drop down widget's init value
  int _allPlatformIndex;

  /// time drop down widget's current value
  BetRecordTimeEnum _timeSelected;

  /// pager's current total page, update pager if not match
  int totalPage;

  /// current table's page, update pager if not match
  int tablePage;

  /// widget as variable, rebuild when data change
  Widget tableWidget;

  /// current [tableWidget]'s data
  dynamic _currentTableData;

  /// true after first layout has finished,
  /// global widget state should be initialized
  bool layoutReady = false;

  /// table type, has effect on table and pager's height
  bool allDataTable = true;

  bool _lockAction = false;

  void getPageData(int page, bool force) {
    if (widget.store == null) return;
    if (widget.store.waitForRecordResponse) return;
    if (tablePage == page && !force) return;
    if (_timeSelected == BetRecordTimeEnum.custom &&
        !checkDateRange(_startTimeKey.currentState.getInput,
            _endTimeKey.currentState.getInput)) {
      Future.delayed(Duration(milliseconds: 200)).then(
        (value) => callToastError(localeStr.betsFieldDateError),
      );
      return;
    }
    BetRecordForm form = BetRecordForm(
      categoryId: widget.store.typeList
          .singleWhere((type) => type.label == _category)
          .categoryId,
      platform: (_platform == platforms[_allPlatformIndex])
          ? 'all'
          : _platform.toLowerCase(),
      time: _timeSelected,
      page: page,
      startTime: (_timeSelected == BetRecordTimeEnum.custom)
          ? _startTimeKey.currentState.getInput
          : null,
      endTime: (_timeSelected == BetRecordTimeEnum.custom)
          ? _endTimeKey.currentState.getInput
          : null,
    );
    debugPrint('bet query form: $form');
    widget.store.getRecord(form);
  }

  /// update drop down values when tab change
  void switchCategory(int categoryIndex, {bool force = false}) {
    if ((_categorySelected == categoryIndex || _lockAction) && !force) return;
    // set selected category
    _categorySelected = categoryIndex;
    _category = categories[_categorySelected];

    // reset platform drop down if category changed
    if (!force) {
      _platform = null;
      _allPlatformIndex = null;
      _platformKey.currentState?.setSelected = _platform;
    }

    _createPlatformList(!force);

    // update view
    setState(() {});
  }

  void _createPlatformList(bool resetSelected) {
    // find category's platform list
    Map platformMap = widget.store.typeList
        .singleWhere((element) => element.label == _category)
        .platformMap;
    platforms = (platformMap != null && platformMap.isNotEmpty)
        ? platformMap.values.map((value) => '$value').toList()
        : [];

    if (_allPlatformIndex == null) {
      // set platform to ALL
      if (platforms.isNotEmpty && platforms.contains('ALL')) {
        var allIndex = platforms.indexOf('ALL');
        platforms.removeAt(allIndex);
        platforms.insert(allIndex, localeStr.betsSpinnerOptionAllPlatform);
        _allPlatformIndex = allIndex;
        debugPrint('$_category platforms: ${platforms.length}');
//      debugPrint('$_category platform: $platforms');
      }
    }

    if ((_platform == null && _allPlatformIndex != null) ||
        _platform == platforms[_allPlatformIndex]) {
      // set selected to ALL
      _platform = platforms[_allPlatformIndex];
      debugPrint(
          'reset selected platform: $_platform, index: $_allPlatformIndex');
    }

    // update drop down value after view had rebuild
    if (_platform != null) {
      Future.delayed(Duration(milliseconds: 100), () {
        _platformKey.currentState?.setSelected = _platform;
      });
    }
  }

  /// update table and pager height when table type changes
  void checkTableHeight() {
    if (_platform == platforms[_allPlatformIndex] && !allDataTable) {
      allDataTable = true;
      Future.delayed(Duration(milliseconds: 100), () {
        debugPrint('update state');
        setState(() {});
      });
    } else if (_platform != platforms[_allPlatformIndex] &&
        allDataTable != false) {
      allDataTable = false;
      Future.delayed(Duration(milliseconds: 100), () {
        debugPrint('update state');
        setState(() {});
      });
    }
  }

  void updateCategories(bool force) {
    if (widget.store != null) {
      categories = (widget.store.hasValidData)
          ? widget.store.typeList.map((e) => e.label).toList()
          : [];
      debugPrint('bet categories: ${categories.length}');
      if (categories.isNotEmpty) {
        if (_categorySelected != null &&
            categories.length > _categorySelected) {
          switchCategory(_categorySelected, force: force);
        } else {
          switchCategory(0, force: force);
        }
      }
    }
    if (_allPlatformIndex != null) {
      platforms.replaceRange(_allPlatformIndex, _allPlatformIndex + 1,
          [localeStr.betsSpinnerOptionAllPlatform]);
    }
  }

  @override
  void initState() {
    updateCategories(false);
    _timeSelected = BetRecordTimeEnum.today;

    double gridItemWidth =
        ((Global.device.width - 24) - 8 * (categoryPerRow + 2) - 12) /
            categoryPerRow;
    gridRatio = gridItemWidth / Global.device.comfortButtonHeight;
    debugPrint('grid item width: $gridItemWidth, gridRatio: $gridRatio');
    if (gridRatio > 4.16) gridRatio = 4.16;

    super.initState();
  }

  @override
  void didUpdateWidget(BetRecordDisplay oldWidget) {
    updateCategories(true);
    super.didUpdateWidget(oldWidget);
    if (_currentTableData is BetRecordModel) {
      tableWidget = _buildRecordList(_currentTableData.data);
    } else if (_currentTableData is List) {
      tableWidget = _buildRecordList(_currentTableData);
    } else {
      tableWidget = null;
    }
    _timeKey.currentState?.setSelected = _timeSelected;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.store == null || categories == null || categories.isEmpty) {
      return Center(
        child: WarningDisplay(
          message:
              Failure.internal(FailureCode(type: FailureType.BETS, code: 10))
                  .message,
        ),
      );
    }
    tableWidget ??= _buildRecordList([]);
    return InkWell(
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
          /* Category Tabs */
          Padding(
            padding: const EdgeInsets.fromLTRB(4.0, 20.0, 4.0, 0.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: categoryPerRow,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
                childAspectRatio: gridRatio,
              ),
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return RaisedButton(
                  color: (_categorySelected == index)
                      ? Themes.buttonTextPrimaryColor
                      : Themes.walletBoxButtonColor,
                  textColor: (_categorySelected == index)
                      ? Themes.walletBoxButtonColor
                      : Themes.buttonTextPrimaryColor,
                  child: Text(categories[index]),
                  onPressed: () => switchCategory(index),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 16.0),
            child: Container(
              decoration: Themes.layerShadowDecorRound,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 24.0),
                  /* Platform Option */
                  if (platforms != null && platforms.isNotEmpty)
                    CustomizeDropdownWidget(
                      key: _platformKey,
                      horizontalInset: 56.0,
                      prefixText: localeStr.betsSpinnerTitlePlatform,
                      prefixTextSize: FontSize.SUBTITLE.value,
                      optionValues: platforms,
                      defaultValueIndex: _allPlatformIndex,
                      changeNotify: (data) {
                        // clear text field focus
                        FocusScope.of(context).requestFocus(new FocusNode());
                        // set selected data
                        _platform = data;
                      },
                    ),
                  /* Time Option */
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomizeDropdownWidget(
                      key: _timeKey,
                      horizontalInset: 56.0,
                      prefixText: localeStr.betsSpinnerTitleTime,
                      prefixTextSize: FontSize.SUBTITLE.value,
                      optionValues: BetRecordTimeEnum.list,
                      optionStrings:
                          BetRecordTimeEnum.list.map((e) => e.label).toList(),
                      changeNotify: (data) {
                        // clear text field focus
                        FocusScope.of(context).requestFocus(new FocusNode());
                        // set selected data
                        _timeSelected = data;
                      },
                    ),
                  ),
                  if (_timeSelected == BetRecordTimeEnum.custom)
                    /* Start Date Field */
                    //TODO add calender chooser as postfix
                    new CustomizeFieldWidget(
                      key: _startTimeKey,
                      fieldType: FieldType.Date,
                      horizontalInset: 56.0,
                      hint: localeStr.centerTextTitleDateHint,
                      persistHint: false,
                      prefixText: localeStr.betsFieldTitleStartTime,
                      prefixTextSize: FontSize.SUBTITLE.value,
                      maxInputLength: 10,
                    ),
                  if (_timeSelected == BetRecordTimeEnum.custom)
                    /* End Date Field */
                    //TODO add calender chooser as postfix
                    new CustomizeFieldWidget(
                      key: _endTimeKey,
                      fieldType: FieldType.Date,
                      horizontalInset: 56.0,
                      persistHint: false,
                      hint: localeStr.centerTextTitleDateHint,
                      prefixText: localeStr.betsFieldTitleEndTime,
                      prefixTextSize: FontSize.SUBTITLE.value,
                      maxInputLength: 10,
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            height: Global.device.comfortButtonHeight,
                            child: RaisedButton(
                              child: Text(localeStr.btnQueryNow),
                              onPressed: () => getPageData(1, true),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 8.0),
                    child: StreamBuilder(
                      key: _streamKey,
                      stream: widget.store.dataStream,
                      builder: (_, snapshot) {
//                debugPrint(snapshot.data);
                        if (snapshot != null &&
                            snapshot.data != null &&
                            snapshot.data != _currentTableData) {
                          debugPrint(
                              'building table, type: ${snapshot.data.runtimeType}');
                          _currentTableData = snapshot.data;
                          if (snapshot.data == null) {
                            tableWidget = _buildRecordList([]);
                          } else if (snapshot.data is List) {
                            totalPage = 0;
                            tablePage = 0;
                            debugPrint('update list table, reset pager widget');
                            if (layoutReady && pagerKey.currentState != null) {
                              Future.delayed(Duration(milliseconds: 200), () {
                                pagerKey.currentState.updateTotalPage = 0;
                              });
                            }
                            checkTableHeight();
                            tableWidget = _buildRecordList(snapshot.data);
                          } else if (snapshot.data is BetRecordModel) {
                            totalPage = snapshot.data.lastPage;
                            tablePage = snapshot.data.currentPage;
                            debugPrint(
                                'update model table, page: $tablePage/$totalPage');
                            if (layoutReady && pagerKey.currentState != null) {
                              Future.delayed(Duration(milliseconds: 200), () {
                                pagerKey.currentState.updateTotalPage =
                                    totalPage;
                                pagerKey.currentState.updateCurrentPage =
                                    snapshot.data.currentPage;
                              });
                            }
                            checkTableHeight();
                            tableWidget = _buildRecordList(snapshot.data.data);
                          }
                        }
                        return tableWidget;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        PagerWidget(
                          pagerKey,
                          horizontalInset: 20.0,
                          onAction: (page) => getPageData(page, false),
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
    );
  }

  Widget _buildRecordList(List list) {
    if (list.length > 1) {
      List<String> sumKey = ['total', 'sumTotal'];
      list.sort((a, b) {
        var num1 = (sumKey.contains('${a.key}')) ? 1 : 0;
        var num2 = (sumKey.contains('${b.key}')) ? 1 : 0;
        return num1.compareTo(num2);
      });
//      debugPrint('test bet record sort: $list');
    }
    return BetRecordDisplayList(
      dataList: list,
      isAllData: allDataTable,
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    layoutReady = true;
  }
}
