part of 'feature_screen_view.dart';

///
///@author H.C.CHIANG
///@version 2020/6/2
///
class ScreenDrawer extends StatelessWidget {
  const ScreenDrawer();

  static final List<ScreenDrawerItem> _menuItems = [
    ScreenDrawerItem.home,
    ScreenDrawerItem.tutorial,
    ScreenDrawerItem.vip,
    ScreenDrawerItem.roller,
    ScreenDrawerItem.promo,
    // ScreenDrawerItem.store,
    ScreenDrawerItem.about,
    ScreenDrawerItem.website,
    ScreenDrawerItem.logout,
//    ScreenDrawerItem.testUI,
//    ScreenDrawerItem.test,
  ];

  bool _itemTapped(ScreenDrawerItem item, {FeatureScreenStore store}) {
    if (item == ScreenDrawerItem.logout) {
      getAppGlobalStreams.logout();
      return true;
    }
    if (item == ScreenDrawerItem.website) {
      launch(Global.CURRENT_BASE);
      return true;
    }
    // if (item == ScreenDrawerItem.test) {
    //   ScreenNavigate.switchScreen(screen: ScreenEnum.Test);
    //   return true;
    // }
    var route = item.value.route;
    if (route == null) {
      callToastInfo(localeStr.workInProgress);
    } else if (item.value.id == RouteEnum.TUTORIAL ||
        item.value.id == RouteEnum.AGENT_ABOUT) {
      debugPrint('${item.value.id} route arg: ${route.value.routeArg}');
      // open web page
      RouterNavigate.replacePage(route);
      return true;
    } else if (route.pageName != RouterNavigate.current) {
      RouterNavigate.navigateToPage(route);
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final viewState = FeatureScreenInheritedWidget.of(context);
    double drawerWidth = Global.device.width * 0.7;
    if (drawerWidth < 240) drawerWidth = 240;

    final List<String> _menuLabels =
        _menuItems.map((e) => e.value.title).toList();

    return Container(
      constraints: BoxConstraints(
        maxWidth: drawerWidth,
        maxHeight: Global.device.height,
      ),
      child: Drawer(
        elevation: 8.0,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                primary: true,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  /* Drawer Header */
                  if (viewState.store.hasUser == false)
                    Container(
                      constraints: BoxConstraints(minHeight: 161.0),
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      padding: const EdgeInsets.only(top: 72.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: [
                              TextSpan(
                                  text: '${localeStr.messageWelcome}\n',
                                  style: TextStyle(
                                    fontSize: FontSize.MESSAGE.value,
                                    color: themeColor.sideMenuHeaderTextColor,
                                  )),
                              TextSpan(
                                  text: localeStr.messageWelcomeHint,
                                  style: TextStyle(
                                    fontSize: FontSize.SUBTITLE.value,
                                    height: 2.0,
                                  )),
                            ]),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 16.0, bottom: 8.0),
                            child: RaisedButton(
                              color: themeColor.sideMenuButtonColor,
                              textColor: themeColor.sideMenuButtonTextColor,
                              child: Text(
                                localeStr.pageTitleLogin,
                                style: TextStyle(
                                    fontSize: FontSize.SUBTITLE.value),
                              ),
                              onPressed: () {
                                if (viewState.scaffoldKey.currentState
                                    .isDrawerOpen) Navigator.of(context).pop();
                                RouterNavigate.navigateToPage(
                                  RoutePage.login,
                                  arg: LoginRouteArguments(
                                      returnHomeAfterLogin: true),
                                );
                              },
                            ),
                          ),
                          RaisedButton(
                            color: themeColor.sideMenuButtonColor,
                            textColor: themeColor.sideMenuButtonTextColor,
                            child: Text(
                              localeStr.pageTitleRegister,
                              style:
                                  TextStyle(fontSize: FontSize.SUBTITLE.value),
                            ),
                            onPressed: () {
                              if (viewState
                                  .scaffoldKey.currentState.isDrawerOpen) {
                                Navigator.of(context).pop();
                              }
                              Future.delayed(Duration(milliseconds: 100), () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (_) =>
                                      new RegisterRoute(isDialog: true),
                                );
                              });
                            },
                          ),
                          Container(
                            width: 144,
                            height: 144,
                            margin:
                                const EdgeInsets.only(top: 24.0, bottom: 30.0),
                            child: networkImageBuilder(
                              'images/member-star.png',
                              imgScale: 0.85,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (viewState.store.hasUser)
                    Container(
                      constraints: BoxConstraints(minHeight: 161.0),
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            width: 144,
                            height: 144,
                            margin: const EdgeInsets.symmetric(vertical: 24.0),
                            child: networkImageBuilder(
                              'images/member-star.png',
                              imgScale: 0.85,
                            ),
                          ),
                          Center(
                            child: Text(
                              localeStr.messageWelcomeUser(
                                  viewState.store.user.account),
                              style: TextStyle(
                                fontSize: FontSize.MESSAGE.value,
                                fontWeight: FontWeight.w600,
                                color: themeColor.sideMenuHeaderTextColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                getAppGlobalStreams.getCredit(addSymbol: true),
                                style: TextStyle(
                                  fontSize: FontSize.TITLE.value,
                                  color: themeColor.sideMenuHeaderTextColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  Column(
                    children: List<Widget>.generate(
                      _menuItems.length,
                      (index) {
                        ScreenDrawerItem item = _menuItems[index];
                        if (item.value.isUserOnly &&
                            getAppGlobalStreams.hasUser == false)
                          return SizedBox.shrink();
                        return GestureDetector(
                          onTap: () {
                            if (_itemTapped(item)) {
                              // close the drawer
                              if (viewState.scaffoldKey.currentState
                                  .isDrawerOpen) Navigator.of(context).pop();
                            }
                          },
                          child: _buildListItem(item.value, _menuLabels[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Row(
                  children: [
                    Text(
                      'version: ${Global.device.appVersionSide}',
                      style: TextStyle(
                        fontSize: FontSize.SMALL.value,
                        color: themeColor.defaultHintSubColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(RouteListItem itemValue, String title) {
    bool shrink = itemValue.iconData?.codePoint == 0xf219 ?? false;
    return Padding(
      padding: (shrink)
          ? const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0)
          : const EdgeInsets.fromLTRB(18.0, 0.0, 16.0, 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: themeColor.sideMenuIconBgColor,
            ),
            padding: const EdgeInsets.all(4.0),
            child: Transform.scale(
              scale: (shrink) ? 0.7 : 0.75,
              child: Container(
                margin: (shrink)
                    ? const EdgeInsets.only(right: 4.0)
                    : EdgeInsets.zero,
                child: Icon(
                  itemValue.iconData,
                  color: themeColor.sideMenuIconColor,
                  size: 36.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title ?? itemValue.title ?? itemValue.route?.pageTitle ?? '?',
              style: TextStyle(
                fontSize: FontSize.MESSAGE.value,
                color: themeColor.sideMenuIconTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
