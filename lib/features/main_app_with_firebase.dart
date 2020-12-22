import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/ga_interface.dart';
import 'package:flutter_85bet_mobile/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'main_startup.dart';
import 'routes/home/presentation/state/home_store.dart';
import 'themes/theme_color_enum.dart';

class MainAppWithFirebase extends StatefulWidget {
  const MainAppWithFirebase({Key key}) : super(key: key);

  @override
  _MainAppWithFirebaseState createState() => _MainAppWithFirebaseState();
}

class _MainAppWithFirebaseState extends State<MainAppWithFirebase>
    with WidgetsBindingObserver {
  final String tag = 'MainWithFirebase';

  FirebaseAnalyticsObserver firebaseObserver;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.paused:
        MyLogger.info(msg: 'app paused', tag: tag);
        break;
      case AppLifecycleState.resumed:
        MyLogger.info(msg: 'app resumed', tag: tag);
        GaInterface.log.logAppOpen();
        break;
      case AppLifecycleState.inactive:
        MyLogger.info(msg: 'app inactive', tag: tag);
        break;
      case AppLifecycleState.detached:
        MyLogger.info(msg: 'app detached', tag: tag);
        break;
    }
  }

  @override
  void initState() {
    MyLogger.debug(msg: 'app init', tag: tag);
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    if (GaInterface.isAnalyzing) {
      firebaseObserver = GaInterface.getObserver;
    }
  }

  @override
  void didChangeDependencies() {
    MyLogger.debug(msg: 'app changed', tag: tag);
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant MainAppWithFirebase oldWidget) {
    MyLogger.debug(msg: 'app update', tag: tag);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    MyLogger.debug(msg: 'app dispose', tag: tag);
    sl.get<AppGlobalStreams>().dispose();
    sl.get<HomeStore>().closeStreams();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MyLogger.debug(msg: 'app build', tag: tag);
    return StreamBuilder<ThemeColorEnum>(
        stream: getAppGlobalStreams.themeStream,
        initialData: ThemeInterface.theme.colorEnum,
        builder: (context, snapshot) {
          return MaterialApp(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              S.delegate
            ],
            supportedLocales: S.delegate.supportedLocales,
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              return Locale.fromSubtags(languageCode: Global.localeCode);
            },
            localeListResolutionCallback: (deviceLocales, supportedLocales) {
              return Locale.fromSubtags(languageCode: Global.localeCode);
            },
            theme: ThemeInterface.theme.data,
            builder: BotToastInit(),
            navigatorObservers: (firebaseObserver != null)
                ? [BotToastNavigatorObserver(), firebaseObserver]
                : [BotToastNavigatorObserver()],
            home: new MainStartup(),
          );
        });
  }
}
