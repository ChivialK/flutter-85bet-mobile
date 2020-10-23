import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/checkbox_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_field_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_titled_container.dart';
import 'package:flutter_85bet_mobile/features/router/app_navigate.dart';
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
  List<ReactionDisposer> _disposers;
  CancelFunc _toastDismiss;

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
      if (regForm.isValid && _termsCheckKey.currentState.boxChecked)
        _store.postRegister(regForm);
      else
        callToast(localeStr.messageActionFillForm);
    }
  }

  @override
  void initState() {
    _fieldInset = widget.parentPadding + 32.0;
    _fieldPrefixBg =
        (widget.transparent) ? Colors.transparent : Themes.fieldPrefixBgColor;
    _phoneCodeContainerHeight =
        ((Global.device.isIos) ? Themes.fieldHeight + 8 : Themes.fieldHeight) -
            Themes.minusSize;
    _valueTextPadding = (Global.device.width.roundToDouble() - _fieldInset) *
            Themes.prefixTextWidthFactor -
        Themes.minusSize +
        24.0;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposers ??= [
      /* Reaction on register action */
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _store.waitForRegister,
        // Run some logic with the content of the observed field
        (bool wait) {
          debugPrint('reaction on wait register: $wait');
          if (wait) {
            _toastDismiss = callToastLoading();
          } else if (_toastDismiss != null) {
            _toastDismiss();
            _toastDismiss = null;
          }
        },
      ),
      /* Reaction on register result changed */
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _store.registerResult,
        // Run some logic with the content of the observed field
        (result) {
          debugPrint('reaction on register result: $result');
          if (result == null) return;
          if (result.isSuccess) {
            callToastInfo(localeStr.messageSuccess,
                icon: Icons.check_circle_outline);
          } else {
            callToastError(result.msg);
          }
        },
      ),
    ];
  }

  @override
  void dispose() {
    try {
      if (_toastDismiss != null) {
        _toastDismiss();
        _toastDismiss = null;
      }
      _disposers.forEach((d) => d());
    } on Exception {}
    super.dispose();
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
                ///
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: new CustomizeTitledContainer(
                    prefixText: localeStr.registerFieldTitleAccount,
                    prefixTextSize: FontSize.SUBTITLE.value,
                    prefixBgColor: _fieldPrefixBg,
                    backgroundColor: Themes.fieldPrefixBgColor,
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
                          localeStr.messageInvalidAccount,
                          style: TextStyle(color: Themes.defaultErrorColor),
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
                          localeStr.messageInvalidPasswordNew,
                          style: TextStyle(color: Themes.defaultErrorColor),
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
                          localeStr.messageInvalidAccount,
                          style: TextStyle(color: Themes.defaultErrorColor),
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
                          color: Themes.fieldInputBgColor,
                          alignment: Alignment.center,
                          child: Text(
                            '+84',
                            style: TextStyle(fontSize: FontSize.SUBTITLE.value),
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
                          localeStr.messageInvalidPhone(InputLimit.PHONE_MAX),
                          style: TextStyle(color: Themes.defaultErrorColor),
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
                    backgroundColor: Themes.fieldPrefixBgColor,
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
          child: Divider(height: 16.0),
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
            boxBackgroundColor: Themes.fieldInputBgColor,
            textSize: FontSize.SUBTITLE.value,
            scale: 1.75,
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
            boxBackgroundColor: Themes.fieldInputBgColor,
            textSize: FontSize.SUBTITLE.value,
            maxLines: 2,
            scale: 1.75,
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
                    FocusScope.of(context).requestFocus(new FocusNode());
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                icon: Icon(
                  const IconData(0xe967, fontFamily: 'IconMoon'),
                  color: Themes.defaultTextColor,
                ),
                onPressed: () {
                  RouterNavigate.navigateToPage(RoutePage.service);
                },
              ),
              Expanded(
                child: Text(
                  localeStr.registerButtonServiceHint,
                  style: TextStyle(fontSize: FontSize.SUBTITLE.value),
                  maxLines: 3,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
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
