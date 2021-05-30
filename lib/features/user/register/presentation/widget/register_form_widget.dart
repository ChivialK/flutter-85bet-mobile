import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/checkbox_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_field_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_titled_container.dart';
import 'package:flutter_85bet_mobile/features/router/app_navigate.dart';
import 'package:flutter_85bet_mobile/features/themes/icon_code.dart';
import 'package:flutter_85bet_mobile/features/user/data/entity/user_entity.dart';
import 'package:flutter_85bet_mobile/features/user/login/presentation/widgets/login_navigate.dart';

import '../../../data/form/register_form.dart';
import '../state/register_store.dart';
import 'register_store_inherited_widget.dart';

class RegisterFormWidget extends StatefulWidget {
  final double parentPadding;
  final bool transparent;
  final bool isDialog;

  RegisterFormWidget(this.parentPadding, this.transparent,
      {this.isDialog = false});

  @override
  _RegisterFormWidgetState createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  static final GlobalKey<FormState> _formKey =
      new GlobalKey(debugLabel: 'form');

  final GlobalKey<CustomizeFieldWidgetState> _accountFieldKey =
      new GlobalKey(debugLabel: 'name');
  final GlobalKey<CustomizeFieldWidgetState> _pwdFieldKey =
      new GlobalKey(debugLabel: 'pwd');
  final GlobalKey<CustomizeFieldWidgetState> _confirmFieldKey =
      new GlobalKey(debugLabel: 'confirm');
  final GlobalKey<CustomizeFieldWidgetState> _phoneFieldKey =
      new GlobalKey(debugLabel: 'phone');
  final GlobalKey<CustomizeFieldWidgetState> _introFieldKey =
      new GlobalKey(debugLabel: 'intro');

  final GlobalKey<CheckboxWidgetState> _newsCheckKey =
      new GlobalKey(debugLabel: 'news');
  final GlobalKey<CheckboxWidgetState> _termsCheckKey =
      new GlobalKey(debugLabel: 'terms');

  double _fieldInset;
  double _phoneCodeContainerHeight;
  double _valueTextPadding;
  Color _fieldPrefixBg;

  RegisterStore _store;

  bool _showAccountError = false;
  bool _showPasswordError = false;
  bool _showConfirmError = false;
  bool _showPhoneError = false;

