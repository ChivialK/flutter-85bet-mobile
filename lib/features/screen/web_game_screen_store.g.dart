// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_game_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WebGameScreenStore on _WebGameScreenStore, Store {
  final _$_deviceOrientationAtom =
      Atom(name: '_WebGameScreenStore._deviceOrientation');

  @override
  DeviceOrientation get _deviceOrientation {
    _$_deviceOrientationAtom.reportRead();
    return super._deviceOrientation;
  }

  @override
  set _deviceOrientation(DeviceOrientation value) {
    _$_deviceOrientationAtom.reportWrite(value, super._deviceOrientation, () {
      super._deviceOrientation = value;
    });
  }

  final _$rotateScreenLeftAsyncAction =
      AsyncAction('_WebGameScreenStore.rotateScreenLeft');

  @override
  Future<void> rotateScreenLeft() {
    return _$rotateScreenLeftAsyncAction.run(() => super.rotateScreenLeft());
  }

  final _$rotateScreenByIdAsyncAction =
      AsyncAction('_WebGameScreenStore.rotateScreenById');

  @override
  Future<void> rotateScreenById(int receivedId) {
    return _$rotateScreenByIdAsyncAction
        .run(() => super.rotateScreenById(receivedId));
  }

  final _$initSensorStreamAsyncAction =
      AsyncAction('_WebGameScreenStore.initSensorStream');

  @override
  Future<void> initSensorStream() {
    return _$initSensorStreamAsyncAction.run(() => super.initSensorStream());
  }

  final _$stopSensorAsyncAction = AsyncAction('_WebGameScreenStore.stopSensor');

  @override
  Future<void> stopSensor() {
    return _$stopSensorAsyncAction.run(() => super.stopSensor());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
