import 'dart:io' show Platform;

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'core/data/hive_actions.dart';
import 'core/data/hive_adapters_export.dart';
import 'core/internal/global.dart';
import 'core/internal/language_code.dart';
import 'core/internal/orientation_helper.dart';
import 'env/config_reader.dart';
import 'env/environment.dart';
import 'features/export_internal_file.dart';
import 'features/main_app.dart';
import 'features/main_app_with_firebase.dart';
import 'ga_interface.dart';
import 'injection_container.dart' as di;

Future<void> mainCommon(Environment env) async {
  // Always call this if the main method is asynchronous
  WidgetsFlutterBinding.ensureInitialized();

  // Load the JSON config into memory
  await ConfigReader.initialize();
  switch (env) {
    case Environment.FIREBASE:
      GaInterface.setAnalytics = new FirebaseAnalytics();
      break;
    default:
      // debugPrint('DEV Config Version: ${ConfigReader.getVersion()}');
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
    if (box.containsKey(Global.CACHE_APP_DATA_KEY_LANG)) {
      if (Global.lockLanguage == false) {
        // set language as user preference
        Global.setLocale = box.get(
          Global.CACHE_APP_DATA_KEY_LANG,
          defaultValue: defaultLocale.value.code,
        );
      } else if (box.get(Global.CACHE_APP_DATA_KEY_LANG) != Global.localeCode) {
        // override language if language is locked and different as default
        box.put(Global.CACHE_APP_DATA_KEY_LANG, Global.localeCode);
      }
    } else {
      box.put(Global.CACHE_APP_DATA_KEY_LANG, Global.localeCode);
    }
  } catch (e) {
    debugPrint('read app language setting has error!! $e');
  } finally {
    debugPrint('app language: ${Global.localeCode}');
  }

  // hide keyboard and wait for 500ms to get the correct viewInset
  await SystemChannels.textInput.invokeMethod('TextInput.hide');
  await Future.delayed(Duration(milliseconds: 500));

  if (env == Environment.FIREBASE) {
    // run application with Firebase
    runApp(new MainAppWithFirebase());
  } else {
    // run application
    runApp(new MainApp());
  }
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
