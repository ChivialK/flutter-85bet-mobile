import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/builders/autoroute/auto_route.dart';
import 'package:flutter_85bet_mobile/features/event/presentation/state/event_store.dart';
import 'package:flutter_85bet_mobile/features/event/presentation/widgets/ad_dialog.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/cached_network_image.dart';
import 'package:flutter_85bet_mobile/features/update/presentation/state/update_store.dart';
import 'package:url_launcher/url_launcher.dart';

import '../export_internal_file.dart';
import 'feature_screen_inherited_widget.dart';
import 'feature_screen_store.dart';
import 'screen_drawer_item.dart';
import 'screen_menu_lang_widget.dart';
import 'screen_navigation_bar_item.dart';

part 'screen_drawer.dart';
part 'screen_menu_bar.dart';
part 'screen_navigation_bar.dart';

///
/// Main Screen View
///
/// Creates the app scaffold with:
/// top navigation bar [ScreenMenuBar]
/// top navigation bar drawer [ScreenDrawer]
/// bottom navigation bar [ScreenNavigationBar]
/// body [Navigator] to show [FeatureRouter] page
///
///@author H.C.CHIANG
///@version 2020/2/26
///
class FeatureScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewState = FeatureScreenInheritedWidget.of(context);
    return Scaffold(
      key: viewState.scaffoldKey,
      appBar: ScreenMenuBar(),
      drawer: new ScreenDrawer(),
      bottomNavigationBar: ScreenNavigationBar(),
      /* Main Content (switch placeholder with Router) */
      body: ExtendedNavigator<FeatureRouter>(
        initialRoute: Routes.homeRoute,
        router: FeatureRouter(),
      ),
//      body: Navigator(
//        key: Router.navigator.key,
//        onGenerateRoute: Router.onGenerateRoute,
//        initialRoute: Router.homeRoute,
//      ),
// /* Route Test */
//      body: Center(
//        child: Observer(builder: (_) {
//          final route = viewState.store.pageInfo.toString() ?? '?';
//          return Text(route);
//        }),
//      ),
    );
  }
}
