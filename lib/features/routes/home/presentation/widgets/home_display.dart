import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:provider/provider.dart';

import '../state/home_store.dart';
import 'home_display_provider.dart';
import 'home_logo_bar.dart';
import 'home_widget_banner.dart';
import 'home_widget_marquee.dart';
import 'home_widget_size_calc.dart';
import 'home_widget_tabs.dart';

class HomeDisplay extends StatefulWidget {
  HomeDisplay({Key key}) : super(key: key);

  @override
  _HomeDisplayState createState() => _HomeDisplayState();
}

class _HomeDisplayState extends State<HomeDisplay> {
  final Key _scaffoldKey = new UniqueKey();
  final GlobalKey<HomeWidgetTabsState> _tabsKey =
      new GlobalKey(debugLabel: 'hometabs');

  HomeStore _store;
  HomeWidgetBanner _bannerWidget;
  HomeWidgetMarquee _marqueeWidget;
  HomeWidgetSizeCalc _sizeCalc;

  List banners;
  List marquees;
  List tabs;

  @override
  void initState() {
    _sizeCalc = HomeWidgetSizeCalc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _store ??= Provider.of<HomeDisplayProvider>(context).store;
    return Scaffold(
      key: _scaffoldKey,
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (headerCtx, innerBoxIsScrolled) {
          return [
            SliverPersistentHeader(
              pinned: true,
              delegate: _HomeLogoBarDelegate(
                logoBar: HomeLogoBar(),
                barHeight: _sizeCalc.logoBarHeight,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: _sizeCalc.bannerHeight,
                child: Stack(
                  children: [
                    StreamBuilder(
                      stream: _store.bannerStream,
                      initialData: _store.banners,
                      builder: (ctx, _) {
                        if (banners != _store.banners) {
                          banners = _store.banners;
                          _bannerWidget = HomeWidgetBanner(
                            banners: banners,
                            onBannerClicked: (url) => _widgetUrlCheck(url),
                          );
                        }
                        _bannerWidget ??=
                            HomeWidgetBanner(onBannerClicked: (_) {});
                        return _bannerWidget;
                      },
                    ),
                    Positioned(
                      bottom: 0,
                      child: StreamBuilder(
                        stream: _store.marqueeStream,
                        initialData: _store.marquees,
                        builder: (ctx, _) {
                          if (marquees != _store.marquees) {
                            marquees = _store.marquees;
                            _marqueeWidget = HomeWidgetMarquee(
                              marquees: marquees,
                              onMarqueeClicked: (url) => _widgetUrlCheck(url),
                            );
                          }
                          _marqueeWidget ??= HomeWidgetMarquee();
                          return _marqueeWidget;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Container(
          constraints: BoxConstraints(maxHeight: _sizeCalc.pageMaxHeight),
          child: HomeWidgetTabs(key: _tabsKey, tabs: _store.homeTabs),
        ),
      ),
    );
  }

  void _widgetUrlCheck(String url) {
    debugPrint('home widget url check: $url');
    String fixUrl;
    if (url.contains(Global.DOMAIN_NAME)) {
      fixUrl = url.substring(
          url.indexOf(Global.DOMAIN_NAME) + Global.DOMAIN_NAME.length);
    } else if (!url.startsWith('/')) {
      fixUrl = '/$url';
    } else {
      fixUrl = url;
    }
    _widgetUrlNavigate(
      url.contains('/api/open/'),
      fixUrl.replaceAll('/api/open/', ''),
    );
  }

  void _widgetUrlNavigate(bool openGame, String url) {
    debugPrint('home widget url: $url, isGame: $openGame');
    if (openGame) {
      if (!getAppGlobalStreams.hasUser) {
        callToastInfo(localeStr.messageErrorNotLogin);
        return;
      } else {
        _openGame(url);
      }

      /// Show game category view
    } else if (url.startsWith('/gamelist/')) {
      callToast(localeStr.urlActionNotSupported);
      MyLogger.debug(msg: 'Found unsupported Game URL: $url');

      /// Jump to promo page with promo id if provided
    } else if (url.startsWith('/promo/')) {
      int itemId = url.substring(url.lastIndexOf('/') + 1, url.length).strToInt;
      debugPrint('url promo id: $itemId');
      RouterNavigate.navigateToPage(
        RoutePage.promo,
        arg: (itemId > 0) ? PromoRouteArguments(openPromoId: itemId) : null,
      );

      /// Jump to store page with product id if provided
    } else if (url.startsWith('/mall/')) {
      int itemId = url.substring(url.lastIndexOf('/') + 1, url.length).strToInt;

      if (!getAppGlobalStreams.hasUser) {
        callToastInfo(localeStr.messageErrorNotLogin);
        return;
      }
      debugPrint('url mall id: $itemId');
      RouterNavigate.navigateToPage(
        RoutePage.sideStore,
        arg: (itemId > 0) ? StoreRouteArguments(showProductId: itemId) : null,
      );

      /// Jump to route page if path name exist
    } else {
      RoutePage newRoute = url.urlToRoutePage;
      debugPrint('checking url to app route: $newRoute');
      if (newRoute != null) {
        RouterNavigate.navigateToPage(newRoute);
      } else {
        callToast(localeStr.urlActionNotSupported);
        MyLogger.debug(msg: 'Found unsupported Route URL: $url');
      }
    }
  }

  void _openGame(String url) {
    final gameParam = url.split('/');
    debugPrint('game url query: $gameParam');

    /// Open game's web page if game can be found in stored map
    if (gameParam.length == 3 &&
        _store.hasGameInMap(
          gameParam.take(2).join('/0'),
          gameParam.last.strToInt,
        )) {
      final gameUrl = url.substring(url.indexOf('.com/') + 4);
      debugPrint('opening game: $gameUrl');
      _store.getGameUrl(gameUrl);
      return;

      /// Jump to game platform page
    } else if (gameParam.length == 2) {
      if (url == 'va/slot') {
        _tabsKey?.currentState?.jumpToTab = 2;
        return;
      }
    }

    callToast(localeStr.urlActionNotSupported);
    MyLogger.debug(msg: 'Found unsupported Game URL: $url');
  }
}

class _HomeLogoBarDelegate extends SliverPersistentHeaderDelegate {
  _HomeLogoBarDelegate({this.logoBar, this.barHeight});

  final HomeLogoBar logoBar;
  final double barHeight;

  /// this will shrink the header to 75% and leave 25% for body extent
  @override
  double get minExtent => barHeight * 0.75;

  @override
  double get maxExtent => barHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(child: logoBar);
  }

  @override
  bool shouldRebuild(_HomeLogoBarDelegate oldDelegate) {
    return false;
  }
}
