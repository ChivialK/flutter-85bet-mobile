import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/event/presentation/state/event_store.dart';
import 'package:flutter_85bet_mobile/features/event/presentation/widgets/ad_dialog.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/router/app_navigate.dart';
import 'package:flutter_85bet_mobile/features/update/presentation/state/update_store.dart';
import 'package:flutter_85bet_mobile/injection_container.dart';
import 'package:flutter_85bet_mobile/res.dart';

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

  @override
  void initState() {
    _sizeCalc = HomeDisplaySizeCalc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _store ??= HomeStoreInheritedWidget.of(context).store;
    _eventStore ??= sl.get<EventStore>();
    _updateStore ??= sl.get<UpdateStore>();
    return Stack(
      children: [
        if (_eventStore != null && _updateStore != null)
          StreamBuilder<List>(
            stream: _eventStore.adsStream,
            initialData: _eventStore.ads ?? [],
            builder: (ctx, snapshot) {
              if (snapshot.data != null &&
                  snapshot.data.isNotEmpty &&
                  _eventStore.autoShowAds &&
                  _eventStore.checkSkip == false) {
                print('stream home ads: ${snapshot.data.length}');
                showAdsDialog(new List.from(snapshot.data));
              }
              return SizedBox.shrink();
            },
          ),
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
                    Future.delayed(Duration(milliseconds: 200), () {
                      setState(() {
                        gameTitle = snapshot.data;
                        showGameTitle = gameTitle.isNotEmpty;
                      });
                    });
                  }
                }
              }
              return SizedBox.shrink();
            }),
        if (Res.wallpaper.isNotEmpty)
          Container(
            constraints: BoxConstraints.tight(Size(
              Global.device.width,
              Global.device.featureContentHeight,
            )),
            child:
                FittedBox(fit: BoxFit.fill, child: Image.asset(Res.wallpaper)),
          ),
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
                              onBannerClicked: (openGame, url) {
                                if (openGame) {
                                  debugPrint('opening banner game: $url');
                                  if (_store.hasUser)
                                    _store.getGameUrl(url);
                                  else
                                    callToastInfo(
                                        localeStr.messageErrorNotLogin);
                                } else if (url.startsWith('/gamelist/')) {
                                  debugPrint('search banner platform: $url');
                                  String className = url
                                      .replaceAll('/gamelist/', '')
                                      .replaceAll('/', '-');
                                  debugPrint('banner platform: $className');
                                  _tabsWidgetKey.currentState
                                      ?.findPage(className.split('-')[1]);
                                  _store.showSearchPlatform(className);
                                }
                              },
                            );
                          }
                          _bannerWidget ??= HomeDisplayBanner();
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
                              _marqueeWidget =
                                  HomeDisplayMarquee(marquees: marquees);
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
        if (!showGameTitle)
          Positioned(
            top: _sizeCalc.bannerHeight - 6,
            child: Row(
              children: [
                Transform(
                    transform: Matrix4.diagonal3Values(Global.device.widthScale,
                        Global.device.ratio - 0.15, 1.0),
                    child: Image.asset(
                      Res.shadow,
                      color: Color(0xD0000000),
                    )),
              ],
            ),
          ),
      ],
    );
  }
}
