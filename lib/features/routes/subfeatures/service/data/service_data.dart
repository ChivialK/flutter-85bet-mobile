import 'package:flutter_85bet_mobile/core/internal/global.dart';

import 'model/service_model.dart';

class ServiceData {
  static ServiceModel data;

  static String get cs => data.cs ?? Global.VN365_SERVICE_URL;

  static String get fb => data.fb ?? '';

  static String get zalo => data.zalo ?? '';

  static String get line => data.line ?? '';

  static String get mail => data.mail ?? '';

  static String get phone => data.phone ?? '';

  static String get skype => data.skype ?? '';

  static String get app => data.appUrl ?? '';

  static String get zaloPic => data.zaloPic ?? '';

  static String get linePic => data.line ?? '';

  static String get appPic => data.appPic ?? '';
}
