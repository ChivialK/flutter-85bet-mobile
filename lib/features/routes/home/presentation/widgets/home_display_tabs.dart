import 'dart:async' show StreamController, Timer;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/tabs_page_control_widget.dart';
import 'package:flutter_85bet_mobile/utils/regex_util.dart';

import '../../data/models/game_category_model.dart';
import '../state/home_store.dart';
import 'home_display_size_calc.dart';
import 'home_display_tab_page.dart';
import 'home_display_tab_promo.dart';
import 'home_display_tab_website.dart';
import 'home_store_inherit_widget.dart';

/// Main view of the game area
/// Creates a [TabBar] widget to switch between each game category
/// Creates a [ConstrainedBox] to contain tab's page view
/// @author H.C.CHIANG
/// @version 2020/6/19
class HomeDisplayTabs extends StatefulWidget {
  final HomeDisplaySizeCalc sizeCalc;
  final List<GameCategoryModel> tabs;

  HomeDisplayTabs({
    Key key,
    this.tabs,
    @required this.sizeCalc,
  }) : super(key: key);

  @override
  HomeDisplayTabsState createState() => HomeDisplayTabsState();
}

class HomeDisplayTabsState extends State<HomeDisplayTabs>
    with SingleTickerProviderStateMixin {
  final GlobalKey _tabBarKey = new GlobalKey(debugLabel: 'tabbar');
  final StreamController<List<String>> _updateController =
      StreamController<List<String>>.broadcast();

  Timer _timer;
  TabController _tabController;
  PageController _pageController;
  Widget _tabBar;

  int _currentIndex;
  String _preType;
  String _currentType;

  void _tabListener() {
    // Set [_currentType] to change tab bar item color
    try {
      int index = _tabController.index;
      if (index == _currentIndex) return;
      _currentIndex = index;
      _preType = _currentType;
      _currentType = widget.tabs[index].type;
      _updateController.sink.add([_preType, _currentType]);
    } on Exception {}
  }

  void findPage(String category) {
    int index = widget.tabs.indexWhere((element) => element.type == category);
    debugPrint('find category index: $index');
    if (index != -1) _pageController.jumpToPage(index);
  }

  void initializeTabController() {
    if (widget.tabs != null) {
//      debugPrint('game tabs = ${widget.tabs}');
//      debugPrint('game tabs count = ${widget.tabs.length}');
      _currentType = widget.tabs[0].type;
      _pageController = new PageController();
      _tabController =
          new TabController(length: widget.tabs.length, vsync: this);
      _tabController.addListener(() => _tabListener());
    }
  }

  @override
  void initState() {
    super.initState();
    initializeTabController();
  }

  @override
  void didUpdateWidget(HomeDisplayTabs oldWidget) {
    debugPrint('home display tab update');
    super.didUpdateWidget(oldWidget);
    if (_tabController == null) initializeTabController();
  }

  @override
  void dispose() {
    if (!mounted) {
      try {
        MyLogger.print(
            msg: 'disposing controller...', tag: "HomeDisplayUserTabs");
        _updateController.close();
        if (_pageController != null) {
          _pageController.dispose();
          _pageController = null;
        }
        if (_tabController != null) {
          _tabController.removeListener(() => _tabListener());
          _tabController.dispose();
          _tabController = null;
        }
      } catch (e) {
        MyLogger.warn(msg: 'dispose error: $e', tag: "HomeDisplayUserTabs");
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = HomeStoreInheritedWidget.of(context).store;
    if (store == null) {
      _tabBar = Center(
        child: WarningDisplay(
          message:
              Failure.internal(FailureCode(type: FailureType.INHERIT)).message,
        ),
      );
    } else if (_tabController != null) {
      // build tab bar when game category is not null
      _tabBar = _buildTabBar(store);
    } else if (_tabController == null && _timer == null) {
      // set a period check timer and wait for data initialized
      _timer ??= Timer.periodic(Duration(milliseconds: 500), (_) {
//        debugPrint('home display tab running check...');
        if (store != null && store.waitForInitializeData == false) {
          if (mounted) {
            setState(() {
              _tabBar = SizedBox.shrink();
            });
            _timer?.cancel();
            debugPrint('home display tab check timer canceled');
          }
        }
      });
    }
    _tabBar ??= Center(child: CircularProgressIndicator());
    return _tabBar;
  }

  Widget _buildTabBar(HomeStore store) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /// category tab bar
          Padding(
            padding: const EdgeInsets.fromLTRB(4.0, 0, 4.0, 1.0),
            child: Container(
              /* Tab bar constraints */
              constraints: BoxConstraints(
                maxHeight: widget.sizeCalc.barMaxHeight,
                minWidth: widget.sizeCalc.barMinWidth,
                maxWidth: widget.sizeCalc.barMaxWidth,
              ),
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              /* Rotate to vertical */
              child: RotatedBox(
                quarterTurns: 1,
                child: TabBar(
                  key: _tabBarKey,
                  labelStyle: TextStyle(fontSize: FontSize.NORMAL.value + 1),
                  labelPadding: const EdgeInsets.only(top: 2.0),
                  unselectedLabelColor: themeColor.homeTabTextColor,
                  labelColor: themeColor.homeTabSelectedTextColor,
                  indicatorColor: Colors.transparent, // hide indicator
                  controller: _tabController,
                  isScrollable: true,
                  /* Generate Category Tabs */
                  tabs: widget.tabs.map((data) => _createTab(data)).toList(),
                  onTap: (index) {
                    _pageController.jumpToPage(index);
                  },
                ),
              ),
            ),
          ),

          /// platform page control
          Container(
            margin: const EdgeInsets.only(top: 6.0, bottom: 4.0),
            constraints: BoxConstraints(
//              minWidth: widget.sizeCalc.pageMinWidth,
              maxWidth: widget.sizeCalc.pageMaxWidth,
//              minHeight: widget.sizeCalc.pageMinHeight,
              maxHeight: widget.sizeCalc.pageMaxHeight,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: TabsPageControlWidget(
                    pageController: _pageController,
                    tabController: _tabController,
                    children: widget.tabs.map((category) {
                      switch (category.pageType) {
                        case GamePageType.Games:
                          return HomeDisplayTabPage(
                            pageMaxWidth: widget.sizeCalc.pageMaxWidth,
                            category: category.type,
                            addSearchListener: true,
                          );
                        case GamePageType.Promo:
                          return HomeDisplayTabPromo(
                            onNavigateCallBack: () {
                              _pageController?.jumpToPage(0);
                            },
                          );
                        case GamePageType.Website:
                          return HomeDisplayTabWebsite(
                            url: Global.CURRENT_BASE,
                            linkHint: localeStr.gameCategoryWebHint,
                          );
                        default:
                          return SizedBox.shrink();
                      }
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createTab(GameCategoryModel category) {
//    debugPrint('creating tab: $category');
    return RotatedBox(
      quarterTurns: 3, // rotate back to normal display
      child: SizedBox(
        height: 48.0 * Global.device.widthScale,
        child: Tab(
          child: Container(
            alignment: Alignment.center,
            width: widget.sizeCalc.barItemWidth,
            // vertical space between tabs
            margin: const EdgeInsets.symmetric(vertical: 3.0),
            decoration: BoxDecoration(
              border:
                  Border.all(width: 2.0, color: themeColor.homeTabDividerColor),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    color: themeColor.homeTabIconBgColor,
                    padding: const EdgeInsets.all(4.0),
                    child: SizedBox(
                      width: 24.0,
                      height: 20.0,
                      child: (category.iconUrl.isNotEmpty)
                          ? networkImageBuilder(
                              category.iconUrl,
                              imgColor: themeColor.homeTabIconColor,
                            )
                          : (category.assetPath != null)
                              ? Image.asset(
                                  category.assetPath,
                                  color: themeColor.homeTabIconColor,
                                )
                              : (category.iconCode != null)
                                  ? Icon(
                                      category.iconCode,
                                      color: themeColor.homeTabIconColor,
                                    )
                                  : Icon(
                                      Icons.add,
                                      color: themeColor.homeTabIconColor,
                                    ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: StreamBuilder<List<String>>(
                    stream: _updateController.stream,
                    initialData: [_currentType],
                    builder: (ctx, update) {
                      String type = category.type;
                      return Container(
                        alignment: Alignment.centerLeft,
                        color: (update.data.contains(type))
                            ? (type == _currentType)
                                ? themeColor.homeTabIconBgColor
                                : themeColor.homeTabBgColor
                            : themeColor.homeTabBgColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: RichText(
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.visible,
                            text: TextSpan(
                                text: category.label,
                                style: TextStyle(
                                  fontSize: (Global.lang.isChinese)
                                      ? (category.label.countLength >= 6)
                                          ? FontSize.NORMAL.value
                                          : FontSize.SUBTITLE.value
                                      : (category.label.countLength >= 6)
                                          ? FontSize.SMALLER.value
                                          : FontSize.NORMAL.value,
                                  color: (update.data.contains(type))
                                      ? (type == _currentType)
                                          ? themeColor.homeTabSelectedTextColor
                                          : themeColor.homeTabTextColor
                                      : themeColor.homeTabTextColor,
                                )),
                          ),
                        ),
                      );
                    },
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
