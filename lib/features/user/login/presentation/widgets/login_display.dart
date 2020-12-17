import 'dart:async' show Timer;

import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/checkbox_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_field_widget.dart';

import '../../../data/form/login_form.dart';
import '../../../register/presentation/register_route.dart';
import '../state/login_store.dart';
import 'login_navigate.dart';

class LoginDisplay extends StatefulWidget {
  final LoginStore store;
  final bool returnHome;
  final bool isDialog;

  LoginDisplay({
    Key key,
    @required this.store,
    this.returnHome = false,
    this.isDialog = false,
  }) : super(key: key);

  @override
  _LoginDisplayState createState() => _LoginDisplayState();
}

class _LoginDisplayState extends State<LoginDisplay> with AfterLayoutMixin {
  static final GlobalKey<FormState> _formKey =
      new GlobalKey(debugLabel: 'form');
  final GlobalKey<CustomizeFieldWidgetState> _accountFieldKey =
      new GlobalKey(debugLabel: 'name');
  final GlobalKey<CustomizeFieldWidgetState> _pwdFieldKey =
      new GlobalKey(debugLabel: 'pwd');
  final GlobalKey<CheckboxWidgetState> _fastKey =
      new GlobalKey(debugLabel: 'fast');

  List<ReactionDisposer> _disposers;
  bool _useFastLoginData = false;
  bool _waitForClose = false;
  int _loadingStack = 0;
  LoginHiveForm _hiveForm;

  Timer _routeTimer;
  bool _loginSuccess = false;
  Widget formWidget;

