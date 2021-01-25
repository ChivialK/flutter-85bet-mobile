import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/event/presentation/state/event_store.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/themes/icon_code.dart';
import 'package:flutter_85bet_mobile/res.dart';

class HomeLogoBar extends StatefulWidget {
  HomeLogoBar({Key key}) : super(key: key);

  @override
  _HomeLogoBarState createState() => _HomeLogoBarState();
}

class _HomeLogoBarState extends State<HomeLogoBar> {
  StreamSubscription _userSubscription;
  StreamSubscription _creditSubscription;

  bool _hasUser = false;
  int _level = -1;
  String _name = '';
  String _credit = '';

  @override
  void initState() {
    _hasUser = getAppGlobalStreams.hasUser;
    if (_hasUser) {
      final status = getAppGlobalStreams.lastStatus;
      _name = status.currentUser.account;
      _level = status.currentUser.vip;
      _credit = status.currentUser.credit;
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userSubscription ??= getAppGlobalStreams.userStream.listen((status) {
      if (_hasUser != status.loggedIn && mounted) {
        Future.delayed(Duration(milliseconds: 200), () {
          if (status.loggedIn) {
            _name = status.currentUser.account;
            _level = status.currentUser.vip;
            _credit = status.currentUser.credit;
          } else {
            _name = '';
            _level = -1;
            _credit = '';
          }
          setState(() => _hasUser = status.loggedIn);
          debugPrint('logo bar user updated: $_name');
        });
      }
    });
    _creditSubscription ??= getAppGlobalStreams.creditStream.listen((value) {
      if (_credit != value && mounted) {
        setState(() => _credit = value ?? '');
        debugPrint('logo bar credit updated: $_credit');
      }
    });
  }

  @override
  void dispose() {
    try {
      _userSubscription?.cancel();
      _creditSubscription?.cancel();
      _userSubscription = null;
      _creditSubscription = null;
    } catch (e) {
      MyLogger.debug(
        msg: 'dispose home logo bar stream has exception: $e',
        tag: "HomeLogoBar",
      );
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint('rebuild logo bar: $_hasUser');
    return Container(
      color: themeColor.homeTabBgColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.only(left: 16.0),
              alignment: Alignment.centerLeft,
              child: Image.asset(Res.icon_bar_logo, scale: 1.5),
            ),
          ),
          if (!_hasUser)
            Expanded(
              flex: 3,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    onPressed: () => RouterNavigate.navigateToPage(
                      RoutePage.login,
                      arg: LoginRouteArguments(returnHomeAfterLogin: true),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          localeStr.pageTitleLogin,
                          style: TextStyle(
                            fontSize: FontSize.SUBTITLE.value,
                            color: themeColor.buttonTextPrimaryColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            IconCode.navLogin,
                            color: themeColor.buttonTextPrimaryColor,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () =>
                        RouterNavigate.navigateToPage(RoutePage.register),
                    // onPressed: () {
                    // showDialog(
                    //   context: context,
                    //   barrierDismissible: true,
                    //   builder: (_) => new RegisterRoute(isDialog: true),
                    // );
                    // },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          localeStr.pageTitleRegister,
                          style: TextStyle(
                            fontSize: FontSize.SUBTITLE.value,
                            color: themeColor.buttonTextPrimaryColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            IconCode.gridRegister,
                            color: themeColor.buttonTextPrimaryColor,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          if (_hasUser)
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(children: [
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              SizedBox(
                                height: FontSize.TITLE.value,
                                child: Image.asset(
                                  'assets/images/vip/user_vip_$_level.png',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                  _name,
                                  style: TextStyle(
                                    fontSize: FontSize.SUBTITLE.value,
                                    color: themeColor.homeBoxIconTextColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                try {
                                  sl.get<EventStore>().getUserCredit();
                                } on Exception {}
                              },
                              child: Text(
                                (_credit.contains('-'))
                                    ? _credit
                                    : formatValue(
                                        _credit,
                                        floorIfZero: true,
                                        creditSign: true,
                                      ),
                                style: TextStyle(
                                  color: themeColor.homeBoxInfoTextColor,
                                  fontSize: FontSize.SUBTITLE.value,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      icon: Icon(IconCode.gridLogout),
                      onPressed: () => getAppGlobalStreams.logout(),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
