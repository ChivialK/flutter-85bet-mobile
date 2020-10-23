import 'dart:io' show Platform;

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_85bet_mobile/core/internal/orientation_helper.dart';
import 'package:hive/hive.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'core/data/hive_actions.dart';
import 'core/data/hive_adapters_export.dart';
import 'core/internal/global.dart';
import 'env/config_reader.dart';
import 'env/environment.dart';
import 'features/main_app.dart';
import 'injection_container.dart' as di;

FirebaseAnalytics _analytics;

Future<void> mainCommon(Environment env) async {
  // Always call this if the main method is asynchronous
  WidgetsFlutterBinding.ensureInitialized();
  // Load the JSON config into memory
  await ConfigReader.initialize();

  switch (env) {
    case Environment.DEV:
    case Environment.RELEASE:
      debugPrint(
          'Env:${env.toString()}, config Version: ${ConfigReader.getVersion()}, add analytics: ${Global.addAnalytics}');

      break;
  }

  // request permission
  if (Platform.isIOS)
    await _initPermissionList([Permission.location, Permission.storage]);
  else
    await _initPermissionList(Permission.values);

  // setup log
  _setupLogging();

  // setup orientation
  OrientationHelper.setPreferredOrientations();
  OrientationHelper.enabledSystemUIOverlays();

  // setup injector
  await di.init();

  // init hive database
  final docDir = await getApplicationDocumentsDirectory();
  Hive.init(docDir.path);
  debugPrint('Hive initialized, location: $docDir');
  try {
    Hive.registerAdapter(BannerEntityAdapter());
    Hive.registerAdapter(MarqueeEntityAdapter());
    Hive.registerAdapter(GameCategoryModelAdapter());
    Hive.registerAdapter(GamePlatformEntityAdapter());
    Hive.registerAdapter(CookieAdapter());
    Hive.registerAdapter(HiveCookieEntityAdapter());
    Hive.registerAdapter(PromoEntityAdapter());
    Hive.registerAdapter(LoginHiveFormAdapter());
  } catch (e) {
    debugPrint('register hive adapter has error!! $e');
  }

  // check app language setting
  try {
    Box box = await Future.value(getHiveBox(Global.CACHE_APP_DATA));
    if (box.containsKey('lang')) {
      Global.setLanguage = box.get('lang', defaultValue: 'zh');
    } else {
      box.put('lang', Global.lang);
    }
  } catch (e) {
    debugPrint('read app language setting has error!! $e');
  } finally {
    debugPrint('app language: ${Global.lang}');
  }

  // hide keyboard and wait for 500ms to get the correct viewInset
  await SystemChannels.textInput.invokeMethod('TextInput.hide');
  await Future.delayed(Duration(milliseconds: 500));

  // Google Firebase
  if (Global.addAnalytics) {
    _analytics = FirebaseAnalytics();
  }

  // run application
  runApp(new MainApp(_analytics));
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    debugPrint('${rec.loggerName}: [${rec.level.name}] ${rec.message}');
  });
}

Future<void> _initPermissionList(List<Permission> permissions) async {
  try {
    return await permissions.request().then((map) async {
      StringBuffer result = new StringBuffer();
      map.forEach((key, value) {
        result.write('permission: $key is ${value.isGranted}');
        if (key != map.keys.last) result.write('\n');
      });
      debugPrint('Permissions: ${result.toString()}');
    });
  } catch (e) {
    debugPrint('permission request has exception: $e');
  }
}
