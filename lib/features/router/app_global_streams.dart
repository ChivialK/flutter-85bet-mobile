import 'dart:async' show StreamController, Stream;

import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter_85bet_mobile/core/network/dio_api_service.dart';
import 'package:flutter_85bet_mobile/features/general/data/user/user_token_storage.dart';
import 'package:flutter_85bet_mobile/features/themes/theme_color_enum.dart';
import 'package:flutter_85bet_mobile/features/user/data/entity/login_status.dart';
import 'package:flutter_85bet_mobile/features/user/data/entity/user_entity.dart';
import 'package:flutter_85bet_mobile/features/user/data/repository/jwt_interface.dart';
import 'package:flutter_85bet_mobile/features/user/data/repository/user_repository.dart'
    show UserApi;
import 'package:flutter_85bet_mobile/ga_interface.dart';
import 'package:flutter_85bet_mobile/injection_container.dart';
import 'package:flutter_85bet_mobile/mylogger.dart';
import 'package:flutter_85bet_mobile/utils/value_util.dart';

import 'app_navigate.dart' show RoutePage, RouterNavigate;

AppGlobalStreams get getAppGlobalStreams => sl.get<AppGlobalStreams>();

///
/// Stream user [LoginStatus] through out the app to control UI state
///
class AppGlobalStreams {
  static final tag = 'AppGlobalStreams';

  final StreamController<LoginStatus> _userControl =
      StreamController<LoginStatus>.broadcast();

  final StreamController<String> _creditController =
      StreamController<String>.broadcast();

  final StreamController<bool> _messageController =
      StreamController<bool>.broadcast();

  final StreamController<bool> _recheckControl =
      StreamController<bool>.broadcast();

  final StreamController<String> _languageControl =
      StreamController<String>.broadcast();

  final StreamController<ThemeColorEnum> _themeControl =
      StreamController<ThemeColorEnum>.broadcast();

  AppGlobalStreams() {
    _userControl.stream.listen((event) {
      debugPrint('update stream user: $event');
      _user = event;
    });
    _creditController.stream.listen((event) {
//      debugPrint('home stream credit: $event');
      _userCredit = event;
    });
    _messageController.stream.listen((event) {
//      debugPrint('home stream credit: $event');
      _hasNewMessage = event;
    });
  }

  DioApiService _dioApiService;

  /// App Relative
  Stream<String> get languageStream => _languageControl.stream;

  Stream<ThemeColorEnum> get themeStream => _themeControl.stream;

  /// User Relative
  Stream<LoginStatus> get userStream => _userControl.stream;

  Stream<bool> get recheckUserStream => _recheckControl.stream;

  Stream<String> get creditStream => _creditController.stream;

  LoginStatus _user = LoginStatus(loggedIn: false);

  bool _hasNewMessage = false;

  String _userCredit = '0';

  final String creditResetStr = '$creditSymbol---';

  LoginStatus get lastStatus => _user;

  bool get hasUser => _user.loggedIn;

  int get userLevel => _user.currentUser?.vip ?? 0;

  String get userName => _user.currentUser?.account ?? 'Guest';

  bool get hasNewMessage => _hasNewMessage;

  updateUser(LoginStatus user) {
    _userControl.sink.add(user);
    _creditController.sink.add(user.currentUser?.credit ?? creditResetStr);
  }

  updateCredit(String credit) {
    _creditController.sink.add(credit);
    lastStatus.currentUser.updateCredit(credit);
  }

  String getCredit({bool addSymbol = false}) {
    if (_userCredit.contains('-') == false) {
      return formatValue(_userCredit, creditSign: addSymbol);
    } else {
      if (addSymbol) return '$creditSymbol$_userCredit';
    }
    return _userCredit;
  }

  resetCredit() {
    _creditController.sink.add(creditResetStr);
    lastStatus.currentUser.updateCredit(creditResetStr);
  }

  updateMessageState(bool hasNew) {
    _messageController.sink.add(hasNew);
  }

  setCheck(bool recheck) {
    _recheckControl.sink.add(recheck);
  }

  setLanguage(String lang) {
    _languageControl.sink.add(lang);
  }

  notifyThemeChange(ThemeColorEnum color) {
    _themeControl.sink.add(color);
  }

  logout({bool force = false, bool navToLogin = false}) async {
    if (!hasUser) return;
    String userName = _user.currentUser.account;
    MyLogger.info(msg: 'logging out user $userName', tag: tag);
    try {
      var jwtInterface = sl.get<JwtInterface>();
      _dioApiService ??= sl.get<DioApiService>();

      if (!force) {
        String token = (jwtInterface.token.isNotEmpty)
            ? jwtInterface.token
            : await Future.value(UserTokenStorage.load(userName)).then((value) {
                return value?.cookie?.value ?? '';
              });
        if (token.isNotEmpty) {
          _dioApiService.post(UserApi.LOGOUT, userToken: token);
        }
      } else {
        UserTokenStorage.clear();
      }

      jwtInterface.clearToken();
    } catch (e, s) {
      MyLogger.error(msg: 'logout $userName has error: $e', tag: tag);
      debugPrint('error stack:\n$s');
    }

    Future.delayed(
        Duration(milliseconds: 500),
        () => (navToLogin)
            ? RouterNavigate.navigateToPage(RoutePage.login)
            : RouterNavigate.navigateClean(force: true));

    _userControl.sink.add(LoginStatus(loggedIn: false));
    _creditController.sink.add(creditResetStr);
    _messageController.sink.add(false);
    _recheckControl.sink.add(true);
  }

  dispose() {
    MyLogger.warn(msg: 'disposing app streams!!', tag: tag);
    _userControl.close();
    _creditController.close();
    _messageController.close();
    _recheckControl.close();
    _languageControl.close();
    _themeControl.close();
  }
}
