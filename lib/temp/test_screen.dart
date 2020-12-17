import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/features/themes/theme_interface.dart';
import 'package:flutter_85bet_mobile/features/general/bloc_widget_export.dart';
import 'package:flutter_85bet_mobile/features/general/toast_widget_export.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_dropdown_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_field_widget.dart';
import 'package:flutter_85bet_mobile/features/router/app_navigate.dart';
import 'package:flutter_85bet_mobile/mylogger.dart';

import 'test_basic_chip_widget.dart';
import 'test_basic_dropdown_widget.dart';
import 'test_basic_input_widget.dart';
import 'test_single_input_chip_widget.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          MyLogger.debug(msg: 'pop test screen', tag: 'TestScreen');
          return Future(() => true);
        },
        child: Scaffold(
          backgroundColor: themeColor.defaultBackgroundColor,
          body: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: Text('Device: '),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      callToast(Global.device.toString());
                    },
                    child: Text('Size'),
                  ),
                  RaisedButton(
                    onPressed: () =>
                        ScreenNavigate.switchScreen(screen: ScreenEnum.TestNav),
                    child: Text('More'),
                  ),
                  RaisedButton(
                    onPressed: () => ScreenNavigate.switchScreen(),
                    child: Text('Return Home'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: new TestBasicDropdownWidget(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: new TestBasicInputWidget(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: new CustomizeFieldWidget(
                  hint: 'field hint',
                  persistHint: false,
                  prefixText: 'Prefix',
                  titleLetterSpacing: 4,
                  suffixText: 'Suffix',
                  suffixLetterWidth: 3.6,
                  suffixAction: (_) async {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: new CustomizeFieldWidget(
                  hint: 'field hint',
                  persistHint: false,
                  prefixIconData: Icons.edit,
                  prefixText: 'Prefix',
                  titleLetterSpacing: 4,
                  suffixText: 'Suffix',
                  suffixLetterWidth: 3.6,
                  suffixAction: (_) async {},
                  readOnly: true,
//                  useSameBgColor: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: new CustomizeDropdownWidget(
                  prefixIconData: Icons.arrow_drop_down_circle,
                  prefixText: 'Prefix',
                  titleLetterSpacing: 4,
                  optionValues: [1, 2, 3, 4],
                  optionStrings: ['1', '2', '3', '4'],
                  changeNotify: (data) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: <Widget>[
                    TestBasicChipWidget(),
                    SingleInputChipWidget(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: Text('Toast: '),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => callToastError('error toast'),
                    child: Text('ERROR'),
                  ),
                  RaisedButton(
                      onPressed: () => callToastInfo('info toast'),
                      child: Text('INFO')),
                  RaisedButton(
                    onPressed: () {
                      var toastCancel = callToastLoading();
                      Future.delayed(Duration(seconds: 5), () {
                        toastCancel();
                      });
                    },
                    child: Text('LOADING'),
                  ),
                  RaisedButton(
                    onPressed: () => callToast('toast text'),
                    child: Text('TEXT'),
                  ),
                  RaisedButton(
                    onPressed: () => callToast('錯誤訊息', darkBg: true),
                    child: Text('TEXT2'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
