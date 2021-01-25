import 'dart:convert' show Encoding;

import 'package:flutter/material.dart' show kToolbarHeight;

import 'device.dart';
import 'language.dart';

class Global {
  /// Device Relative
  static Device device;

  /// APP Language
  static Language lang;

  /// Web Service
  static const bool HAS_FLEX_ROUTE = false;
  static const String CURRENT_BASE = VA_OFFICIAL_URL;

  // DOMAIN_NAME cannot set to empty, banner and marquee url navigate will failed
  static const String DOMAIN_NAME = "8809.ml";
  static const String VA_BASE_URL = "http://10.20.18.11/";
  static const String VA_OFFICIAL_URL = "https://8809.ml/";
  static const String VA_TEST_URL = "http://192.168.2.87:1811/";
  static const String VA_SERVICE_URL = "";

  /// HIVE table name
  static const String CACHED_COOKIE = 'CACHED_USER_COOKIE';
  static const String CACHE_LOGIN_FORM = 'CACHE_LOGIN_FORM';
  static const String CACHE_APP_DATA = 'CACHE_APP_DATA';

  static const String CACHE_APP_DATA_KEY_LANG = 'lang';
  static const String CACHE_APP_DATA_KEY_THEME = 'theme';

  /// Other static value
  static const double APP_MENU_HEIGHT = kToolbarHeight - 8.0;
  static const double APP_NAV_HEIGHT = kToolbarHeight + 6.0;
  static const double APP_BARS_HEIGHT = Global.APP_MENU_HEIGHT + APP_NAV_HEIGHT;
  static const double TEST_DEVICE_HEIGHT = 785.45;
  static const double TEST_DEVICE_WIDTH = 392.72;

  static const String WEB_MIMETYPE = 'text/html';
  static Encoding webEncoding = Encoding.getByName('utf-8');
}
