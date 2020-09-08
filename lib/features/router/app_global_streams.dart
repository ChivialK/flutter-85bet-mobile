import 'dart:async' show StreamController, Stream;

import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter_85bet_mobile/core/network/dio_api_service.dart';
import 'package:flutter_85bet_mobile/features/general/data/user/user_token_storage.dart';
import 'package:flutter_85bet_mobile/features/user/data/entity/login_status.dart';
import 'package:flutter_85bet_mobile/features/user/data/repository/jwt_interface.dart';
import 'package:flutter_85bet_mobile/features/user/data/repository/user_repository.dart'
    show UserApi;
import 'package:flutter_85bet_mobile/injection_container.dart';
import 'package:flutter_85bet_mobile/mylogger.dart';

import 'app_navigate.dart' show RouterNavigate;

AppGlobalStreams get getAppGlobalStreams => sl.get<AppGlobalStreams>();

///
/// Stream user [LoginStatus] through out the app to control UI state
///
class AppGlobalStreams {
  final StreamController<LoginStatus> _userControl =
      StreamController<LoginStatus>.broadcast();

  final StreamController<bool> _recheckControl =
      StreamController<bool>.broadcast();

  final StreamController<String> _languageControl =
      StreamController<String>.broadcast();

  DioApiService _dioApiService;

  /// App Relative
  Stream<String> get languageStream => _languageControl.stream;

  /// User Relative
  Stream<LoginStatus> get userStream => _userControl.stream;

  Stream<bool> get recheckUserStream => _recheckControl.stream;

  LoginStatus _user = LoginStatus(loggedIn: false);

  LoginStatus get lastStatus => _user;

  bool get hasUser => _user.loggedIn;

  int get userLevel => _user.currentUser?.vip ?? 0;

  String get userName => _user.currentUser?.account ?? 'Guest';

  String get userCredit => _user.currentUser?.credit ?? '0';

  AppGlobalStreams() {
    _userControl.stream.listen((event) {
      debugPrint('update stream user: $event');
      _user = event;
    });
  }

  updateUser(LoginStatus user) {
    _userControl.sink.add(user);
  }

  setCheck(bool recheck) {
    _recheckControl.sink.add(recheck);
  }

  setLanguage(String lang) {
    _languageControl.sink.add(lang);
  }

  logout() async {
    if (!hasUser) return;
    String userName = _user.currentUser.account;
    MyLogger.info(msg: 'logging out user $userName', tag: 'RouteUserStreams');
    try {
      var jwtInterface = sl.get<JwtInterface>();
      _dioApiService ??= sl.get<DioApiService>();

      String token = (jwtInterface.token.isNotEmpty)
          ? jwtInterface.token
          : await Future.value(UserTokenStorage.load(userName)).then((value) {
              return value?.cookie?.value ?? '';
            });
      if (token.isNotEmpty)
        _dioApiService.post(UserApi.LOGOUT, userToken: token);

      jwtInterface.clearToken();
    } catch (e, s) {
      MyLogger.error(
        msg: 'logout $userName has error: $e',
        tag: 'RouteUserStreams',
      );
      debugPrint('error stack:\n$s');
    }
    Future.delayed(Duration(milliseconds: 500),
        () => RouterNavigate.navigateClean(force: true));
    _userControl.sink.add(LoginStatus(loggedIn: false));
    _recheckControl.sink.add(true);
  }

  dispose() {
    MyLogger.warn(msg: 'disposing route streams!!', tag: 'RouteUserStreams');
    _userControl.close();
    _recheckControl.close();
    _languageControl.close();
  }
}
