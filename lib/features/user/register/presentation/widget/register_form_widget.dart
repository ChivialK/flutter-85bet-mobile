import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/data/hive_actions.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/data/error/error_message_map.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/checkbox_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/countdown_text_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_field_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_titled_container.dart';
import 'package:flutter_85bet_mobile/features/router/app_navigate.dart';
import 'package:flutter_85bet_mobile/features/user/data/entity/user_entity.dart';
import 'package:flutter_85bet_mobile/features/user/data/form/mobile_verify_form.dart';
import 'package:flutter_85bet_mobile/features/user/login/presentation/widgets/login_navigate.dart';
import 'package:flutter_85bet_mobile/utils/datetime_format.dart';

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
  final GlobalKey<CustomizeFieldWidgetState> _verifyFieldKey =
      new GlobalKey(debugLabel: 'verify');
  final GlobalKey<CustomizeFieldWidgetState> _introFieldKey =
      new GlobalKey(debugLabel: 'intro');

  final GlobalKey<CountdownTextWidgetState> _timerKey =
      new GlobalKey(debugLabel: 'timer');

  final GlobalKey<CheckboxWidgetState> _newsCheckKey =
      new GlobalKey(debugLabel: 'news');
  final GlobalKey<CheckboxWidgetState> _termsCheckKey =
      new GlobalKey(debugLabel: 'terms');

  final String cacheKey = 'lastVerifyRequest';

  Future<void> checkVerifyFuture;

  double _fieldInset;
  double _valueTextPadding;
  Color _fieldPrefixBg;

  RegisterStore _store;
  List<ReactionDisposer> _disposers;
  CancelFunc _toastDismiss;

  bool _showAccountError = false;
  bool _showPasswordError = false;
  bool _showConfirmError = false;
  bool _showPhoneError = false;
  bool _countDown = false;

  Duration _remainCountDown;

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
      if (_termsCheckKey.currentState.boxChecked == false) {
        callToast(localeStr.messageActionCheckTerms);
      } else if (regForm.isValid) {
        _store.postRegister(regForm);
      } else {
        callToast(localeStr.messageActionFillForm);
      }
    }
  }

  Future<void> _getLastVerifyRequestTimer() async {
    try {
      Box box = await Future.value(getHiveBox(Global.CACHE_APP_DATA));
      if (box.containsKey(cacheKey)) {
        final DateTime lastTime = '${box.get(cacheKey)}'.toDatetime();
        if (lastTime.isAfterSeconds(180)) {
          _countDown = false;
          debugPrint('no remaining count down');
        } else {
//          debugPrint('now: ${DateTime.now()} last: $lastTime');
          int passed = DateTime.now().difference(lastTime).inSeconds;
          debugPrint('count down passed: $passed');
          if (passed > 180) return;
          _remainCountDown = Duration(seconds: 180 - passed);
          debugPrint('remain count down: $_remainCountDown');
          _countDown = true;
        }
      }
    } catch (e) {
      debugPrint('read last verify datetime has error!! $e');
      MyLogger.debug(msg: 'read last verify datetime has error!! $e');
    }
  }

  void _saveLastVerifyRequestTime() async {
    try {
      Box box = await Future.value(getHiveBox(Global.CACHE_APP_DATA));
      box.put(cacheKey, DateTime.now().toString());
      debugPrint('write last verify datetime success');
    } catch (e) {
      debugPrint('write last verify datetime has error!! $e');
      MyLogger.debug(msg: 'write last verify datetime has error!! $e');
    }
  }

  @override
  void initState() {
    _fieldInset = widget.parentPadding + 32.0;
    _fieldPrefixBg = (widget.transparent)
        ? Colors.transparent
        : themeColor.fieldPrefixBgColor;
    _valueTextPadding = (Global.device.width.roundToDouble() - _fieldInset) *
            ThemeInterface.prefixTextWidthFactor -
        ThemeInterface.minusSize +
        24.0;
    super.initState();
    checkVerifyFuture = Future.wait([_getLastVerifyRequestTimer()]);
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
            callToastInfo(
                MessageMap.getSuccessMessage(result.msg, RouteEnum.REGISTER),
                icon: Icons.check_circle_outline);
          } else {
            callToastError(
                MessageMap.getErrorMessage(result.msg, RouteEnum.REGISTER));
          }
        },
      ),
    ];
  }

  @override
  void didUpdateWidget(RegisterFormWidget oldWidget) {
    checkVerifyFuture = null;
    super.didUpdateWidget(oldWidget);
    checkVerifyFuture = Future.wait([_getLastVerifyRequestTimer()]);
  }

  @override
  void dispose() {
    checkVerifyFuture = null;
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
    return FutureBuilder(
      future: checkVerifyFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
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
                          backgroundColor: Colors.transparent,
                          requiredInput: true,
                          child: Padding(
                            padding: EdgeInsets.only(right: _fieldInset / 3),
                            child: new CustomizeFieldWidget(
                              key: _accountFieldKey,
                              fieldType: FieldType.Account,
                              hint: localeStr.hintAccountInput,
                              persistHint: false,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 0.0),
                              roundCorner: false,
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
                                style: TextStyle(
                                    color: themeColor.defaultErrorColor),
                              ),
                            ),
                          ),
                        ],
                      ),

                      ///
                      /// Password Field
                      ///
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: new CustomizeTitledContainer(
                          prefixText: localeStr.registerFieldTitlePassword,
                          prefixTextSize: FontSize.SUBTITLE.value,
                          prefixBgColor: _fieldPrefixBg,
                          backgroundColor: Colors.transparent,
                          requiredInput: true,
                          child: Padding(
                            padding: EdgeInsets.only(right: _fieldInset / 3),
                            child: new CustomizeFieldWidget(
                              key: _pwdFieldKey,
                              fieldType: FieldType.Password,
                              hint: localeStr.hintAccountPassword,
                              persistHint: false,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 0.0),
                              roundCorner: false,
                              maxInputLength: InputLimit.PASSWORD_MAX,
                              onInputChanged: (input) {
                                setState(() {
                                  _showPasswordError = !rangeCheck(
                                    value: input.length,
                                    min: InputLimit.PASSWORD_MIN,
                                    max: InputLimit.PASSWORD_MAX,
                                  );
                                });
                              },
                            ),
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
                                  InputLimit.PASSWORD_MIN,
                                  InputLimit.PASSWORD_MAX,
                                ),
                                style: TextStyle(
                                    color: themeColor.defaultErrorColor),
                              ),
                            ),
                          ),
                        ],
                      ),

                      ///
                      /// Confirm Password Field
                      ///
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: new CustomizeTitledContainer(
                          prefixText: localeStr.registerFieldTitleConfirm,
                          prefixTextSize: FontSize.SUBTITLE.value,
                          prefixBgColor: _fieldPrefixBg,
                          backgroundColor: Colors.transparent,
                          titleLetterSpacing: 3.0,
                          requiredInput: true,
                          child: Padding(
                            padding: EdgeInsets.only(right: _fieldInset / 3),
                            child: new CustomizeFieldWidget(
                              key: _confirmFieldKey,
                              fieldType: FieldType.Password,
                              hint: localeStr.hintConfirmedInput,
                              persistHint: false,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 0.0),
                              roundCorner: false,
                              maxInputLength: InputLimit.PASSWORD_MAX,
                              onInputChanged: (input) {
                                setState(() {
                                  _showConfirmError = input.isEmpty ||
                                      input !=
                                          _pwdFieldKey.currentState.getInput;
                                });
                              },
                            ),
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
                                style: TextStyle(
                                    color: themeColor.defaultErrorColor),
                              ),
                            ),
                          ),
                        ],
                      ),

                      ///
                      /// Phone Field
                      ///
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: new CustomizeTitledContainer(
                          prefixText: localeStr.registerFieldTitlePhone,
                          prefixTextSize: FontSize.SUBTITLE.value,
                          prefixBgColor: _fieldPrefixBg,
                          backgroundColor: Colors.transparent,
                          requiredInput: true,
                          child: Padding(
                            padding: EdgeInsets.only(right: _fieldInset / 3),
                            child: new CustomizeFieldWidget(
                              key: _phoneFieldKey,
                              fieldType: FieldType.Numbers,
                              hint: localeStr.hintPhoneInput,
                              persistHint: false,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 0.0),
                              roundCorner: false,
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
                        ),
                      ),

                      ///
                      /// Phone Verify Button
                      ///
                      Padding(
                        padding: EdgeInsets.only(left: _valueTextPadding - 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: (_countDown) ? 20.0 : 24.0),
                                child: GradientButton(
                                  expand: true,
                                  height: Global.device.comfortButtonHeight,
                                  child: (_countDown)
                                      ? CountdownTextWidget(_timerKey,
                                          duration: _remainCountDown ??
                                              Duration(seconds: 180),
                                          callback: () {
                                          setState(() {
                                            _countDown = false;
                                          });
                                        })
                                      : Text(localeStr
                                          .registerButtonTitleSendVerify),
                                  onPressed: (_countDown)
                                      ? () {
                                          callToast(localeStr
                                              .messageActionTooFrequent);
                                        }
                                      : () {
                                          if (!_showPhoneError &&
                                              _phoneFieldKey.currentState !=
                                                  null &&
                                              _phoneFieldKey.currentState
                                                  .getInput.isNotEmpty) {
                                            if (_store.lockVerify) {
                                              callToastInfo(
                                                  localeStr.messageWait);
                                              return;
                                            }
                                            // clear text field focus
                                            FocusScope.of(context)
                                                .requestFocus(new FocusNode());
                                            // send verify request
                                            _store
                                                .sendVerify(MobileVerifyForm(
                                              mobile: _phoneFieldKey
                                                  .currentState.getInput,
                                              uuid: Global.device.uuid,
                                            ))
                                                .then((success) {
                                              // start count down if success
                                              if (success && mounted) {
                                                callToast(localeStr
                                                    .messageSentVerify);
                                                _remainCountDown = null;
                                                _saveLastVerifyRequestTime();
                                                setState(() {
                                                  _countDown = true;
                                                });
                                              }
                                            });
                                          } else {
                                            callToast(
                                                localeStr.messageInvalidPhone(
                                                    InputLimit.PHONE_MAX));
                                          }
                                        },
                                ),
                              ),
                            ),
                          ],
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
                                localeStr
                                    .messageInvalidPhone(InputLimit.PHONE_MAX),
                                style: TextStyle(
                                    color: themeColor.defaultErrorColor),
                              ),
                            ),
                          ),
                        ],
                      ),

                      ///
                      /// Verify Phone Field
                      ///
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: new CustomizeTitledContainer(
                          prefixText: localeStr.registerFieldTitleVerify,
                          prefixTextSize: FontSize.SUBTITLE.value,
                          prefixBgColor: _fieldPrefixBg,
                          backgroundColor: Colors.transparent,
                          titleLetterSpacing: 0.0,
                          requiredInput: true,
                          child: Padding(
                            padding: EdgeInsets.only(right: _fieldInset / 3),
                            child: new CustomizeFieldWidget(
                              key: _verifyFieldKey,
                              fieldType: FieldType.Numbers,
                              hint: localeStr.registerFieldHintVerify,
                              persistHint: false,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 0.0),
                              roundCorner: false,
                              maxInputLength: InputLimit.VERIFY,
                            ),
                          ),
                        ),
                      ),

                      ///
                      /// Referral Code Field
                      ///
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: new CustomizeTitledContainer(
                          prefixText: localeStr.registerFieldTitleRecommend,
                          prefixTextSize: FontSize.SUBTITLE.value,
                          prefixBgColor: _fieldPrefixBg,
                          backgroundColor: Colors.transparent,
                          child: Padding(
                            padding: EdgeInsets.only(right: _fieldInset / 3),
                            child: new CustomizeFieldWidget(
                              key: _introFieldKey,
                              fieldType: FieldType.Numbers,
                              hint: localeStr.hintReferralInput,
                              persistHint: false,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 0.0),
                              roundCorner: false,
                              maxInputLength: InputLimit.RECOMMEND,
                            ),
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
                    color: themeColor.defaultDividerColor,
                    thickness: 3.0),
              ),

              ///
              /// Promo News Check Box
              ///
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 12.0),
                child: CheckboxWidget(
                  key: _newsCheckKey,
                  widgetPadding: EdgeInsets.zero,
                  textPadding: const EdgeInsets.only(left: 8.0),
                  label: localeStr.registerCheckButtonNews,
                  boxBackgroundColor: themeColor.fieldInputBgColor,
                  textSize: FontSize.SUBTITLE.value,
                  scale: 1.75,
                ),
              ),

              ///
              /// Terms Check Box
              ///
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 12.0),
                child: CheckboxWidget(
                  key: _termsCheckKey,
                  widgetPadding: EdgeInsets.zero,
                  textPadding: const EdgeInsets.only(left: 8.0),
                  label: localeStr.registerCheckButtonTerms,
                  boxBackgroundColor: themeColor.fieldInputBgColor,
                  textSize: FontSize.SUBTITLE.value,
                  maxLines: 2,
                  scale: 1.75,
                  mustCheck: true,
                ),
              ),

              ///
              /// Confirm Button
              ///
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 24.0),
                child: GradientButton(
                  expand: true,
                  child: Text(localeStr.btnRegister),
                  onPressed: () {
                    // clear text field focus
                    FocusScope.of(context).unfocus();
                    // validate and send request
                    _validateForm();
                  },
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
                    Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: GestureDetector(
                          onTap: () {
                            RouterNavigate.navigateToPage(RoutePage.service);
                          },
                          child: networkImageBuilder('images/sidebar2.jpg',
                              imgScale: 2.0)),
                    ),
                    Text(
                      localeStr.registerButtonServiceHint,
                      style: TextStyle(
                          fontSize: FontSize.SUBTITLE.value,
                          color: themeColor.secondaryTextColor1),
                      maxLines: 3,
                      overflow: TextOverflow.visible,
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
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
