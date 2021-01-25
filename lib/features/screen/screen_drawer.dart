part of 'feature_screen_view.dart';

///
///@author H.C.CHIANG
///@version 2020/6/2
///
class ScreenDrawer extends StatelessWidget {
  static final List<ScreenDrawerItem> _menuItems = [
    ScreenDrawerItem.home,
    ScreenDrawerItem.tutorial,
    ScreenDrawerItem.vip,
    ScreenDrawerItem.store,
    ScreenDrawerItem.roller,
    // ScreenDrawerItem.website,
    // ScreenDrawerItem.agent,
    ScreenDrawerItem.logout,
    // ScreenDrawerItem.testUI,
    // ScreenDrawerItem.test,
  ];

  bool _itemTapped(ScreenDrawerItem item, {FeatureScreenStore store}) {
    if (item.value.id == RouteEnum.LOGOUT) {
      getAppGlobalStreams.logout();
      return true;
    }
    if (item.value.isUserOnly && getAppGlobalStreams.hasUser == false) {
      RouterNavigate.navigateToPage(RoutePage.login,
          arg: LoginRouteArguments(returnHomeAfterLogin: true));
      return true;
    }
    if (item.value.id == RouteEnum.WEBSITE) {
      launch(Global.CURRENT_BASE);
      return true;
    }
    if (item.value.id == RouteEnum.TEST) {
      ScreenNavigate.switchScreen(screen: ScreenEnum.Test);
      return true;
    }

    var route = item.value.route;
    if (route == null) {
      callToastInfo(localeStr.workInProgress);
    } else if (item.value.id == RouteEnum.AGENT_ABOUT ||
        item.value.id == RouteEnum.TUTORIAL) {
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
                      padding: const EdgeInsets.only(top: 48.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            child: Text(localeStr.messageWelcome,
                                style: TextStyle(
                                  fontSize: FontSize.MESSAGE.value,
                                )),
                          ),
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                localeStr.messageLoginHint,
                                style: TextStyle(
                                  fontSize: FontSize.SUBTITLE.value,
                                  color: themeColor.defaultHintColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GradientButton(
                              expand: true,
                              cornerRadius: 2.0,
                              colorType: GradientButtonColor.GOLD_DIAG,
                              child: Text(
                                localeStr.pageTitleLogin,
                                style: TextStyle(
                                    fontSize: FontSize.SUBTITLE.value,
                                    color: themeColor.buttonTextSubColor),
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
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: GradientButton(
                          //     cornerRadius: 2.0,
                          //     expand: true,
                          //     colorType: GradientButtonColor.GOLD_DIAG,
                          //     child: Text(
                          //       localeStr.pageTitleRegister,
                          //       style: TextStyle(
                          //           fontSize: FontSize.SUBTITLE.value,
                          //           color: themeColor.buttonTextSubColor),
                          //     ),
                          //     onPressed: () {
                          //       if (viewState
                          //           .scaffoldKey.currentState.isDrawerOpen) {
                          //         Navigator.of(context).pop();
                          //       }
                          //       Future.delayed(Duration(milliseconds: 100), () {
                          //         showDialog(
                          //           context: context,
                          //           barrierDismissible: true,
                          //           builder: (_) =>
                          //               new RegisterRoute(isDialog: true),
                          //         );
                          //       });
                          //     },
                          //   ),
                          // ),
                          Container(
                            width: 120,
                            height: 120,
                            margin: const EdgeInsets.symmetric(vertical: 30.0),
                            child:
                                networkImageBuilder('images/member-star.png'),
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
                            width: 160,
                            height: 160,
                            margin: const EdgeInsets.symmetric(vertical: 12.0),
                            child:
                                networkImageBuilder('images/member-star.png'),
                          ),
                          Center(
                            child: Text(
                              localeStr.messageWelcomeUser(
                                  getAppGlobalStreams.userName),
                              style: TextStyle(
                                fontSize: FontSize.MESSAGE.value,
                                fontWeight: FontWeight.w600,
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
                                style:
                                    TextStyle(fontSize: FontSize.TITLE.value),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  Column(
                    children: List<Widget>.generate(
                      _menuItems.length + 1,
                      (index) {
                        if (index == _menuItems.length) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Divider(),
                          );
                        }
                        ScreenDrawerItem item = _menuItems[index];
                        if (item.value.id == RouteEnum.LOGOUT &&
                            getAppGlobalStreams.hasUser == false) {
                          return SizedBox.shrink();
                        }
                        return Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Divider(),
                            ),
                            GestureDetector(
                              onTap: () {
                                if ((item.value.id == RouteEnum.SIGN)
                                    ? _itemTapped(item, store: viewState.store)
                                    : _itemTapped(item)) {
                                  // close the drawer
                                  if (viewState
                                      .scaffoldKey.currentState.isDrawerOpen)
                                    Navigator.of(context).pop();
                                }
                              },
                              child: _buildListItem(
                                  item.value, _menuLabels[index]),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ScreenDrawerThemeSelector(),
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
    bool shrink = (itemValue.iconData != null)
        ? itemValue.iconData.codePoint == 0xf219
        : false;
    return Padding(
      padding: (shrink)
          ? const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0)
          : const EdgeInsets.fromLTRB(18.0, 0.0, 16.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          (itemValue.imageName != null)
              ? networkImageBuilder(
                  (ThemeInterface.theme.isDefaultColor == false &&
                          itemValue.imageSubName != null)
                      ? itemValue.imageSubName
                      : itemValue.imageName,
                  imgScale: 1.05)
              : Container(
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: AutoSizeText.rich(
                TextSpan(
                  text: title ??
                      itemValue.title ??
                      itemValue.route?.pageTitle ??
                      '?',
                  style: TextStyle(
                    fontSize: FontSize.MESSAGE.value,
                    color: themeColor.sideMenuIconTextColor,
                  ),
                ),
                minFontSize: FontSize.SMALLER.value - 4.0,
                maxFontSize: FontSize.MESSAGE.value,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
