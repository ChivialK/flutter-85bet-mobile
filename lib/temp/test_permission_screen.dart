import 'package:easy_permission_validator/easy_permission_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/general/toast_widget_export.dart';
import 'package:flutter_85bet_mobile/temp/test_permission_widget.dart';
import 'package:permission_handler/permission_handler.dart';

import '../mylogger.dart';

class TestPermissionScreen extends StatefulWidget {
  @override
  _TestPermissionScreenState createState() => _TestPermissionScreenState();
}

class _TestPermissionScreenState extends State<TestPermissionScreen> {
  String _result = '';

  List<Permission> permissionList = Permission.values;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () async {
      await permissionList.request().then((map) async {
        StringBuffer result = new StringBuffer();
        map.forEach((key, value) {
          result.write('permission: $key is ${value.isGranted}');
          if (key != map.keys.last) result.write('\n');
        });
        debugPrint(result.toString());
        callToast('(auto)\n${result.toString()}');
      });
    });
    return WillPopScope(
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.wifi),
                      iconSize: 60.0,
                      onPressed: () async {
                        EasyPermissionValidator permissionValidator =
                            EasyPermissionValidator(
                          context: context,
                          appName: 'WiFi Permission Validator',
                        );
                        var result = await permissionValidator.location();
                        if (result) {
                          setState(() => _result = 'WiFi Permission accepted');
                        }
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.storage),
                      iconSize: 60.0,
                      onPressed: () async {
                        final permissionValidator = EasyPermissionValidator(
                          context: context,
                          appName: 'Storage Permission Validator',
                          customDialog: TestPermissionWidget(),
                        );
                        var result = await permissionValidator.storage();
                        if (result) {
                          setState(
                              () => _result = 'Storage Permission accepted');
                        }
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Center(
                    child: Text(
                      _result,
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 30),
                  child: RaisedButton(
                    child: Text('map request'),
                    onPressed: () async {
                      await permissionList.request().then((map) async {
                        StringBuffer result = new StringBuffer();
                        map.forEach((key, value) {
                          result
                              .write('permission: $key is ${value.isGranted}');
                          if (key != map.keys.last) result.write('\n');
                        });
                        debugPrint(result.toString());
                        callToast('(auto)\n${result.toString()}');
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onWillPop: () async {
        MyLogger.debug(msg: 'pop test screen', tag: 'TestPermissionScreen');
        return Future(() => true);
      },
    );
  }
}
