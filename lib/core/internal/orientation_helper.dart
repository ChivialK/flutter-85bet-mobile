import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter/services.dart';
import 'package:orientation/orientation.dart';
import 'package:rxdart/rxdart.dart';

class OrientationHelper {
  static void restoreUI() {
    try {
      debugPrint('Restoring orientation lock...');
      // Rotate to normal
      forceOrientationEasy();
      // Lock Screen Orientation
      setPreferredOrientations();
      // restore the screen to normal SystemUiOverlay
      enabledSystemUIOverlays();
    } on Exception catch (e) {
      debugPrint('Orientation Helper has exception: $e');
    }
  }

  static Future<void> enabledSystemUIOverlays() {
    debugPrint('Restoring system overlays...');
    return OrientationPlugin.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  static Future<void> disabledSystemUIOverlays() {
    debugPrint('Hide System UI');
    // to hide only bottom bar:
//    SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.top]);
    // to hide only status bar:
//    SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);
    return OrientationPlugin.setEnabledSystemUIOverlays([]);
  }

  static Future<void> setPreferredOrientations() {
    return OrientationPlugin.setPreferredOrientations(
        [DeviceOrientation.portraitUp]);
  }

  static Future<void> setDesiredOrientations(DeviceOrientation orientation) {
    return OrientationPlugin.setPreferredOrientations([orientation]);
  }

  static Future<void> unlockPreferredOrientations() {
    return OrientationPlugin.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  static Future<void> forceOrientation(DeviceOrientation orientation) {
    debugPrint('force rotate: $orientation');
    return OrientationPlugin.forceOrientation(orientation);
  }

  static Future<void> forceOrientationEasy({
    bool isPortrait = true,
    bool isReversed = false,
  }) {
    debugPrint('force rotate portrait: $isPortrait, reversed: $isReversed');
    DeviceOrientation ori;
    if (isPortrait && !isReversed)
      ori = DeviceOrientation.portraitUp;
    else if (isPortrait && isReversed)
      ori = DeviceOrientation.portraitDown;
    else if (!isPortrait && isReversed)
      ori = DeviceOrientation.landscapeRight;
    else
      ori = DeviceOrientation.landscapeLeft;
    return OrientationPlugin.forceOrientation(ori);
  }

  /// [DeviceOrientation.portraitUp] is default.
  static final DeviceOrientation initOrientation = DeviceOrientation.portraitUp;

  static Stream<DeviceOrientation> _onOrientationChange;

  static Stream<DeviceOrientation> get onOrientationChange {
    if (_onOrientationChange == null) {
      _onOrientationChange = OrientationPlugin.onOrientationChange
          .throttleTime(Duration(milliseconds: 500), trailing: true)
          .shareValueSeeded(initOrientation)
          .distinct((previous, next) => previous == next);
    }
    return _onOrientationChange;
  }
}