  void _validateForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
//      debugPrint('The user wants to login with $_username and $_password');
      _hiveForm = LoginHiveForm(
        account: _accountFieldKey.currentState.getInput,
        password: _pwdFieldKey.currentState.getInput,
        fastLogin: _fastKey.currentState.boxChecked,
      );
      if (_hiveForm.isValid)
        widget.store.login(_hiveForm.simple, _hiveForm.fastLogin);
      else
        callToast(localeStr.messageActionFillForm);
    }
  }

  void _updateFields() {
    if (!_useFastLoginData &&
        _hiveForm != null &&
        _accountFieldKey != null &&
        _pwdFieldKey != null) {
      _useFastLoginData = true;
      try {
        _fastKey.currentState.setChecked = _hiveForm.fastLogin;
        if (_hiveForm.fastLogin) {
          Future.delayed(Duration(milliseconds: 100), () {
            _accountFieldKey.currentState.setInput = _hiveForm.account;
          });
          Future.delayed(Duration(milliseconds: 200), () {
            _pwdFieldKey.currentState.setInput = _hiveForm.password;
          });
        }
      } catch (e) {
        MyLogger.error(msg: 'update dialog failed!! $e', error: e);
      }
    }
  }

  void _checkHiveForm(LoginHiveForm form) {
    debugPrint('checking hive login form...');
    if (_hiveForm == form) return;
    _hiveForm = form;
    if (_hiveForm != null)
      Future.delayed(Duration(milliseconds: 200), () {
        if (!mounted) return;
        if (_loadingStack != 1)
          setState(() {
            _loadingStack = 1;
          });
        _updateFields();
      });
  }

  @override
  void didChangeDependencies() {
    debugPrint('didChangeDependencies');
    super.didChangeDependencies();
    _disposers ??= [
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => widget.store.hiveLoginForm,
        // Run some logic with the content of the observed field
        (form) => _checkHiveForm(form),
      ),
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => widget.store.waitForLogin,
        // Run some logic with the content of the observed field
        (bool wait) {
          debugPrint('reaction on wait for login: $wait');
          if (wait) {
            _routeTimer?.cancel();
            _routeTimer = Timer.periodic(Duration(milliseconds: 200), (_) {
              if (widget.store.waitForLogin == false &&
                  getAppGlobalStreams.hasUser &&
                  !_waitForClose) {
                debugPrint('rerouting...');
                _waitForClose = true;
                setState(() {
                  _loginSuccess = true;
                });
              }
            });
          }
        },
      ),
    ];
  }

  @override
  void didUpdateWidget(LoginDisplay oldWidget) {
    debugPrint('didUpdateWidget');
    formWidget = null;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('rebuild login display');
    formWidget ??= _buildFormWidget();
    return Stack(
      children: [
        /// loading icon
        Positioned(
          top: 32,
          right: 16,
          child: Observer(
            builder: (context) {
              if (widget.store.waitForHive || widget.store.waitForLogin)
                return SizedBox(
                  height: 14,
                  width: 14,
                  child: CircularProgressIndicator(strokeWidth: 3.0),
                );
              else
                return SizedBox.shrink();
            },
          ),
        ),

        /// content box
        Container(
          constraints: BoxConstraints(
            maxWidth: Global.device.width,
            maxHeight: Global.device.featureContentHeight,
          ),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            primary: true,
            child: Container(
              constraints: BoxConstraints(
                minHeight: 360.0,
              ),
              color: themeColor.defaultLayeredBackgroundColor,
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ///
                  /// title row and back button
                  ///
                  SizedBox(
                    width: Global.device.width - 24,
                    height: FontSize.TITLE.value * 3,
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            localeStr.pageTitleLogin,
                            style: TextStyle(fontSize: FontSize.TITLE.value),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: themeColor.dialogCloseIconColor,
                              size: 32.0 * Global.device.widthScale,
                            ),
                            visualDensity: VisualDensity.compact,
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 0.0),
                            onPressed: () {
                              // clear text field focus
                              FocusScope.of(context).unfocus();
                              RouterNavigate.navigateBack();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 12.0),
                    child: Divider(height: 2.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                    child: formWidget,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 16.0),
                    child: (Global.device.widthScale < 0.9)
                        ? Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FittedBox(child: _buildColoredButtons()),
                            ],
                          )
                        : _buildColoredButtons(),
                  ),

                  ///
                  /// normal button
                  ///
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                    child: RaisedButton(
                      child: Text(localeStr.btnLogin),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
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
          ),
        ),
        if (_loginSuccess)
          LoginNavigate(
            returnHomePage: widget.returnHome,
            closeDialog: widget.isDialog,
          ),
      ],
    );
  }

  Widget _buildFormWidget() {
    debugPrint('rebuild login display form');
    return InkWell(
      // to dismiss the keyboard when the user tabs out of the TextField
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: new Form(
        key: _formKey,
        child: ListView(
          primary: false,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
//            /* Login Hint Text*/
//            Padding(
//              padding: const EdgeInsets.only(bottom: 8.0),
//              child: Text(
//                localeStr.hintTitleLogin,
//                textAlign: TextAlign.left,
//                style: TextStyle(color: themeColor.defaultHintColor),
//              ),
//            ),
            new CustomizeFieldWidget(
              key: _accountFieldKey,
              fieldType: FieldType.Account,
              persistHint: false,
              hint: localeStr.hintAccountInput,
              prefixText: localeStr.hintAccount,
              prefixTextSize: FontSize.SUBTITLE.value,
              maxInputLength: InputLimit.ACCOUNT_MAX,
              errorMsg: localeStr.messageInvalidAccount,
              validCondition: (value) => rangeCheck(
                  value: value.length,
                  min: InputLimit.ACCOUNT_MIN,
                  max: InputLimit.ACCOUNT_MAX),
            ),
            SizedBox(height: 12.0),
            new CustomizeFieldWidget(
              key: _pwdFieldKey,
              fieldType: FieldType.Password,
              persistHint: false,
              hint: localeStr.hintPasswordInput,
              prefixText: localeStr.hintAccountPassword,
              prefixTextSize: FontSize.SUBTITLE.value,
              maxInputLength: InputLimit.PASSWORD_MAX,
              errorMsg: localeStr.messageInvalidPasswordNew,
              validCondition: (value) => rangeCheck(
                  value: value.length,
                  min: InputLimit.PASSWORD_MIN_OLD,
                  max: InputLimit.PASSWORD_MAX),
            ),
            SizedBox(height: 8.0),
            /* Login CheckBox */
            CheckboxWidget(
              key: _fastKey,
              label: localeStr.btnFastLogin,
              initValue: _hiveForm?.fastLogin ?? false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColoredButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            // clear text field focus
            FocusScope.of(context).unfocus();
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (_) => new RegisterRoute(isDialog: true),
            );
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  localeStr.btnRegister,
                  style: TextStyle(
                    fontSize: FontSize.SUBTITLE.value,
                    color: Color(0xfffec017),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints.tight(Size(24, 24)),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xfffec017),
                ),
                child: Icon(
                  const IconData(0xf234, fontFamily: 'FontAwesome'),
                  color: Colors.white,
                  size: 16.0,
                ),
              )
            ],
          ),
        ),
        SizedBox(width: 6.0),
        GestureDetector(
          onTap: () {
            // clear text field focus
            FocusScope.of(context).unfocus();
            RouterNavigate.navigateToPage(RoutePage.service);
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  localeStr.btnResetPassword,
                  style: TextStyle(
                    fontSize: FontSize.SUBTITLE.value,
                    color: Color(0xff33b6e4),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints.tight(Size(24, 24)),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff33b6e4),
                ),
                child: Icon(
                  const IconData(0xf128, fontFamily: 'FontAwesome'),
                  color: Colors.white,
                  size: 16.0,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    _checkHiveForm(widget.store.hiveLoginForm);
  }
}
