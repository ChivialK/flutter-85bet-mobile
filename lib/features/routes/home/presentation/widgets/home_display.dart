import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/event/presentation/state/event_store.dart';
import 'package:flutter_85bet_mobile/features/event/presentation/widgets/ad_dialog.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/router/app_global_streams.dart';
import 'package:flutter_85bet_mobile/features/router/app_navigate.dart';
import 'package:flutter_85bet_mobile/features/update/presentation/state/update_store.dart';
import 'package:flutter_85bet_mobile/injection_container.dart';

import '../../data/models/game_category_model.dart';
import '../state/home_store.dart';
import 'home_display_banner.dart';
import 'home_display_marquee.dart';
import 'home_display_size_calc.dart';
import 'home_display_tabs.dart';
import 'home_search_widget.dart';
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
  UpdateStore _updateStore;
  HomeStore _store;
  HomeShortcutWidget _shortcutWidget;
  HomeDisplayBanner _bannerWidget;
  HomeDisplayMarquee _marqueeWidget;
  HomeDisplaySizeCalc _sizeCalc;
  Widget _contentWidget;

  double _screenWidth = Global.device.width;

  List banners;
  List marquees;
  List tabs;

  String gameTitle = '';
  bool showGameTitle = false;
  bool showingAds = false;

  void showAdsDialog(List list) {
    if (showingAds) return;
    if (_updateStore.showingUpdateDialog) {
      Future.delayed(Duration(seconds: 2), () {
        showAdsDialog(list);
      });
    } else {
      Future.delayed(Duration(milliseconds: 500), () {
        if (!mounted)
          showAdsDialog(list);
        else {
          showingAds = true;
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => new AdDialog(
              ads: new List.from(list),
              initCheck: _eventStore.checkSkip,
              onClose: (skipNextTime) {
                debugPrint('ads dialog close, skip=$skipNextTime');
                showingAds = false;
                _eventStore.setAutoShowAds = false;
                _eventStore.setSkipAd(skipNextTime);
                _eventStore.adsDialogClose();
              },
            ),
          );
        }
      });
    }
  }

  void _setGameTitle(String title) {
    try {
      setState(() {
        gameTitle = title;
        showGameTitle = gameTitle.isNotEmpty;
      });
    } on Exception {
      Future.delayed(Duration(milliseconds: 500), () {
        _store.homeGameTitleStream.last.then((value) {
          if (value == title) _setGameTitle(title);
        });
      });
    }
  }

  @override
  void initState() {
    _sizeCalc = HomeDisplaySizeCalc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _store ??= HomeStoreInheritedWidget.of(context).store;
    _eventStore ??= sl.get<EventStore>();
    return Stack(
      children: [
        StreamBuilder<String>(
            stream: _store.homeGameTitleStream,
            initialData: '',
            builder: (context, snapshot) {
              if (snapshot != null &&
                  snapshot.data != null &&
                  gameTitle != snapshot.data) {
                debugPrint('home display stream game title: $snapshot');
                if ((snapshot.data.isEmpty && showGameTitle) ||
                    (snapshot.data.isNotEmpty && !showGameTitle)) {
                  if (mounted) {
                    Future.delayed(Duration(milliseconds: 500), () {
                      _setGameTitle(snapshot.data);
                    });
                  }
                }
              }
              return SizedBox.shrink();
            }),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints.tight(
                Size(_screenWidth, _sizeCalc.bannerHeight),
              ),
              child: IndexedStack(
                index: (showGameTitle) ? 1 : 0,
                children: [
                  Stack(
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
                          _bannerWidget ??=
                              HomeDisplayBanner(onBannerClicked: (_) {});
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
                  if (showGameTitle)
                    ShaderMask(
                      shaderCallback: (rect) {
                        return LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          stops: [0.7, 1.0],
                          colors: [Colors.black, Colors.transparent],
                        ).createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height));
                      },
                      blendMode: BlendMode.dstIn,
                      child: SizedBox(
                          height: _sizeCalc.bannerHeight,
                          child:
                              networkImageBuilder(gameTitle, fit: BoxFit.fill)),
                    ),
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints.tight(
                Size(
                  _screenWidth,
                  Global.device.featureContentHeight - _sizeCalc.bannerHeight,
                ),
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      if (!showGameTitle)
                        Container(
                          child: StreamBuilder<bool>(
                            stream:
                                RouterNavigate.routerStreams.recheckUserStream,
                            initialData: false,
                            builder: (context, snapshot) {
//                debugPrint('checking shortcut widget: ${getRouteUserStreams.lastUser}');
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
                      if (showGameTitle)
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: _sizeCalc.shortcutMaxHeight,
                            maxWidth: Global.device.width,
                          ),
                          child: HomeSearchWidget(
                            onSearch: (searchStr) =>
                                _store.searchGame(searchKey: searchStr),
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
//                              debugPrint('update display tabs: ${snapshot.data}');
                              tabs = new List<GameCategoryModel>.from(
                                  snapshot.data);
                              // use different widget to avoid tab controller's dispose error
                              _contentWidget = new HomeDisplayTabs(
                                key: _tabsWidgetKey,
                                tabs: tabs,
                                sizeCalc: _sizeCalc,
                              );
                            }
                            _contentWidget ??= HomeDisplayTabs(
                                key: _tabsWidgetKey, sizeCalc: _sizeCalc);
                            return _contentWidget;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
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
    } else if (url.contains(Global.DOMAIN_NAME_2)) {
      fixUrl = url.substring(
          url.indexOf(Global.DOMAIN_NAME_2) + Global.DOMAIN_NAME_2.length);
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
    if (url == '/') {
      callToastInfo(localeStr.pageTitleHome);
      return;
    } else if (openGame) {
      if (!getAppGlobalStreams.hasUser) {
        callToastInfo(localeStr.messageErrorNotLogin);
        return;
      } else {
        _openGame(url);
      }

      /// Show game category view
    } else if (url.startsWith('/gamelist/')) {
      List<String> plats = url.split('/');
      debugPrint('platforms: $plats');
      if (plats.length == 3) {
        callToast(localeStr.urlActionNotSupported);
        MyLogger.debug(msg: 'Found unsupported Game URL: $url');
      } else if (plats.length == 4) {
        _tabsWidgetKey.currentState?.findPage(plats[3]);
        Future.delayed(Duration(milliseconds: 1500), () {
          _store.showSearchPlatform('${plats[2]}-${plats[3]}');
        });
      }

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
      return;
    }

    callToast(localeStr.urlActionNotSupported);
    MyLogger.debug(msg: 'Found unsupported Game URL: $url');
  }
}
