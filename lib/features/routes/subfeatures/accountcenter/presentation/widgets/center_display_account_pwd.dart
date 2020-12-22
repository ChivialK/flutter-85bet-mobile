import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_field_widget.dart';
import 'package:flutter_85bet_mobile/features/router/app_navigate.dart';

import '../../data/form/center_password_form.dart';
import '../state/center_store.dart';

class CenterDisplayAccountPassword extends StatefulWidget {
  final CenterStore store;

  CenterDisplayAccountPassword({@required this.store});

  @override
  _CenterDisplayAccountPasswordState createState() =>
      _CenterDisplayAccountPasswordState();
}

class _CenterDisplayAccountPasswordState
    extends State<CenterDisplayAccountPassword> {
  final MemberGridItem pageItem = MemberGridItem.password;

  static final GlobalKey<FormState> _formKey =
      new GlobalKey(debugLabel: 'form');
  final GlobalKey<CustomizeFieldWidgetState> _oldPwdFieldKey =
      new GlobalKey(debugLabel: 'oldpwd');
  final GlobalKey<CustomizeFieldWidgetState> _newPwdFieldKey =
      new GlobalKey(debugLabel: 'newpwd');
  final GlobalKey<CustomizeFieldWidgetState> _conPwdFieldKey =
      new GlobalKey(debugLabel: 'conpwd');

  final double _fieldInset = 72.0;

  void _validateForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
//      debugPrint('The user wants to login with $_username and $_password');
      CenterPasswordForm pwdForm = CenterPasswordForm(
        oldPwd: _oldPwdFieldKey.currentState.getInput,
        newPwd: _newPwdFieldKey.currentState.getInput,
        confirmPwd: _conPwdFieldKey.currentState.getInput,
      );
      if (pwdForm.isValid)
        widget.store.postPassword(pwdForm);
      else
        callToast(localeStr.messageActionFillForm);
    }
  }

  @override
  void initState() {
    widget.store.initLoginDataBox();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.store == null) {
      return Center(
        child: WarningDisplay(
          message:
              Failure.internal(FailureCode(type: FailureType.INHERIT)).message,
        ),
      );
    }
    return WillPopScope(
      onWillPop: () {
        debugPrint('pop center password route');
        Future.delayed(
            Duration(milliseconds: 100), () => RouterNavigate.navigateBack());
        return Future(() => true);
      },
      child: Scaffold(
        body: Container(
          width: Global.device.width,
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            // to dismiss the keyboard when the user tabs out of the TextField
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              primary: true,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(4.0, 20.0, 4.0, 12.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: themeColor.memberIconColor,
                          boxShadow: ThemeInterface.iconBottomShadow,
                        ),
                        child: Icon(
                          pageItem.value.iconData,
                          size: 32 * Global.device.widthScale,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          pageItem.value.label,
                          style: TextStyle(fontSize: FontSize.HEADER.value),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4.0, 20.0, 4.0, 16.0),
                  child: Container(
                    decoration: ThemeInterface.layerShadowDecorRound,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(height: 24.0),
                        new Form(
                          key: _formKey,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6.0),
                                  child: new CustomizeFieldWidget(
                                    key: _oldPwdFieldKey,
                                    fieldType: FieldType.Password,
                                    hint: localeStr.userPwdFieldHintOld,
                                    prefixText: localeStr.userPwdFieldTitleOld,
                                    prefixTextSize: FontSize.SUBTITLE.value,
                                    horizontalInset: _fieldInset,
                                    titleWidthFactor: 0.35,
                                    maxInputLength: InputLimit.PASSWORD_MAX,
                                    errorMsg: localeStr.messageInvalidPassword(
                                      InputLimit.PASSWORD_MIN_OLD,
                                      InputLimit.PASSWORD_MAX,
                                    ),
                                    validCondition: (value) => rangeCheck(
                                      value: value.length,
                                      min: InputLimit.PASSWORD_MIN_OLD,
                                      max: InputLimit.PASSWORD_MAX,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6.0),
                                  child: new CustomizeFieldWidget(
                                    key: _newPwdFieldKey,
                                    fieldType: FieldType.Password,
                                    hint: localeStr.userPwdFieldHintNew,
                                    prefixText: localeStr.userPwdFieldTitleNew,
                                    prefixTextSize: FontSize.SUBTITLE.value,
                                    horizontalInset: _fieldInset,
                                    titleWidthFactor: 0.35,
                                    maxInputLength: InputLimit.PASSWORD_MAX,
                                    errorMsg: localeStr.messageInvalidPassword(
                                      InputLimit.PASSWORD_MIN,
                                      InputLimit.PASSWORD_MAX,
                                    ),
                                    validCondition: (value) => rangeCheck(
                                      value: value.length,
                                      min: InputLimit.PASSWORD_MIN,
                                      max: InputLimit.PASSWORD_MAX,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6.0),
                                  child: new CustomizeFieldWidget(
                                    key: _conPwdFieldKey,
                                    fieldType: FieldType.Password,
                                    hint: localeStr.userPwdFieldHintConfirm,
                                    prefixText:
                                        localeStr.userPwdFieldTitleConfirm,
                                    prefixTextSize: FontSize.SUBTITLE.value,
                                    horizontalInset: _fieldInset,
                                    titleWidthFactor: 0.35,
                                    maxInputLength: InputLimit.PASSWORD_MAX,
                                    errorMsg:
                                        localeStr.messageInvalidConfirmPassword,
                                    validCondition: (value) =>
                                        _conPwdFieldKey.currentState.getInput ==
                                        _newPwdFieldKey.currentState.getInput,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        ///
                        /// Confirm Button
                        ///
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 24.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: RaisedButton(
                                  child:
                                      Text(localeStr.centerTextButtonChangePwd),
                                  onPressed: () {
                                    // clear text field focus
                                    FocusScope.of(context).unfocus();
                                    _validateForm();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24.0),
                      ],
                    ),
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
