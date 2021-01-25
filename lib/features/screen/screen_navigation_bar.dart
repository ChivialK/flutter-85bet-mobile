part of 'feature_screen_view.dart';

///
///@author H.C.CHIANG
///@version 2020/6/2
///
class ScreenNavigationBar extends StatefulWidget {
  const ScreenNavigationBar();

  @override
  _ScreenNavigationBarState createState() => _ScreenNavigationBarState();
}

class _ScreenNavigationBarState extends State<ScreenNavigationBar> {
  static final List<ScreenNavigationBarItem> _tabs = [
    ScreenNavigationBarItem.home,
    ScreenNavigationBarItem.promo,
    ScreenNavigationBarItem.member,
    ScreenNavigationBarItem.service,
  ];

  FeatureScreenStore _store;
  String _locale;

  EventStore _eventStore;

  Widget _barWidget;
  int _navIndex = 0;

  void _itemTapped(int index, bool hasUser) {
    var item = _tabs[index];
    debugPrint('tapped item: ${item.value}');
    if (item.value.route == null) {
      callToastInfo(localeStr.workInProgress);
    } else {
      var value = item.value;
      if (value.isUserOnly && !hasUser) {
        RouterNavigate.navigateToPage(RoutePage.login);
      } else {
        RouterNavigate.navigateToPage(value.route);
      }
    }
  }

  @override
  void initState() {
    _locale = Global.lang.code;
    super.initState();
  }

  @override
  void didUpdateWidget(ScreenNavigationBar oldWidget) {
    _store = null;
    _eventStore = null;
    _barWidget = null;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (_store == null || _eventStore == null) {
      final viewState = FeatureScreenInheritedWidget.of(context);
      _store ??= viewState?.store;
      _eventStore ??= viewState?.eventStore;
    }
    return Container(
      height: Global.APP_NAV_HEIGHT,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.0, color: themeColor.defaultAccentColor),
        ),
      ),
      child: StreamBuilder<bool>(
          stream: _store.loginStateStream,
          initialData: false,
          builder: (context, snapshot) {
            if (_barWidget != null && _locale != Global.lang.code) {
              _barWidget = _buildWidget(snapshot.data);
              _locale = Global.lang.code;
            }
            _barWidget ??= _buildWidget(snapshot.data);
            return _barWidget;
          }),
    );
  }

  Widget _buildWidget(bool hasUser) {
    List<String> labels = _tabs.map((e) => e.value.title).toList();
    return Observer(builder: (_) {
      // observe nav index to change icon icon color (setState does not work).
      final index = _store.navIndex;
      if (index >= 0) _navIndex = index;
      // monitor observable value to show event dialog
      return BottomNavigationBar(
        onTap: (index) {
          debugPrint('navigate bar has user: ${_store.hasUser}');
          _itemTapped(index, _store.hasUser);
        },
        currentIndex: _navIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: FontSize.NORMAL.value,
        unselectedFontSize: FontSize.NORMAL.value,
        unselectedItemColor: themeColor.navigationColor,
        fixedColor: themeColor.navigationColorFocus,
        backgroundColor: themeColor.defaultAppbarColor,
        items: List.generate(_tabs.length, (index) {
          var itemValue = _tabs[index].value;
          return _createBarItem(
            itemValue: itemValue,
            title: labels[index],
            addBadge: itemValue.id == RouteEnum.MEMBER &&
                getAppGlobalStreams.hasNewMessage,
          );
        }),
      );
    });
  }

  BottomNavigationBarItem _createBarItem({
    @required RouteListItem itemValue,
    @required String title,
    @required bool addBadge,
  }) {
    return BottomNavigationBarItem(
      icon: (addBadge)
          ? Badge(
              showBadge: getAppGlobalStreams.hasNewMessage,
              badgeColor: themeColor.hintHighlightRed,
              badgeContent: Container(
                margin: const EdgeInsets.all(1.0),
                child: Icon(
                  const IconData(0xf129, fontFamily: 'FontAwesome'),
                  color: Colors.white,
                  size: 8.0,
                ),
              ),
              padding: EdgeInsets.zero,
              position: BadgePosition.topEnd(top: -5, end: -6),
              child: Icon(itemValue.iconData, size: 30),
            )
          : Icon(itemValue.iconData, size: 30),
      title: Row(
        children: [
          Expanded(
            child: AutoSizeText.rich(
              TextSpan(
                  text: title ??
                      itemValue.title ??
                      itemValue.route?.pageTitle ??
                      '?'),
              style: TextStyle(fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
              maxLines: 1,
              minFontSize: FontSize.SMALL.value - 4.0,
              maxFontSize: FontSize.NORMAL.value,
            ),
          ),
        ],
      ),
    );
  }
}
