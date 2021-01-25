import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/router/app_global_streams.dart';
import 'package:flutter_85bet_mobile/features/router/app_navigate.dart';

class HomeTabNavMember extends StatelessWidget {
  final Function onNavigateCallBack;

  HomeTabNavMember({@required this.onNavigateCallBack});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 200), () {
      // do something to prevent reroute again on back press
      onNavigateCallBack();
      if (getAppGlobalStreams.hasUser) {
        // route to member page
        RouterNavigate.navigateToPage(RoutePage.member);
      } else {
        RouterNavigate.navigateToPage(RoutePage.login);
      }
    });
    return Center(child: CircularProgressIndicator());
  }
}
