import 'env/environment.dart';
import 'main_common.dart';
import 'main_release.reflectable.dart';

Future<void> main() async {
  // setup reflectable support (build target defined in build.yaml)
  initializeReflectable();
  await mainCommon(Environment.release);
}
