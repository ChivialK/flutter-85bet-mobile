import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/event/event_inject.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/routes/home/data/models/game_category_model.dart';

import '../state/home_store.dart';
import 'home_display_banner.dart';
import 'home_display_marquee.dart';
import 'home_display_size_calc.dart';
import 'home_display_tabs.dart';
import 'home_display_user_tabs.dart';
import 'home_shortcut_widget.dart';
import 'home_store_inherit_widget.dart';

class HomeDisplay extends StatefulWidget {
  @override
  _HomeDisplayState createState() => _HomeDisplayState();
}

class _HomeDisplayState extends State<HomeDisplay> {
  final GlobalKey<HomeShortcutWidgetState> _shortcutWidgetKey =
      new GlobalKey<HomeShortcutWidgetState>();
  final GlobalKey<HomeDisplayTabsState> _tabsWidgetKey =
      new GlobalKey<HomeDisplayTabsState>();

  EventStore _eventStore;
  HomeStore _store;
  HomeShortcutWidget _shortcutWidget;
  HomeDisplayBanner _bannerWidget;
  HomeDisplayMarquee _marqueeWidget;
  HomeDisplaySizeCalc _sizeCalc;
  Widget _contentWidget;

  List banners;
  List marquees;
  List tabs;
  bool showingAds = false;

  @override
  void initState() {
    _sizeCalc = HomeDisplaySizeCalc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _store ??= HomeStoreInheritedWidget.of(context).store;
    _eventStore ??= sl.get<EventStore>();
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints.tight(
            Size(Global.device.width, _sizeCalc.bannerHeight),
          ),
          child: Stack(
            children: [
              StreamBuilder(
                stream: _store.bannerStream,
                builder: (ctx, _) {
                  if (banners != _store.banners) {
                    banners = _store.banners;
                    _bannerWidget = HomeDisplayBanner(
                      banners: banners,
                      onBannerClicked: (url) => _widgetUrlCheck(url),
                    );
                  }
                  _bannerWidget ??= HomeDisplayBanner(onBannerClicked: (_) {});
                  return _bannerWidget;
                },
              ),
              Positioned(
                bottom: 0,
                child: StreamBuilder(
                  stream: _store.marqueeStream,
                  builder: (ctx, _) {
                    if (marquees != _store.marquees) {
                      marquees = _store.marquees;
                      _marqueeWidget = HomeDisplayMarquee(
                        marquees: marquees,
                        onMarqueeClicked: (url) => _widgetUrlCheck(url),
                      );
                    }
                    _marqueeWidget ??= HomeDisplayMarquee();
                    return _marqueeWidget;
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          constraints: BoxConstraints.tight(
            Size(Global.device.width,
                Global.device.featureContentHeight - _sizeCalc.bannerHeight),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 6.0),
                    child: StreamBuilder<bool>(
                      stream: RouterNavigate.routerStreams.recheckUserStream,
                      initialData: false,
                      builder: (context, snapshot) {
                        // debugPrint(
                        //     'checking shortcut widget: ${getAppGlobalStreams.lastStatus}');
                        if (_shortcutWidget == null) {
                          _shortcutWidget = HomeShortcutWidget(
                            key: _shortcutWidgetKey,
                            sizeCalc: _sizeCalc,
                            eventStore: _eventStore,
                          );
                        } else if (snapshot.data) {
                          _shortcutWidgetKey.currentState.updateUser();
                          _store.checkHomeTabs();
                          RouterNavigate.resetCheckUser();
                        }
                        return _shortcutWidget;
                      },
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder(
                      stream: _store.tabStream,
                      initialData: (_store.hasUser)
                          ? _store.homeUserTabs
                          : _store.homeTabs,
                      builder: (ctx, snapshot) {
                        if (tabs != snapshot.data) {
//                debugPrint('update display tabs: ${snapshot.data}');
                          tabs =
                              new List<GameCategoryModel>.from(snapshot.data);
                          // use different widget to avoid tab controller's dispose error
                          if (tabs.contains(favoriteCategory)) {
                            _contentWidget = new HomeDisplayUserTabs(
                              tabs: tabs,
                              sizeCalc: _sizeCalc,
                            );
                          } else if (tabs != null) {
                            _contentWidget = new HomeDisplayTabs(
                              key: _tabsWidgetKey,
                              tabs: tabs,
                              sizeCalc: _sizeCalc,
                            );
                          }
                        }
                        _contentWidget ??= HomeDisplayTabs(
                            key: _tabsWidgetKey, sizeCalc: _sizeCalc);
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 6.0),
                          child: _contentWidget,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
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
      // } else if (url.startsWith('/mall/')) {
      //   int itemId = url.substring(url.lastIndexOf('/') + 1, url.length).strToInt;
      //
      //   if (!getAppGlobalStreams.hasUser) {
      //     callToastInfo(localeStr.messageErrorNotLogin);
      //     return;
      //   }
      //   debugPrint('url mall id: $itemId');
      //   RouterNavigate.navigateTo(
      //     RoutePage.sideStore,
      //     arg: (itemId > 0) ? StoreRouteArguments(showProductId: itemId) : null,
      //   );

      /// Jump to route page if path name exist
    } else {
      RoutePage newRoute = url.urlToRoutePage;
      debugPrint('checking url to app route: $newRoute');
      if (newRoute != null) {
        if (newRoute.pageId == RouteEnum.HOME) {
          callToast(localeStr.pageTitleHome);
        } else {
          RouterNavigate.navigateToPage(newRoute);
        }
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
      return;
    }

    callToast(localeStr.urlActionNotSupported);
    MyLogger.debug(msg: 'Found unsupported Game URL: $url');
  }
}
