import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/core/internal/orientation_helper.dart';
import 'package:flutter_85bet_mobile/features/general/toast_widget_export.dart';
import 'package:flutter_85bet_mobile/features/router/app_navigate.dart';
import 'package:flutter_85bet_mobile/temp/test_router.gr.dart';
import 'package:flutter_85bet_mobile/utils/platform_util.dart';

import 'test_input_dialog.dart';

class TestNestedNavScreenView extends StatefulWidget {
  @override
  _TestNestedNavScreenViewState createState() =>
      _TestNestedNavScreenViewState();
}

class _TestNestedNavScreenViewState extends State<TestNestedNavScreenView> {
  DeviceOrientation _deviceOrientation;
  DeviceOrientation _targetOrientation;

//  StreamSubscription<DeviceOrientation> subscription;
  bool _lockAutoRotate = true;
  bool _sensorBind = false;
  bool _sensorOn = false;
  int _rotateIndex;

  @override
  void initState() {
//    subscription = OrientationHelper.onOrientationChange.listen((value) {
//      // If the widget was removed from the tree while the asynchronous platform
//      // message was in flight, we want to discard the reply rather than calling
//      // setState to update our non-existent appearance.
//      if (!mounted) return;
//      setState(() {
//        if (!_lockAutoRotate) {
//          _deviceOrientation = value;
//          _rotateIndex = value.index;
//          debugPrint('auto rotate index: $_rotateIndex');
//          OrientationHelper.forceOrientation(value);
//          Scaffold.of(context).showSnackBar(
//            SnackBar(content: Text('received from sensor: $value')),
//          );
//        } else {
//          Scaffold.of(context).showSnackBar(
//            SnackBar(
//                content: Text('received from sensor, unlock rotate first!!')),
//          );
//        }
//      });
//    });
    super.initState();
  }

  @override
  void dispose() {
//    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _deviceOrientation ??=
        (MediaQuery.of(context).orientation == Orientation.portrait)
            ? DeviceOrientation.portraitUp
            : DeviceOrientation.landscapeLeft;
    _rotateIndex ??= _deviceOrientation.index;
    return (Global.device.isIos) ? _buildIosTest() : _buildAndroidTest();
  }

  Widget _buildAndroidTest() {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Row(
          children: [
            Expanded(child: Text(Global.device.appVersionOrigin)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: RaisedButton(
            onPressed: () =>
                ScreenNavigate.switchScreen(screen: ScreenEnum.Feature),
            child: Text('Return Home'),
          ),
        ),

        /// First group
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text('Device: '),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              onPressed: () =>
                  testNavigator.pushNamed(TestRoutes.testPermissionScreen),
              child: Text('Permission'),
            ),
            RaisedButton(
              onPressed: () =>
                  testNavigator.pushNamed(TestRoutes.testHomeSizeCalc),
              child: Text('Home Calc'),
            ),
          ],
        ),

