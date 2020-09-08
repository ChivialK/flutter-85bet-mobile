import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class TestPermissionWidget extends StatefulWidget {
  @override
  _TestPermissionWidgetState createState() => _TestPermissionWidgetState();
}

class _TestPermissionWidgetState extends State<TestPermissionWidget> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: SizedBox(
            height: 300.0,
            width: MediaQuery.of(context).size.width,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Easy Permission Validator Demo',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.perm_camera_mic,
                      size: 60.0,
                      color: Colors.red,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        FlatButton.icon(
                          icon: Icon(Icons.cancel),
                          onPressed: () => _closePopup(),
                          label: Text('Cancel'),
                        ),
                        FlatButton.icon(
                          icon: Icon(Icons.arrow_forward_ios),
                          onPressed: () => _openPermissionSettings(),
                          label: Text('Go To Settings'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _openPermissionSettings() async {
    await openAppSettings();
    _closePopup();
  }

  _closePopup() {
    Navigator.of(context).pop();
  }
}
