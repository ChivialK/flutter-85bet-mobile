import 'dart:async' show StreamSubscription;

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/network/util/network_info.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/screen/feature_screen_inherited_widget.dart';
import 'package:flutter_85bet_mobile/features/screen/network_changed_dialog.dart';
import 'package:flutter_85bet_mobile/utils/platform_util.dart';

import '../routes/home/presentation/state/home_store.dart';
import 'feature_screen_store.dart';
import 'feature_screen_view.dart';

///
/// Main app screen
///
/// Include [FeatureScreenStore] which holds current page info and user data.
/// Uses [WillPopScope] to maintain [FeatureScreenView]
///
class FeatureScreen extends StatefulWidget {
  const FeatureScreen();

  @override
  _FeatureScreenState createState() => _FeatureScreenState();
}

class _FeatureScreenState extends State<FeatureScreen> {
  final String tag = 'FeatureScreen';
  final FeatureScreenStore _store = FeatureScreenStore(sl());
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  StreamSubscription<ConnectivityResult> networkSubscript;
  ConnectivityResult _currentNetworkType;
  bool isShowingDialog = false;

  String locale;
  int closeAppCount = 0;

  void setNetworkListener() {
    try {
      networkSubscript = sl
          .get<NetworkInfo>()
          .onChangedStream
          .listen((ConnectivityResult result) {
        debugPrint('connectivity result: $result');
        if (_currentNetworkType != null && mounted && !isShowingDialog) {
          try {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => NetworkChangedDialog(
                onRefreshClick: () => updateScreen(),
                onClose: () => isShowingDialog = false,
              ),
            );
            isShowingDialog = true;
          } catch (e) {
            MyLogger.error(msg: 'connectivity dialog has error: $e');
          }
        } else {
          _currentNetworkType = result;
        }
      });
    } catch (e) {
      MyLogger.warn(msg: 'connectivity listener has error: $e');
      networkSubscript = null;
    }
  }

  void updateScreen() {
    debugPrint('reassembling feature screen...');
    try {
      sl?.get<HomeStore>()?.getInitializeData(force: true);
      Future.delayed(
          Duration(milliseconds: (RouterNavigate.current == '/') ? 2000 : 100),
          () {
        // refresh widget under scaffold (ex. menu bar, nav bar...)
        _scaffoldKey?.currentState?.setState(() {});
        // refresh current route widget
        RouterNavigate.navigator.reassemble();
      });
    } catch (e) {
      MyLogger.error(msg: 'update feature screen has error: $e');
      PlatformUtil.restart();
    }
  }

  @override
  void initState() {
    MyLogger.debug(msg: 'init feature screen', tag: tag);
    locale = Global.localeCode;
    super.initState();
    if (_store != null) {
      _store.getWebsiteList();
      _store.getAds();
    }
    setNetworkListener();
  }

  @override
  void didUpdateWidget(FeatureScreen oldWidget) {
    MyLogger.debug(msg: 'update feature screen', tag: tag);
    super.didUpdateWidget(oldWidget);
    if (networkSubscript == null) setNetworkListener();
  }

  @override
  void didChangeDependencies() {
    MyLogger.debug(msg: 'change feature screen', tag: tag);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    MyLogger.debug(msg: 'build feature screen', tag: tag);
    return WillPopScope(
      child: StreamBuilder<String>(
          stream: getAppGlobalStreams.languageStream,
          initialData: Global.localeCode,
          builder: (context, snapshot) {
            locale ??= snapshot.data;
            if (snapshot.data != locale) {
              locale = snapshot.data;
              debugPrint('feature screen language changed: ${snapshot.data}');
              updateScreen();
            }
            return FeatureScreenInheritedWidget(
              scaffoldKey: _scaffoldKey,
              store: _store,
              eventStore: sl(),
              child: FeatureScreenView(),
            );
          }),
      onWillPop: () async {
        MyLogger.debug(msg: 'pop feature screen', tag: 'FeatureScreen');
        closeAppCount += 1;
        Future.delayed(Duration(milliseconds: 500), () => closeAppCount = 0);
        if (closeAppCount > 1)
          return Future(() => true); // exit app
        else if (closeAppCount == 1) callToast(localeStr.exitAppHint);
        return Future(() => false);
      },
    );
  }

  @override
  void dispose() {
    MyLogger.warn(msg: 'disposing feature screen', tag: tag);
    try {
      Global.initLocale = false;
      _store.closeStreams();
    } on Exception {}
    Future.delayed(Duration(milliseconds: 200), () => PlatformUtil.restart());
    super.dispose();
    networkSubscript?.cancel();
  }
}
