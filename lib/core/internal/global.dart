import 'dart:convert' show Encoding;

import 'package:flutter/material.dart' show kToolbarHeight;

import 'device.dart';
import 'language_code.dart';

class Global {
  /// Device Relative
  static Device device;

  /// BuildType
  static bool addAnalytics = false;

  /// APP Language
  static bool initLocale = false;

  static bool lockLanguage = false;

  static LanguageCode _locale = defaultLocale;

  static String get jsonContentKey => _locale.value.contentKey;

  static String get lang => _locale.value.code;

  static set setLanguage(String langCode) =>
      _locale = LanguageCode.getByCode(langCode);

  /// Web Service
  static const bool HAS_FLEX_ROUTE = false;
  static const String CURRENT_BASE = BET85_OFFICIAL_URL;

  static const String DOMAIN_NAME = "85bet.com";
  static const String BET85_BASE_URL = "http://10.20.10.11/";
  static const String BET85_OFFICIAL_URL = "https://85bet.com/";
  static const String BET85_TEST_URL = "http://192.168.2.87:7315/";
  static const String BET85_SERVICE_URL =
      "https://vm.providesupport.com/095ecqycnij4h0q56020owowxq";
  static const String BET85_MOVIE_URL = "http://web.95vn.com";

  /// HIVE table name
  static const String CACHED_COOKIE = 'CACHED_USER_COOKIE';
  static const String CACHE_LOGIN_FORM = 'CACHE_LOGIN_FORM';
  static const String CACHE_APP_DATA = 'CACHE_APP_DATA';

  static const String CACHE_APP_DATA_KEY_LANG = 'lang';
  static const String CACHE_APP_DATA_KEY_THEME = 'theme';

  /// Other static value
  static const double APP_MENU_HEIGHT = kToolbarHeight - 8.0;
  static const double APP_NAV_HEIGHT = kToolbarHeight + 12.0;
  static const double APP_BARS_HEIGHT = Global.APP_MENU_HEIGHT + APP_NAV_HEIGHT;
  static const double TEST_DEVICE_HEIGHT = 785.45;
  static const double TEST_DEVICE_WIDTH = 392.72;

  static const String WEB_MIMETYPE = 'text/html';
  static Encoding webEncoding = Encoding.getByName('utf-8');
}
