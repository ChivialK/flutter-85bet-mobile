import 'dart:async' show StreamSubscription;

import 'package:flutter/services.dart' show DeviceOrientation;
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/core/internal/orientation_helper.dart';
import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';
import 'package:flutter_85bet_mobile/utils/platform_util.dart';

part 'web_game_screen_store.g.dart';

class WebGameScreenStore = _WebGameScreenStore with _$WebGameScreenStore;

enum WebGameScreenStoreState { initial, loading, loaded }

abstract class _WebGameScreenStore with Store {
  final String tag = 'WebGameScreenStore';

  StreamSubscription _sensorSubscription;

  @observable
  DeviceOrientation _deviceOrientation = DeviceOrientation.portraitUp;

  DeviceOrientation _targetOrientation;
  int _sensorRotateId = 1;

  bool _isIos = Global.device.isIos;
  bool _sensorOn = false;
  bool _lockAutoRotate = true;

  get isLockRotate => _lockAutoRotate;
  set lockRotate(bool value) => _lockAutoRotate = value;

  bool get isScreenPortrait =>
      _deviceOrientation == DeviceOrientation.portraitUp ||
      _deviceOrientation == DeviceOrientation.portraitDown;

  @action
  Future<void> rotateScreenLeft() async {
    debugPrint('called rotate left, current: $_deviceOrientation');
    if (_targetOrientation == _deviceOrientation) return;
    switch (_deviceOrientation) {
      case DeviceOrientation.portraitUp:
        return await _rotateScreen(DeviceOrientation.landscapeLeft);
      case DeviceOrientation.landscapeLeft:
        return await _rotateScreen(DeviceOrientation.portraitDown);
      case DeviceOrientation.portraitDown:
        return await _rotateScreen(DeviceOrientation.landscapeRight);
      case DeviceOrientation.landscapeRight:
        return await _rotateScreen(DeviceOrientation.portraitUp);
    }
  }

  @action
  Future<void> rotateScreenById(int receivedId) async {
    if (receivedId != _sensorRotateId) return;
    debugPrint('called rotate by id: $receivedId');
    switch (receivedId) {
      case 0:
        return await _rotateScreen(DeviceOrientation.landscapeRight);
      case 2:
        return await _rotateScreen(DeviceOrientation.landscapeLeft);
      case 3:
        return await _rotateScreen(DeviceOrientation.portraitDown);
      default:
        return await _rotateScreen(DeviceOrientation.portraitUp);
    }
  }

  @action
  Future<void> initSensorStream() async {
    MyLogger.print(msg: 'initializing rotate listener...', tag: tag);
    if (!_isIos && !_sensorOn) {
      PlatformUtil.enableSensor();
      _sensorOn = true;
    }
    if (_sensorSubscription != null && _sensorSubscription.isPaused) {
      try {
        _sensorSubscription.resume();
      } catch (e) {
        MyLogger.warn(
            msg: 'cannot restore rotate listener, subscripting...', tag: tag);
        await _bindSensorListener();
      }
    } else {
      await _bindSensorListener();
    }
  }

  _bindSensorListener() async {
    return await Future.delayed(Duration(milliseconds: 600), () {
      if (_isIos) {
        _bindRotateListener();
      } else {
        try {
          _sensorSubscription = PlatformUtil.sensorEventChannel
              .receiveBroadcastStream()
              .listen((rotateId) {
            debugPrint('sensor event: $rotateId');
            if (_lockAutoRotate) return;
            if (_sensorRotateId == rotateId) return;
            _sensorRotateId = rotateId;
            Future.delayed(Duration(milliseconds: 300), () {
              rotateScreenById(rotateId);
            });
          }, onError: (dynamic error) {
            debugPrint('sensor error: ${error.message}');
          });
        } catch (e) {
          MyLogger.warn(msg: 'bind sensor failed: $e', tag: tag);
          _bindRotateListener();
        }
      }
    });
  }

  _bindRotateListener() {
    try {
      _sensorSubscription = OrientationHelper.onOrientationChange.listen(
        (event) {
          if (_lockAutoRotate) return;
          if (_deviceOrientation == event) return;
          _targetOrientation = event;
          // delay orientation to avoid multiple changes in a short time
          Future.delayed(Duration(milliseconds: 200), () {
            if (_targetOrientation != event) return;
            _rotateScreen(event);
          });
        },
        onError: (dynamic error) {
          debugPrint('sensor error: ${error.message}');
        },
      );
    } catch (e) {
      MyLogger.warn(msg: 'bind sensor failed: $e', tag: tag);
    }
  }

  @action
  Future<void> stopSensor() async {
    MyLogger.print(msg: 'stopping rotate listener...', tag: tag);
    _sensorSubscription?.pause();
    if (!_isIos && _sensorOn) {
      PlatformUtil.disableSensor();
      _sensorOn = false;
    }
    _sensorSubscription.cancel();
    _reset();
  }

  Future<void> _rotateScreen(
    DeviceOrientation target, {
    bool skipCheck = false,
  }) async {
    try {
      if (!skipCheck && target == _deviceOrientation) return;
      MyLogger.print(msg: 'rotating to $target', tag: tag);
      _targetOrientation = target;
      if (_isIos)
        await _rotateIosScreen(target);
      else
        await _rotateAndroidScreen(target);
    } on Exception catch (e) {
      MyLogger.error(msg: 'rotate screen has exception', error: e, tag: tag);
    }
  }

  Future<void> _rotateAndroidScreen(DeviceOrientation target) {
    return OrientationHelper.forceOrientation(_targetOrientation)
        .whenComplete(() {
      debugPrint('rotate complete: $_targetOrientation');
      // use param value in case the [targetOrientation] points to null
      _deviceOrientation = target;
      _targetOrientation = null;
    });
  }

  Future<void> _rotateIosScreen(DeviceOrientation target) {
    if (_targetOrientation == DeviceOrientation.portraitDown)
      _targetOrientation = DeviceOrientation.landscapeRight;

    OrientationHelper.setDesiredOrientations(_targetOrientation);
    PlatformUtil.setIosOrientation(_targetOrientation);
    return _rotateAndroidScreen(target);
  }

  void _reset() {
    _rotateScreen(DeviceOrientation.portraitUp);
    _deviceOrientation = DeviceOrientation.portraitUp;
    _sensorRotateId = 1;
    _sensorOn = false;
    _lockAutoRotate = true;
  }
}
