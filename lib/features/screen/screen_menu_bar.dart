part of 'feature_screen_view.dart';

///@author H.C.CHIANG
///@version 2020/2/26
class ScreenMenuBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _ScreenMenuBarState createState() => _ScreenMenuBarState();

  @override
  Size get preferredSize => Size(Global.device.width, Global.APP_BAR_HEIGHT);
}

class _ScreenMenuBarState extends State<ScreenMenuBar> {
  Widget _lastActionWidget;
  bool _usingUserAction = false;

  FeatureScreenInheritedWidget viewState;
  bool _hideLangOption = false;
  String _locale;

  @override
  void initState() {
    _locale = Global.lang;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewState = FeatureScreenInheritedWidget.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      /* App bar Icon */
      title: Row(
        children: [
          Observer(
            builder: (_) {
              debugPrint(
                  'hide lang option: ${viewState.store.pageInfo.disableLanguageDropDown}');
              if (_hideLangOption !=
                  viewState.store.pageInfo.disableLanguageDropDown) {
                Future.delayed(Duration(milliseconds: 100), () {
                  if (mounted) {
                    setState(() {
                      _hideLangOption =
                          viewState.store.pageInfo.disableLanguageDropDown;
                    });
                  }
                });
              }
              return SizedBox.shrink();
            },
          ),
          Visibility(
            visible: !_hideLangOption,
            maintainState: true,
            child: ScreenMenuLangWidget(),
          ),
          Image.asset(Res.iconBarLogo, scale: 2.5),
        ],
      ),
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
          if (viewState.store.showMenuDrawer) {
            return IconButton(
              icon: Icon(Icons.menu, color: Themes.drawerIconColor),
              tooltip: localeStr.btnMenu,
              onPressed: () {
                viewState.scaffoldKey.currentState.openDrawer();
              },
            );
          } else {
            return IconButton(
              icon: Icon(Icons.arrow_back, color: Themes.drawerIconSubColor),
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
        Observer(builder: (_) {
          final hide = viewState.store.pageInfo.hideAppbarActions;
          if (hide) return SizedBox.shrink();
          final hasUser = viewState.store.hasUser ?? false;
          if (hasUser != _usingUserAction) {
            _lastActionWidget = (hasUser) ? userGroup() : buttonGroup();
            _usingUserAction = hasUser;
          } else if (_locale != Global.lang) {
            _lastActionWidget = (hasUser) ? userGroup() : buttonGroup();
            _locale = Global.lang;
          }
          _lastActionWidget ??= buttonGroup();
          return _lastActionWidget;
        }),
      ],
    );
  }

  /// Right Action Widget when user logged in
  Widget userGroup() {
    return SizedBox();
  }

  /// Right Action Widget when no user
  Widget buttonGroup() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: ButtonTheme(
          height: 30,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(4.0),
          ),
          child: Row(
            children: <Widget>[
              RaisedButton(
                child: new Text(
                  localeStr.pageTitleLogin,
                  style: TextStyle(
                    fontSize: FontSize.NORMAL.value + 1,
                    color: Themes.buttonTextPrimaryColor,
                  ),
                ),
                visualDensity: VisualDensity(horizontal: -3.0),
                onPressed: () => RouterNavigate.navigateToPage(RoutePage.login),
              ),
              SizedBox(width: 4.0),
              RaisedButton(
                child: new Text(
                  localeStr.pageTitleRegister,
                  style: TextStyle(
                    fontSize: FontSize.NORMAL.value + 1,
                    color: Themes.buttonTextPrimaryColor,
                  ),
                ),
                visualDensity: VisualDensity(horizontal: -3.0),
//                onPressed: () =>
//                    RouterNavigate.navigateToPage(RoutePage.register),
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (_) => new RegisterRoute(isDialog: true),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
