import 'dart:io' show Platform;

import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/builders/autoroute/auto_route.dart';
import 'package:flutter_85bet_mobile/core/internal/device.dart';
import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/injection_container.dart';

import 'router/app_navigate.dart';
import 'screen/web_game_screen_store.dart';
import 'update/presentation/state/update_store.dart';

///
/// Build the main ui using [ScreenRouter] and
/// add [WillPopScope] to intercept back button action.
///
/// @author H.C.CHIANG
/// @version 2020/2/5
///
class MainStartup extends StatefulWidget {
  @override
  _MainStartupState createState() => _MainStartupState();
}

class _MainStartupState extends State<MainStartup> with AfterLayoutMixin {
  final String keyId = 'Navi';

  Future<bool> updateFuture;
  UpdateStore updateStore;

  void registerLocale(BuildContext context) {
    try {
      sl.registerSingleton<LocalStrings>(LocalStrings(context));
//      debugPrint('test locale:${sl.get<LocalStrings>().res.pageTitleHome}');
    } catch (e) {
      MyLogger.warn(msg: 'locale file has exception: $e');
    } finally {
      Global.lang.init = true;
    }
//    debugPrint('test locale res:${localeStr.pageTitleHome}');
//    sl.get<LocalStrings>().init().then((value) {
//      debugPrint('test locale res1:${S.of(context).pageHomeRoute}');
//      debugPrint('test locale res2:${sl.get<LocalStrings>().res.pageHomeRoute}');
//    });
  }

  void getDeviceInfo(BuildContext context) {
    Global.device = Device(MediaQuery.of(context), Platform.isIOS);
    debugPrint('Device:\n----------\n${Global.device}\n----------');
  }

  @override
  void initState() {
    updateStore ??= sl.get<UpdateStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (Global.device == null) getDeviceInfo(context);
    if (Global.lang.init == false) registerLocale(context);
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          MyLogger.debug(
              msg:
                  'pop screen ${ScreenNavigate.screenIndex} route: ${RouterNavigate.current}',
              tag: 'MainStartup');
          if (ScreenNavigate.screenIndex == 1) {
            // Stop rotate sensor and clear web view cache
            sl.get<WebGameScreenStore>()?.stopSensor();
            ScreenNavigate.switchScreen(screen: ScreenEnum.Feature);
          } else if (ScreenNavigate.screenIndex == 2) {
            ScreenNavigate.switchScreen();
          } else if (RouterNavigate.current == '/') {
            return Future(() => true);
          } else {
            RouterNavigate.navigateBack();
          }
          return Future(() => false);
        },
        child: Scaffold(
          body: ExtendedNavigator<ScreenRouter>(
            initialRoute: ScreenRoutes.featureScreen,
            router: ScreenRouter(),
          ),
        ),
//        body: Navigator(
//          key: ScreenRouter.navigator.key,
//          onGenerateRoute: ScreenRouter.onGenerateRoute,
//          initialRoute: ScreenRouter.featureScreen,
//        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    if (updateStore != null) {
      updateStore.dialogClosed();
      // updateFuture ??=
      //     Future.delayed(Duration(seconds: 5), () => updateStore.getVersion());
      // updateFuture.then((hasUpdate) {
      //   if (hasUpdate) {
      //     showDialog(
      //       context: context,
      //       barrierDismissible: false,
      //       builder: (context) => UpdateDialog(
      //         newVersion: updateStore.serverAppVersion,
      //         onUpdateClick: () {
      //           String url = updateStore.serverAppUrl;
      //           if (url == null || url.isEmpty || url.isUrl == false)
      //             callToastError(localeStr.updateDialogErrorUrl);
      //           else
      //             launch(updateStore.serverAppUrl);
      //         },
      //         onDialogClose: () => updateStore.dialogClosed(),
      //       ),
      //     );
      //   } else {
      //     updateStore.dialogClosed();
      //   }
      // });
    }
  }
}
