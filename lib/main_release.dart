// ignore: unused_import
import 'package:reflectable/reflectable.dart';

import 'core/internal/global.dart';
import 'env/environment.dart';
import 'main_common.dart';
import 'main_release.reflectable.dart';

Future<void> main() async {
  // setup reflectable support (build target defined in build.yaml)
  initializeReflectable();
  Future.sync(() => Global.addAnalytics = true);
  await mainCommon(Environment.RELEASE);
}
