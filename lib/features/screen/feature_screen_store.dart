import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';
import 'package:flutter_85bet_mobile/features/event/presentation/state/event_store.dart';
import 'package:flutter_85bet_mobile/features/router/app_global_streams.dart'
    show getAppGlobalStreams;
import 'package:flutter_85bet_mobile/features/router/app_navigate.dart';
import 'package:flutter_85bet_mobile/features/user/data/entity/login_status.dart';

part 'feature_screen_store.g.dart';

class FeatureScreenStore = _FeatureScreenStore with _$FeatureScreenStore;

abstract class _FeatureScreenStore with Store {
  final EventStore _eventStore;
  final StreamController<bool> _loginStateController =
      StreamController<bool>.broadcast();

  _FeatureScreenStore(this._eventStore) {
    // initialize route observe
    _streamRoute = ObservableStream(RouterNavigate.routeStream);
    _streamRoute.listen((route) {
      pageInfo = route;
      debugPrint('current feature page: $pageInfo');
    });
    pageInfo ??= RouterNavigate.current.toRoutePage.value;

    // initialize user status observe
    _streamUser = ObservableStream(getAppGlobalStreams.userStream);
    _streamUser.listen((data) async {
      userLoggedIn = data.loggedIn;
      _loginStateController.sink.add(userLoggedIn);
      if (userLoggedIn) {
        getNewMessageCount();
      } else {
        getAppGlobalStreams.updateMessageState(false);
      }
    });

    if (getAppGlobalStreams.hasUser) {
      userLoggedIn = true;
    }
  }

  @observable
  String errorMessage;

  /// Route
  /* observe route change */
  @observable
  ObservableStream<RouteInfo> _streamRoute;

  /* current route's info */
  @observable
  RouteInfo pageInfo;

  /* bottom navigator selected index */
  @computed
  int get navIndex => (pageInfo != null && pageInfo.bottomNavIndex != null)
      ? pageInfo.bottomNavIndex
      : -1;

  bool get showMenuDrawer => (pageInfo != null)
      ? pageInfo.bottomNavIndex >= 0 || pageInfo.showDrawer
      : true;

  /// User
  /* observe user change */
  @observable
  ObservableStream<LoginStatus> _streamUser;

  /* login state changed notifier */
  Stream<bool> get loginStateStream => _loginStateController.stream;

  /* current user status */
  @observable
  bool userLoggedIn = false;

  bool get hasUser => userLoggedIn;

  Future<void> getWebsiteList() async => await _eventStore.getWebsiteList();

  Future<void> getNewMessageCount() async =>
      await _eventStore.getNewMessageCount();

  Future<void> getUserCredit() async => await _eventStore.getUserCredit();

  Future<void> getAds() async => await _eventStore.getAds();

  Future<void> closeStreams() {
    try {
      return Future.wait([
        _loginStateController.close(),
      ]);
    } catch (e) {
      MyLogger.warn(
          msg: 'close feature stream error',
          error: e,
          tag: 'FeatureScreenStore');
      return null;
    }
  }
}
