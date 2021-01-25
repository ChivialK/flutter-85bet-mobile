import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/routes/home/data/models/game_category_model.dart';
import 'package:flutter_85bet_mobile/features/routes/home/presentation/widgets/home_tab_nav_member.dart';
import 'package:flutter_85bet_mobile/mylogger.dart';

import '../state/home_store.dart';
import 'home_display_provider.dart';
import 'home_tab_favorite_page.dart';
import 'home_tab_game_page.dart';
import 'home_tab_recommend_page.dart';
import 'tabs/tab_control.dart';
import 'tabs/tab_item.dart';

class HomeWidgetTabs extends StatefulWidget {
  final List<GameCategoryModel> tabs;

  HomeWidgetTabs({Key key, @required this.tabs}) : super(key: key);

  @override
  HomeWidgetTabsState createState() => HomeWidgetTabsState();
}

class HomeWidgetTabsState extends State<HomeWidgetTabs>
    with SingleTickerProviderStateMixin {
  final Key _barKey = UniqueKey();
  final Key _viewKey = UniqueKey();

  final TabControl tabControl = TabControl();

  HomeStore _store;
  TabController _tabController;
  BoxConstraints _itemConstraints;

  set jumpToTab(int index) => _tabController?.animateTo(index);

  void initTabControl() {
    // Create TabController for getting the index of current tab
    _tabController = TabController(length: widget.tabs.length, vsync: this);
    _tabController.addListener(() {
      tabControl.setTabIndex = _tabController.index;
    });
  }

  @override
  void initState() {
    _itemConstraints = BoxConstraints.tight(Size(
      Global.device.width / 4,
      Global.APP_MENU_HEIGHT * 1.5,
    ));
    super.initState();
  }

  @override
  void dispose() {
    try {
      _tabController?.dispose();
    } catch (e) {
      MyLogger.debug(
        msg: 'dispose home tab controller has exception: $e',
        tag: "HomeDisplayTabs",
      );
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _store ??= Provider.of<HomeDisplayProvider>(context).store;
    if (_tabController == null) {
      if (widget.tabs != null && widget.tabs.length > 1) {
        initTabControl();
      } else {
        return Container();
      }
    }
    return Column(
      children: [
        ChangeNotifierProvider<TabControl>.value(
          value: tabControl,
          child: TabBar(
            key: _barKey,
            controller: _tabController,
            unselectedLabelColor: themeColor.homeTabTextColor,
            labelPadding: EdgeInsets.zero,
            labelColor: themeColor.homeTabSelectedTextColor,
            labelStyle: TextStyle(fontSize: FontSize.SUBTITLE.value),
            indicator:
                UnderlineTabIndicator(borderSide: const BorderSide(width: 0)),
            indicatorWeight: 0,
            // onTap: (index) => tabControl.setTabIndex = index,
            tabs: List.generate(
              widget.tabs.length,
              (index) => TabItem(
                index: index,
                category: widget.tabs[index].info,
                itemConstraints: _itemConstraints,
              ),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            key: _viewKey,
            controller: _tabController,
            children: widget.tabs.map((category) {
              if (category.info == null) return SizedBox.shrink();
              switch (category.pageType) {
                case GamePageType.Member:
                  return HomeTabNavMember(
                    onNavigateCallBack: () => _tabController.animateTo(2),
                  );
                case GamePageType.Recommend:
                  return HomeTabRecommendPage();
                case GamePageType.Favorite:
                  return HomeTabFavoritePage();
                case GamePageType.Games:
                  return HomeTabGamePage(
                    platform: _store.homePlatformMap[category.type]?.firstWhere(
                        (platform) => platform.site.toLowerCase() == 'va'),
                  );
                default:
                  return SizedBox.shrink();
              }
            }).toList(),
          ),
        ),
      ],
    );
  }
}
