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
  final Size _iconSize = (Global.device.widthScale > 1)
      ? Size(30.0, 30.0) * Global.device.widthScaleHalf
      : Size(34.0, 34.0);

  FeatureScreenStore _store;
  EventStore _eventStore;
  Widget _barWidget;
  String _locale;
  int _navIndex = 0;

  Map<RouteEnum, Widget> _navImage;

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
    _locale = Global.localeCode;
    super.initState();
  }

  @override
  void didUpdateWidget(ScreenNavigationBar oldWidget) {
    _store = null;
    _eventStore = null;
    _navImage = null;
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
            if (_barWidget != null && _locale != Global.localeCode) {
              _barWidget = _buildWidget(snapshot.data);
              _locale = Global.localeCode;
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
      return GradientBottomNavigationBar(
        gradient: ThemeInterface.navBarGradient,
        onTap: (index) {
          debugPrint('navigate bar has user: ${_store.hasUser}');
          _itemTapped(index, _store.hasUser);
        },
        currentIndex: _navIndex,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: FontSize.SMALL.value,
        selectedFontSize: FontSize.SMALLER.value,
        items: List.generate(_tabs.length, (index) {
          var itemValue = _tabs[index].value;
          return _createBarItem(
            itemValue: itemValue,
            title: labels[index],
            store: _store,
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
    @required FeatureScreenStore store,
    @required bool addBadge,
  }) {
    _navImage ??= new Map();
    if (_navImage.containsKey(itemValue.id) == false) {
      Widget icon = (itemValue.imageName != null)
          ? FittedBox(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(36.0),
                child: Container(
                  constraints: BoxConstraints.tight(_iconSize),
                  child: networkImageBuilder(itemValue.imageName),
                ),
              ),
            )
          : Icon(itemValue.iconData, size: _iconSize.width);
      _navImage[itemValue.id] = icon;
    }

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
              position: BadgePosition.topEnd(top: -1, end: -1),
              child: _navImage[itemValue.id],
            )
          : _navImage[itemValue.id],
      title: AutoSizeText.rich(
        TextSpan(
          text: title ?? itemValue.title ?? itemValue.route?.pageTitle ?? '?',
        ),
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: themeColor.navigationColorFocus,
        ),
        textAlign: TextAlign.center,
        maxLines: 1,
        minFontSize: FontSize.SMALL.value - 4.0,
        maxFontSize: FontSize.NORMAL.value,
      ),
    );
  }
}