        /// Second group
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text('Current Orientation: '),
              Text('$_deviceOrientation'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text('Auto Orientation: ${!_lockAutoRotate}'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              StreamBuilder<DeviceOrientation>(
                stream: OrientationHelper.onOrientationChange,
                initialData: _deviceOrientation,
                builder: (context, snapshot) {
                  if (!_lockAutoRotate) {
                    _deviceOrientation = snapshot.data;
                    _rotateIndex = snapshot.data.index;
                    debugPrint('auto rotate index: $_rotateIndex');
                    OrientationHelper.forceOrientation(_deviceOrientation);
                    return Text('Auto Rotate Index: ${snapshot.data.index}');
                  } else {
                    return Text('Auto Rotate Index: -1');
                  }
                },
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  _lockAutoRotate = !_lockAutoRotate;
                });
                debugPrint('lock rotate: $_lockAutoRotate');
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('lock rotate: $_lockAutoRotate')),
                );
              },
              child: Text('lock/unlock'),
            ),
            if (Global.device.isIos == false)
              RaisedButton(
                onPressed: () {
                  if (_targetOrientation == _deviceOrientation)
                    return _deviceOrientation;
                  switch (_deviceOrientation) {
                    case DeviceOrientation.portraitUp:
                      _targetOrientation = DeviceOrientation.landscapeLeft;
                      break;
                    case DeviceOrientation.landscapeLeft:
                      _targetOrientation = DeviceOrientation.portraitDown;
                      break;
                    case DeviceOrientation.portraitDown:
                      _targetOrientation = DeviceOrientation.landscapeRight;
                      break;
                    case DeviceOrientation.landscapeRight:
                      _targetOrientation = DeviceOrientation.portraitUp;
                      break;
                  }
                  OrientationHelper.forceOrientation(_targetOrientation)
                      .whenComplete(() {
                    debugPrint('rotate complete: $_deviceOrientation');
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text('rotate complete: $_targetOrientation')),
                    );
                    setState(() {
                      _deviceOrientation = _targetOrientation;
                      _targetOrientation = null;
                    });
                  });
                },
                child: Text('rotate android'),
              ),
          ],
        ),

        /// Third group (Android Only)
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text('Rotate Sensor: '),
              StreamBuilder(
                stream: PlatformUtil.sensorStream,
                initialData: '-1',
                builder: (context, snapshot) {
                  return Text('${snapshot.data}');
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text('Bind Sensor Channel: $_sensorBind'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text('Sensor Listener On: $_sensorOn'),
            ],
          ),
        ),

        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                if (_sensorBind) {
                  PlatformUtil.disableSensor();
                } else {
                  PlatformUtil.enableSensor();
                }
                setState(() {
                  _sensorBind = !_sensorBind;
                });
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('Bind Sensor = $_sensorBind')),
                );
              },
              child: Text('bind/unbind'),
            ),
            RaisedButton(
              onPressed: () {
                if (_sensorOn) {
                  PlatformUtil.pauseSensorListener();
                } else {
                  PlatformUtil.enableSensorListener();
                }
                setState(() {
                  _sensorOn = !_sensorOn;
                  if (_sensorOn && !_sensorBind) _sensorBind = true;
                });
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('Sensor Listener = $_sensorOn')),
                );
              },
              child: Text('on/off'),
            ),
          ],
        ),

        /// Forth group
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 4.0),
          child: Text('Input Field'),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('dialog'),
              onPressed: () => showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) => new TestInputDialog(),
              ),
            ),
            RaisedButton(
                child: Text('push'),
                onPressed: () =>
                    testNavigator.pushNamed(TestRoutes.testInputRoute)),
          ],
        ),
      ],
    );
  }

  Widget _buildIosTest() {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: RaisedButton(
            onPressed: () =>
                ScreenNavigate.switchScreen(screen: ScreenEnum.Feature),
            child: Text('Return Home'),
          ),
        ),

        /// First group
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text('Device: '),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              onPressed: () =>
                  testNavigator.pushNamed(TestRoutes.testPermissionScreen),
              child: Text('Permission'),
            ),
            RaisedButton(
              onPressed: () {
                callToast(Global.device.toString());
              },
              child: Text('Size'),
            ),
          ],
        ),

        /// Second group
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text('Current Orientation: '),
              Text('$_deviceOrientation'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text('Auto Orientation: ${!_lockAutoRotate}'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              StreamBuilder<DeviceOrientation>(
                stream: OrientationHelper.onOrientationChange,
                initialData: _deviceOrientation,
                builder: (context, snapshot) {
                  if (!_lockAutoRotate) {
                    _deviceOrientation = snapshot.data;
                    _rotateIndex = snapshot.data.index;
                    debugPrint('auto rotate index: $_rotateIndex');
                    OrientationHelper.forceOrientation(_deviceOrientation);
                    return Text('Auto Rotate Index: ${snapshot.data.index}');
                  } else {
                    return Text('Auto Rotate Index: -1');
                  }
                },
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  _lockAutoRotate = !_lockAutoRotate;
                });
                if (!_lockAutoRotate)
                  OrientationHelper.unlockPreferredOrientations();
                else
                  OrientationHelper.setPreferredOrientations();
                debugPrint('lock rotate: $_lockAutoRotate');
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('lock rotate: $_lockAutoRotate')),
                );
              },
              child: Text('lock/unlock'),
            ),
            RaisedButton(
              onPressed: () {
                if (_targetOrientation == _deviceOrientation)
                  return _deviceOrientation;
                switch (_deviceOrientation) {
                  case DeviceOrientation.portraitUp:
                    _targetOrientation = DeviceOrientation.landscapeLeft;
                    break;
                  case DeviceOrientation.landscapeLeft:
                  case DeviceOrientation.portraitDown:
                    _targetOrientation = DeviceOrientation.landscapeRight;
                    break;
                  case DeviceOrientation.landscapeRight:
                    _targetOrientation = DeviceOrientation.portraitUp;
                    break;
                }
                OrientationHelper.setDesiredOrientations(_targetOrientation);
                PlatformUtil.setIosOrientation(_targetOrientation);
                OrientationHelper.forceOrientation(_targetOrientation)
                    .whenComplete(() {
                  debugPrint('rotate complete: $_deviceOrientation');
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                        content: Text('rotate complete: $_targetOrientation')),
                  );
                  setState(() {
                    _deviceOrientation = _targetOrientation;
                    _targetOrientation = null;
                  });
                });
              },
              child: Text('rotate ios'),
            ),
            RaisedButton(
              onPressed: () {
                OrientationHelper.setPreferredOrientations();
                PlatformUtil.setIosOrientation(DeviceOrientation.portraitUp);
                setState(() {
                  _lockAutoRotate = true;
                  _deviceOrientation = DeviceOrientation.portraitUp;
                  _targetOrientation = null;
                });
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('reset orientation')),
                );
              },
              child: Text('reset'),
            ),
          ],
        ),

        /// Forth group
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 4.0),
          child: Text('Input Field'),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('dialog'),
              onPressed: () => showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) => new TestInputDialog(),
              ),
            ),
            RaisedButton(
                child: Text('push'),
                onPressed: () =>
                    testNavigator.pushNamed(TestRoutes.testInputRoute)),
          ],
        ),
      ],
    );
  }
}
