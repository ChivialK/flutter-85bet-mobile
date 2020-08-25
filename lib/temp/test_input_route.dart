import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/general/toast_widget_export.dart';
import 'package:flutter_85bet_mobile/utils/regex_util.dart';
import 'package:flutter_85bet_mobile/utils/value_util.dart';

import 'test_single_input_widget.dart';

///
/// Test field input after navigate and widget height on error
///
class TestInputRoute extends StatefulWidget {
  @override
  State createState() => new _TestInputRouteState();
}

class _TestInputRouteState extends State<TestInputRoute> {
  static final _formKey = new GlobalKey<FormState>();
  final GlobalKey<SingleInputWidgetState> _emailFieldKey =
      new GlobalKey<SingleInputWidgetState>(debugLabel: 'mail');
  final GlobalKey<SingleInputWidgetState> _userFieldKey =
      new GlobalKey<SingleInputWidgetState>(debugLabel: 'user');
  final GlobalKey<SingleInputWidgetState> _pwdFieldKey =
      new GlobalKey<SingleInputWidgetState>(debugLabel: 'pwd');
  final GlobalKey<SingleInputWidgetState> _testFieldKey =
      new GlobalKey<SingleInputWidgetState>(debugLabel: 'test');
  final GlobalKey<SingleInputWidgetState> _testFieldKey2 =
      new GlobalKey<SingleInputWidgetState>(debugLabel: 'test2');
  final GlobalKey<SingleInputWidgetState> _testFieldKey3 =
      new GlobalKey<SingleInputWidgetState>(debugLabel: 'test3');
  final GlobalKey<SingleInputWidgetState> _testFieldKey4 =
      new GlobalKey<SingleInputWidgetState>(debugLabel: 'test4');

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
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.symmetric(horizontal: 16.0, vertical: 48.0),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 36.0, horizontal: 8.0),
          child: new Form(
            key: _formKey,
            child: ListView(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                new SingleInputWidget(
                  key: _emailFieldKey,
                  hint: 'Email',
                  errorMsg: '格式錯誤',
                  prefixIconData: Icons.email,
                  validCondition: (value) => (value.isEmail) ? true : false,
                  parentWidth: MediaQuery.of(context).size.width,
                ),
                new SingleInputWidget(
                  key: _userFieldKey,
                  hint: 'Account',
                  errorMsg: '格式錯誤',
                  prefixTitle: '帳號',
                  validCondition: (value) =>
                      rangeCheck(value: value.length, min: 6, max: 12),
                  parentWidth: MediaQuery.of(context).size.width,
                ),
                new SingleInputWidget(
                  key: _pwdFieldKey,
                  hint: 'Password',
                  errorMsg: '格式錯誤',
                  prefixTitle: '密碼',
                  prefixIconData: Icons.lock,
                  validCondition: (value) =>
                      rangeCheck(value: value.length, min: 6, max: 20),
                  parentWidth: MediaQuery.of(context).size.width,
                ),
                new SingleInputWidget(
                  key: _testFieldKey,
                  hint: 'Test Hint on input',
//                            prefixIconData: Icons.add,
                  persistHint: false,
                  parentWidth: MediaQuery.of(context).size.width,
                ),
                new SingleInputWidget(
                  key: _testFieldKey2,
                  hint: 'Test Suffix Icon',
                  parentWidth: MediaQuery.of(context).size.width,
                  suffixIconData: Icons.edit,
                  suffixAction: (input) => debugPrint('input: $input'),
                ),
                new SingleInputWidget(
                  key: _testFieldKey3,
                  hint: 'Test Suffix Text',
                  parentWidth: MediaQuery.of(context).size.width,
                  prefixTitle: '地址',
                  suffixText: '修改地址',
                  suffixAction: (input) => debugPrint('input: $input'),
                ),
                new SingleInputWidget(
                  key: _testFieldKey4,
                  hint: 'Phone Number',
                  parentWidth: MediaQuery.of(context).size.width,
                  prefixTitle: '電話',
                  prefixIconData: Icons.phone,
                  suffixText: '驗證',
                  suffixAction: (input) => debugPrint('input: $input'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: RaisedButton(
                    onPressed: () => validate(),
                    child: Text('Validate'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: RaisedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Return'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
