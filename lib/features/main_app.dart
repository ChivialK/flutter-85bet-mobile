import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/generated/l10n.dart';
import 'package:flutter_85bet_mobile/injection_container.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'main_startup.dart';
import 'router/app_global_streams.dart';
import 'routes/home/presentation/state/home_store.dart';

class MainApp extends StatefulWidget {
  final FirebaseAnalytics analytics;

  MainApp(this.analytics);

  @override
  State<StatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with WidgetsBindingObserver {
  final String tag = 'Main';

  FirebaseAnalyticsObserver firebaseObserver;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.paused:
        MyLogger.info(msg: 'app paused', tag: tag);
//        SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
//        exit(0); // exit the app on paused
        break;
      case AppLifecycleState.resumed:
        MyLogger.info(msg: 'app resumed', tag: tag);
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
    MyLogger.info(msg: 'app init', tag: tag);
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    if (widget.analytics != null) {
      widget.analytics.logAppOpen();
      firebaseObserver = FirebaseAnalyticsObserver(analytics: widget.analytics);
    }
  }

  @override
  void didChangeDependencies() {
    MyLogger.info(msg: 'app dependencies', tag: tag);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    sl.get<AppGlobalStreams>().dispose();
    sl.get<HomeStore>().closeStreams();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MyLogger.info(msg: 'app build', tag: tag);
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        S.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      localeResolutionCallback: (deviceLocale, supportedLocales) {
//        if (Platform.isAndroid) {
//          for (var supp in supportedLocales) {
//            if (supp.languageCode == deviceLocale.languageCode) return supp;
//          }
//        }
        return Locale.fromSubtags(languageCode: Global.lang);
      },
      localeListResolutionCallback: (deviceLocales, supportedLocales) {
        debugPrint('device locales: $deviceLocales');
        debugPrint('supported locales: $supportedLocales');
//        if (Platform.isAndroid) {
//          for (var loc in deviceLocales) {
//            for (var supp in supportedLocales) {
//              if (supp.languageCode == loc.languageCode) return supp;
//            }
//          }
//        }
        return Locale.fromSubtags(languageCode: Global.lang);
      },
      theme: appTheme.defaultTheme,
      // Tell MaterialApp to use our ExtendedNavigator instead of
      // the native one by assigning it to it's builder
//    builder: ExtendedNavigator<ScreenRouter>(router: ScreenRouter()),
      builder: BotToastInit(),
//            builder: (context, child) {
//              child = myBuilder(context,child);  //do something
//              child = botToastBuilder(context,child);
//              return child;
//            },
      navigatorObservers: (firebaseObserver != null)
          ? [BotToastNavigatorObserver(), firebaseObserver]
          : [BotToastNavigatorObserver()],
      home: new MainStartup(),
    );
  }
}
