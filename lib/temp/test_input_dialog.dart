import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/toast_widget_export.dart';
import 'package:flutter_85bet_mobile/utils/regex_util.dart';

import 'test_single_dropdown_widget.dart';
import 'test_single_input_widget.dart';

///
/// Test input widget in dialog view
///
class TestInputDialog extends StatefulWidget {
  @override
  State createState() => new _TestInputDialogState();
}

class _TestInputDialogState extends State<TestInputDialog> {
  static final _formKey = new GlobalKey<FormState>();
  final GlobalKey<SingleInputWidgetState> _emailFieldKey =
      new GlobalKey<SingleInputWidgetState>(debugLabel: 'mail');
  final GlobalKey<SingleInputWidgetState> _userFieldKey =
      new GlobalKey<SingleInputWidgetState>(debugLabel: 'user');
  final GlobalKey<SingleInputWidgetState> _pwdFieldKey =
      new GlobalKey<SingleInputWidgetState>(debugLabel: 'pwd');
  final GlobalKey<SingleInputWidgetState> _testFieldKey =
      new GlobalKey<SingleInputWidgetState>(debugLabel: 'test');

  final double dialogHeight = Global.device.height * 0.85;

  // screen width - dialog padding
  final double dialogWidth = Global.device.width - 32;

  // screen width - dialog padding - stack padding - text padding
  final double contentWidth = Global.device.width - 32 - 20 - 8;

  List<String> options = ['100', '200', '300'];
  String defaultOption;
  String selectedOption;

  void validate() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      callToast('email:${_emailFieldKey.currentState.inputText}\n'
          'username:${_userFieldKey.currentState.inputText}\n'
          'password:${_pwdFieldKey.currentState.inputText}\n'
          'test:${_testFieldKey.currentState.inputText}');
    }
  }

  @override
  void initState() {
    defaultOption = options[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Duration insetAnimationDuration = const Duration(milliseconds: 100);
    Curve insetAnimationCurve = Curves.decelerate;

    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets +
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      duration: insetAnimationDuration,
      curve: insetAnimationCurve,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Center(
          child: Material(
            // round corner view
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
            ),
            color: themeColor.dialogBgColor,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: dialogWidth,
                maxWidth: dialogWidth,
                minHeight: dialogHeight / 4,
                maxHeight: dialogHeight,
              ),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 50.0, horizontal: 8.0),
                      child: new Form(
                        key: _formKey,
                        child: ListView(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          children: <Widget>[
                            new SingleDropdownWidget(
                              parentWidth: MediaQuery.of(context).size.width,
                              debug: true,
                              prefixIconData: Icons.attach_money,
                              optionValues: options,
                              changeNotify: (data) {
                                if (selectedOption != data.toString())
                                  setState(() {
                                    selectedOption = data.toString();
                                  });
                                debugPrint('selected: $selectedOption');
                              },
                            ),
                            new SingleInputWidget(
                              key: _emailFieldKey,
                              hint: 'Email',
                              errorMsg: '格式錯誤',
                              prefixIconData: Icons.email,
                              validCondition: (value) =>
                                  (value.isEmail) ? true : false,
                              parentWidth: MediaQuery.of(context).size.width,
                              debug: true,
                            ),
                            new SingleDropdownWidget(
                              parentWidth: MediaQuery.of(context).size.width,
                              prefixTitle: '金額',
                              optionValues: options,
                              optionStrings: ['一百', '兩百', '三百'],
                              defaultValueIndex: 1,
                              changeNotify: (data) {
                                if (selectedOption != data.toString())
                                  setState(() {
                                    selectedOption = data.toString();
                                  });
                                debugPrint('selected: $selectedOption');
                              },
                            ),
                            new SingleInputWidget(
                              key: _userFieldKey,
                              hint: 'Account',
                              errorMsg: '格式錯誤',
                              prefixTitle: '帳號',
                              validCondition: (value) => rangeCheck(
                                  value: value.length, min: 6, max: 12),
                              parentWidth: MediaQuery.of(context).size.width,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 2.0,
                      child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
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
}
