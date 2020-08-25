import 'dart:convert' show Encoding;

import 'package:flutter/material.dart' show kToolbarHeight;

import 'device.dart';

class Global {
  static Device device;

  static bool regLocale = false;
  static String lang = 'vi';
  static String jsonLabelKey = (lang == 'vi')
      ? 'content_vn'
      : (lang == 'zh') ? 'content_cn' : 'content_us';
  // content_cn, content_th, content_us, content_vn

  static const bool IS_TEST_VER = true;
  static const String CURRENT_BASE = BET85_OFFICIAL_URL;
  static const String CURRENT_SERVICE = BET85_SERVICE_URL;

  static const String EG_BASE_URL = "https://www.eg990.com/";
  static const String EG_SERVICE_URL = "http://vip66741.com/";

  static const String BET85_BASE_URL = "http://10.20.10.11/";
  static const String BET85_OFFICIAL_URL = "https://85bet.com/";
  static const String BET85_TEST_URL = "http://192.168.2.87:7315/";
  static const String BET85_SERVICE_URL =
      "https://vm.providesupport.com/095ecqycnij4h0q56020owowxq";

  static const double APP_BAR_HEIGHT = kToolbarHeight - 8;
  static const double APP_TOOLS_HEIGHT = Global.APP_BAR_HEIGHT * 2 + 8;
  static const double TEST_DEVICE_HEIGHT = 785.45;
  static const double TEST_DEVICE_WIDTH = 392.72;

  static const String CACHED_COOKIE = 'CACHED_USER_COOKIE';
  static const String CACHE_LOGIN_FORM = 'CACHE_LOGIN_FORM';
  static const String CACHE_APP_DATA = 'CACHE_APP_DATA';

  static const String WEB_MIMETYPE = 'text/html';
  static Encoding webEncoding = Encoding.getByName('utf-8');
}
