import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_85bet_mobile/features/router/app_global_streams.dart';
import 'package:flutter_85bet_mobile/features/router/app_navigate.dart';
import 'package:flutter_85bet_mobile/features/user/data/entity/login_status.dart';

import '../state/home_store.dart';

export 'package:provider/provider.dart';

abstract class HomeDisplayProviderInterface with ChangeNotifier {
  bool get hasUser;
  LoginStatus get userStatus;
  void cancelSubscription();
}

class HomeDisplayProvider
    with ChangeNotifier
    implements HomeDisplayProviderInterface {
  final HomeStore store;
  StreamSubscription _userSubscription;
  StreamSubscription _recheckSubscription;

  bool _hasUser = false;

  HomeDisplayProvider(this.store) {
    _recheckSubscription =
        RouterNavigate.routerStreams.recheckUserStream.listen((update) {
      if (update) {
        debugPrint('triggered home provider recheck...');
        // store.getGames(platform: store.homePlatformMap['slot'].first);
        store.recommends = null;
        store.favorites = null;
      }
    });
    _userSubscription = getAppGlobalStreams.userStream.listen((status) {
      debugPrint('home provider user: $status');
      if (_hasUser != status.loggedIn) {
        _hasUser = status.loggedIn;
        notifyListeners();
      }
    });
  }

  @override
  bool get hasUser => _hasUser;

  @override
  LoginStatus get userStatus => getAppGlobalStreams.lastStatus;

  @override
  void cancelSubscription() {
    _userSubscription?.cancel();
    _recheckSubscription?.cancel();
  }

  @override
  void dispose() {
    cancelSubscription();
    super.dispose();
  }
}
