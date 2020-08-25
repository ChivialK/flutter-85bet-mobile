import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';
import 'package:flutter_85bet_mobile/features/router/app_global_streams.dart'
    show getAppGlobalStreams;
import 'package:flutter_85bet_mobile/features/router/app_navigate.dart';
import 'package:flutter_85bet_mobile/features/user/data/entity/login_status.dart';
import 'package:flutter_85bet_mobile/features/user/data/entity/user_entity.dart';
import 'package:flutter_85bet_mobile/features/user/data/repository/event_repository.dart';
import 'package:flutter_85bet_mobile/injection_container.dart';

part 'feature_screen_store.g.dart';

class FeatureScreenStore = _FeatureScreenStore with _$FeatureScreenStore;

abstract class _FeatureScreenStore with Store {
  final StreamController<bool> _loginStateController =
      StreamController<bool>.broadcast();

  _FeatureScreenStore() {
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
      userStatus = data;
      _loginStateController.sink.add(userStatus.loggedIn);
      if (userStatus.loggedIn) {
        await getNewMessageCount();
      } else {
        hasNewMessage = false;
      }
    });
    if (getAppGlobalStreams.hasUser)
      userStatus = getAppGlobalStreams.lastStatus;
    userStatus ??= LoginStatus(loggedIn: false);
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

  bool get showMenuDrawer =>
      (pageInfo != null) ? pageInfo.isFeature || pageInfo.showDrawer : true;

  /// User
  /* observe user change */
  @observable
  ObservableStream<LoginStatus> _streamUser;

  /* current user status */
  @observable
  LoginStatus userStatus;

  /* current user */
  UserEntity get user => userStatus.currentUser;

  /* login state changed notifier */
  Stream<bool> get loginStateStream => _loginStateController.stream;

  @computed
  bool get hasUser => (userStatus != null) ? userStatus.loggedIn : false;

  /// Event & Message
  EventRepository _eventRepository;

  @observable
  bool hasNewMessage = false;

  @action
  Future<void> getNewMessageCount() async {
    _eventRepository ??= sl.get<EventRepository>();
    // Reset the possible previous error message.
    errorMessage = null;
    // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
    await _eventRepository.checkNewMessage().then((result) {
      debugPrint('new message result: $result');
      result.fold(
        (failure) => errorMessage = failure.message,
        (value) => hasNewMessage = value,
      );
    });
  }

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