  void _validateForm() {
    if (_store == null || _store.waitForRegister) return;
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
//      debugPrint('The user wants to login with $_username and $_password');
      RegisterForm regForm = RegisterForm(
        username: _accountFieldKey.currentState.getInput,
        password: _pwdFieldKey.currentState.getInput,
        confirmPassword: _confirmFieldKey.currentState.getInput,
        mobileno: _phoneFieldKey.currentState.getInput,
        intro: _introFieldKey.currentState.getInput,
      );
      debugPrint('register form: $regForm, valid: ${regForm.isValid}');
      if (regForm.isValid && _termsCheckKey.currentState.boxChecked) {
        _store.postRegister(regForm);
      } else {
        callToast(localeStr.messageActionFillForm);
      }
    }
  }

  @override
  void initState() {
    _fieldInset = widget.parentPadding + 32.0;
    _fieldPrefixBg = (widget.transparent)
        ? Colors.transparent
        : themeColor.fieldPrefixBgColor;
    _phoneCodeContainerHeight = ((Global.device.isIos)
            ? ThemeInterface.fieldHeight + 8
            : ThemeInterface.fieldHeight) -
        ThemeInterface.minusSize;
    _valueTextPadding = (Global.device.width.roundToDouble() - _fieldInset) *
            ThemeInterface.prefixTextWidthFactor -
        ThemeInterface.minusSize +
        24.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _store ??= RegisterStoreInheritedWidget.of(context).store;
    if (_store == null) {
      return Center(
        child: WarningDisplay(
          message:
              Failure.internal(FailureCode(type: FailureType.INHERIT)).message,
        ),
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: 24.0),
        new Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: <Widget>[
                ///
                /// Account Field
                ///
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: new CustomizeTitledContainer(
                    prefixText: localeStr.registerFieldTitleAccount,
                    prefixTextSize: FontSize.SUBTITLE.value,
                    prefixBgColor: _fieldPrefixBg,
                    backgroundColor: themeColor.fieldPrefixBgColor,
                    horizontalInset: _fieldInset,
                    requiredInput: true,
                    child: new CustomizeFieldWidget(
                      key: _accountFieldKey,
                      fieldType: FieldType.Account,
                      hint: localeStr.hintAccountInput,
                      persistHint: false,
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      maxInputLength: InputLimit.ACCOUNT_MAX,
                      onInputChanged: (input) {
                        setState(() {
                          _showAccountError = !rangeCheck(
                            value: input.length,
                            min: InputLimit.ACCOUNT_MIN,
                            max: InputLimit.ACCOUNT_MAX,
                          );
                        });
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: _valueTextPadding),
                      child: Visibility(
                        visible: _showAccountError,
                        child: Text(
                          localeStr.messageInvalidAccount(
                            InputLimit.ACCOUNT_MIN,
                            InputLimit.ACCOUNT_MAX,
                          ),
                          style: TextStyle(color: themeColor.defaultErrorColor),
                        ),
                      ),
                    ),
                  ],
                ),

                ///
                /// Password Field
                ///
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: new CustomizeTitledContainer(
                    prefixText: localeStr.registerFieldTitlePassword,
                    prefixTextSize: FontSize.SUBTITLE.value,
                    prefixBgColor: _fieldPrefixBg,
                    backgroundColor: Colors.transparent,
                    horizontalInset: _fieldInset,
                    requiredInput: true,
                    child: new CustomizeFieldWidget(
                      key: _pwdFieldKey,
                      fieldType: FieldType.Password,
                      hint: localeStr.hintAccountPassword,
                      persistHint: false,
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      maxInputLength: InputLimit.PASSWORD_MAX,
                      onInputChanged: (input) {
                        setState(() {
                          _showPasswordError = !rangeCheck(
                            value: input.length,
                            min: InputLimit.PASSWORD_MIN_OLD,
                            max: InputLimit.PASSWORD_MAX,
                          );
                        });
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: _valueTextPadding),
                      child: Visibility(
                        visible: _showPasswordError,
                        child: Text(
                          localeStr.messageInvalidPassword(
                            InputLimit.PASSWORD_MIN_OLD,
                            InputLimit.PASSWORD_MAX,
                          ),
                          style: TextStyle(color: themeColor.defaultErrorColor),
                        ),
                      ),
                    ),
                  ],
                ),

                ///
                /// Confirm Password Field
                ///
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: new CustomizeTitledContainer(
                    prefixText: localeStr.registerFieldTitleConfirm,
                    prefixTextSize: FontSize.SUBTITLE.value,
                    prefixBgColor: _fieldPrefixBg,
                    backgroundColor: Colors.transparent,
                    horizontalInset: _fieldInset,
                    requiredInput: true,
                    child: new CustomizeFieldWidget(
                      key: _confirmFieldKey,
                      fieldType: FieldType.Password,
                      hint: localeStr.hintConfirmedInput,
                      persistHint: false,
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      maxInputLength: InputLimit.PASSWORD_MAX,
                      onInputChanged: (input) {
                        setState(() {
                          _showConfirmError = input.isEmpty ||
                              input != _pwdFieldKey.currentState.getInput;
                        });
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: _valueTextPadding),
                      child: Visibility(
                        visible: _showConfirmError,
                        child: Text(
                          localeStr.messageInvalidConfirmPassword,
                          style: TextStyle(color: themeColor.defaultErrorColor),
                        ),
                      ),
                    ),
                  ],
                ),

                ///
                /// Phone Field
                ///
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: new CustomizeTitledContainer(
                    prefixText: localeStr.registerFieldTitlePhone,
                    prefixTextSize: FontSize.SUBTITLE.value,
                    prefixBgColor: _fieldPrefixBg,
                    backgroundColor: Colors.transparent,
                    horizontalInset: _fieldInset,
                    requiredInput: true,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          width: 64.0,
                          height: _phoneCodeContainerHeight,
                          decoration: BoxDecoration(
                            color: themeColor.fieldInputBgColor,
                            border: Border.all(
                                color: themeColor.defaultAccentColor),
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '+886',
                            style: TextStyle(
                              fontSize: FontSize.SUBTITLE.value,
                              color: themeColor.fieldInputColor,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: new CustomizeFieldWidget(
                            key: _phoneFieldKey,
                            fieldType: FieldType.Numbers,
                            hint: localeStr.hintPhoneInput,
                            persistHint: false,
                            padding: const EdgeInsets.symmetric(vertical: 0.0),
                            maxInputLength: InputLimit.PHONE_MAX,
                            onInputChanged: (input) {
                              setState(() {
                                _showPhoneError = !rangeCheck(
                                  value: input.length,
                                  min: InputLimit.PHONE_MIN,
                                  max: InputLimit.PHONE_MAX,
                                );
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: _valueTextPadding),
                      child: Visibility(
                        visible: _showPhoneError,
                        child: Text(
                          localeStr.messageInvalidPhone2(
                            InputLimit.PHONE_MIN,
                            InputLimit.PHONE_MAX,
                          ),
                          style: TextStyle(color: themeColor.defaultErrorColor),
                        ),
                      ),
                    ),
                  ],
                ),

                ///
                /// Referral Code Field
                ///
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: new CustomizeTitledContainer(
                    prefixText: localeStr.registerFieldTitleRecommend,
                    prefixTextSize: FontSize.SUBTITLE.value,
                    prefixBgColor: _fieldPrefixBg,
                    backgroundColor: themeColor.fieldPrefixBgColor,
                    horizontalInset: _fieldInset,
                    child: new CustomizeFieldWidget(
                      key: _introFieldKey,
                      fieldType: FieldType.Numbers,
                      hint: localeStr.hintReferralInput,
                      persistHint: false,
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      maxInputLength: InputLimit.RECOMMEND,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 0.0),
          child: Divider(
              height: 16.0,
              thickness: 1.5,
              color: themeColor.defaultAccentColor),
        ),

        ///
        /// Promo News Check Box
        ///
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: CheckboxWidget(
            key: _newsCheckKey,
            widgetPadding: EdgeInsets.zero,
            textPadding: const EdgeInsets.only(left: 8.0),
            label: localeStr.registerCheckButtonNews,
            textSize: FontSize.SUBTITLE.value,
            scale: 1.5,
          ),
        ),

        ///
        /// Terms Check Box
        ///
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: CheckboxWidget(
            key: _termsCheckKey,
            widgetPadding: EdgeInsets.zero,
            textPadding: const EdgeInsets.only(left: 8.0),
            label: localeStr.registerCheckButtonTerms,
            textSize: FontSize.SUBTITLE.value,
            maxLines: 2,
            scale: 1.5,
            mustCheck: true,
          ),
        ),

        ///
        /// Confirm Button
        ///
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 24.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: RaisedButton(
                  child: Text(localeStr.btnRegister),
                  onPressed: () {
                    // clear text field focus
                    FocusScope.of(context).unfocus();
                    // validate and send request
                    _validateForm();
                  },
                ),
              ),
            ],
          ),
        ),

        ///
        /// Customer Service Hint
        ///
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: RichText(
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: IconButton(
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      IconCode.csService,
                      color: themeColor.defaultAccentColor,
                    ),
                    onPressed: () {
                      RouterNavigate.navigateToPage(
                        RoutePage.service,
                        arg: WebRouteArguments(
                          startUrl: Global.CS_SERVICE_URL,
                        ),
                      );
                      if (widget.isDialog) {
                        Future.delayed(Duration(milliseconds: 100),
                            () => Navigator.of(context).pop());
                      }
                    },
                  ),
                ),
                TextSpan(
                  text: localeStr.registerButtonServiceHint,
                  style: TextStyle(
                    fontSize: FontSize.SUBTITLE.value,
                    color: themeColor.defaultTextColor,
                  ),
                ),
              ])),
        ),

        ///
        /// Auto Login
        ///
        StreamBuilder(
          stream: _store.loginStream,
          builder: (_, snapshot) {
            if (snapshot != null && snapshot.data != null) {
              if (snapshot.data is UserEntity) {
                return LoginNavigate(
                  user: snapshot.data,
                  closeDialog: widget.isDialog,
                );
              } else if (snapshot.data is String) {
                callToastError(localeStr.messageErrorAutoLogin);
                Future.delayed(
                  Duration(milliseconds: 500),
                  () => RouterNavigate.navigateToPage(RoutePage.login),
                );
              }
            }
            return SizedBox.shrink();
          },
        ),
        SizedBox(height: 24.0),
      ],
    );
  }
}
