part of 'feature_screen_view.dart';

///@author H.C.CHIANG
///@version 2020/2/26
class ScreenMenuBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _ScreenMenuBarState createState() => _ScreenMenuBarState();

  @override
  Size get preferredSize => Size(Global.device.width, Global.APP_MENU_HEIGHT);
}

class _ScreenMenuBarState extends State<ScreenMenuBar> {
  FeatureScreenInheritedWidget _viewState;
  List<ReactionDisposer> _disposers;
  EventStore _eventStore;

  bool _hideActions = false;
  bool _hideLangOption = false;

  void initDisposers() {
    _disposers = [
      reaction(
          // Observe in page
          // Tell the reaction which observable to observe
          (_) => _viewState.store.pageInfo.hideLanguageOption,
          // Run some logic with the content of the observed field
          (bool disable) {
        if (disable != _hideLangOption) {
          if (mounted) {
            setState(() {
              _hideLangOption = disable;
            });
          } else {
            _hideLangOption = disable;
          }
        }
      }),
      reaction(
          // Observe in page
          // Tell the reaction which observable to observe
          (_) => _viewState.store.pageInfo.hideAppbarActions,
          // Run some logic with the content of the observed field
          (bool hide) {
        if (hide != _hideActions) {
          if (mounted) {
            setState(() {
              _hideActions = hide;
            });
          } else {
            _hideActions = hide;
          }
        }
      }),
    ];
  }

//  @override
//  void didUpdateWidget(ScreenMenuBar oldWidget) {
//    _viewState = null;
//    _eventStore = null;
//    if (_disposers != null) {
//      _disposers.forEach((d) => d());
//      _disposers.clear();
//      _disposers = null;
//    }
//    super.didUpdateWidget(oldWidget);
//  }

  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _viewState ??= FeatureScreenInheritedWidget.of(context);
    _eventStore ??= _viewState?.eventStore;
    if (_disposers == null) initDisposers();
    return AppBar(
      /* App bar Icon */
      title: Image.asset(Res.iconBarLogo, scale: 2.5),
      titleSpacing: 0,
      centerTitle: false,
      /* Appbar Title */
//      flexibleSpace: FlexibleSpaceBar(
//        centerTitle: true,
//        title: Observer(builder: (_) {
//          final page = viewState.store.pageInfo ?? RoutePage.template.value;
//          return Container(
//            width: Global.device.width / 5,
//            height: Global.APP_BAR_HEIGHT / 2,
//            child: FittedBox(
//              child: Text(
//                page.title,
//                style: TextStyle(fontSize: FontSize.MESSAGE.value),
//              ),
//            ),
//          );
//        }),
//        titlePadding: EdgeInsetsDirectional.only(
//          start: Global.APP_BAR_HEIGHT / 3,
//          bottom: (Global.APP_BAR_HEIGHT / 3) - 4,
//        ),
//      ),
      /* App bar Left Actions */
      leading: Observer(
        builder: (_) {
          if (_viewState.store.showMenuDrawer) {
            return IconButton(
              icon: Icon(Icons.menu, color: themeColor.drawerIconColor),
              tooltip: localeStr.btnMenu,
              onPressed: () {
                _viewState.scaffoldKey.currentState.openDrawer();
              },
            );
          } else {
            return IconButton(
              icon:
                  Icon(Icons.arrow_back, color: themeColor.drawerIconSubColor),
              tooltip: localeStr.btnBack,
              onPressed: () {
                RouterNavigate.navigateBack();
              },
            );
          }
        },
      ),
      /* App bar Right Actions */
      actions: <Widget>[
        if (_eventStore != null)
          Container(
//            padding: const EdgeInsets.only(right: 12.0),
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Transform.scale(
              scale: 0.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(36.0),
                child: GestureDetector(
                  onTap: () {
                    if (_eventStore.canShowAds) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => new AdDialog(
                          ads: _eventStore.ads,
                          initCheck: _eventStore.checkSkip,
                          onClose: (skipNextTime) {
                            debugPrint('ads dialog close, skip=$skipNextTime');
                            _eventStore.setSkipAd(skipNextTime);
                            _eventStore.adsDialogClose();
                          },
                        ),
                      );
                    }
                  },
                  child: networkImageBuilder(
                    'images/AD_ICON2.png',
                    imgScale: 3.0,
                  ),
                ),
              ),
            ),
          ),
        Visibility(
          visible: !_hideLangOption,
          maintainState: true,
          child: Align(
            alignment: Alignment.center,
            child: ScreenMenuLangWidget(),
          ),
        ),
        Visibility(
          visible: !_hideActions,
          maintainState: true,
          child: Align(
            alignment: Alignment.center,
            child: ScreenMenuBarAction(_viewState),
          ),
        ),
      ],
    );
  }
}
