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
    ScreenNavigationBarItem.deposit,
    ScreenNavigationBarItem.member,
    ScreenNavigationBarItem.service,
  ];

  FeatureScreenStore _store;
  Widget _barWidget;
  String _locale;
  int _navIndex = 0;

  void _itemTapped(int index, bool hasUser) {
    var item = _tabs[index];
    debugPrint('tapped item: ${item.value}');
    if (item == ScreenNavigationBarItem.more) {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => new MoreDialog(_store),
      );
    } else if (item.value.route == null) {
      callToastInfo(localeStr.workInProgress);
    } else {
      var value = item.value;
      if (value.isUserOnly && !hasUser)
        RouterNavigate.navigateToPage(RoutePage.login);
      else if (item == ScreenNavigationBarItem.service)
        RouterNavigate.navigateToPage(
          value.route,
          arg: value.route.value.routeArg
        );
      else
        RouterNavigate.navigateToPage(value.route);
    }
  }

  @override
  void initState() {
    _locale = Global.lang;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    debugPrint('triggered nav bar rebuild');
    final viewState = FeatureScreenInheritedWidget.of(context);
    _store ??= viewState.store;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.0, color: Themes.defaultAccentColor),
        ),
      ),
      child: StreamBuilder<bool>(
          stream: viewState.store.loginStateStream,
          initialData: false,
          builder: (context, snapshot) {
            if (_barWidget != null && _locale != Global.lang) {
              _barWidget = _buildWidget(snapshot.data);
              _locale = Global.lang;
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
          debugPrint('store state user: ${_store.userStatus}');
          _itemTapped(index, _store.hasUser);
        },
        currentIndex: _navIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: FontSize.NORMAL.value,
        unselectedFontSize: FontSize.NORMAL.value,
        unselectedItemColor: Themes.navigationColor,
        fixedColor: Themes.navigationColorFocus,
        backgroundColor: Themes.defaultAppbarColor,
        items: List.generate(_tabs.length, (index) {
          var itemValue = _tabs[index].value;
          return _createBarItem(itemValue, labels[index], false, _store);
        }),
      );
    });
  }

  BottomNavigationBarItem _createBarItem(RouteListItem itemValue, String title,
      bool addBadge, FeatureScreenStore store) {
    return BottomNavigationBarItem(
      icon: (addBadge)
          ? Badge(
              showBadge: store.hasNewMessage,
              badgeColor: Themes.hintHighlightRed,
              badgeContent: Container(
                margin: const EdgeInsets.all(1.0),
                child: Icon(
                  const IconData(0xf129, fontFamily: 'FontAwesome'),
                  color: Colors.white,
                  size: 8.0,
                ),
              ),
              padding: EdgeInsets.zero,
              position: BadgePosition.topRight(top: -5, right: -6),
              child: Icon(itemValue.iconData, size: 30),
            )
          : Icon(itemValue.iconData, size: 30),
      title: Padding(
        padding: EdgeInsets.only(top: 2.0),
        child:
            Text(title ?? itemValue.title ?? itemValue.route?.pageTitle ?? '?'),
      ),
    );
  }
}
