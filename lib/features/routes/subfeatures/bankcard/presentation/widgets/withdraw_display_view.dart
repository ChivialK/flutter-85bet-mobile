import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_field_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_titled_container.dart';
import 'package:flutter_85bet_mobile/features/router/app_global_streams.dart';
import 'package:flutter_85bet_mobile/features/routes/member/presentation/data/member_grid_item.dart';
import 'package:flutter_85bet_mobile/utils/value_util.dart';

import '../../data/form/withdraw_form.dart';
import '../../data/models/bankcard_model.dart';
import '../state/withdraw_store.dart';

class WithdrawDisplayView extends StatefulWidget {
  final WithdrawStore store;
  final BankcardModel bankcard;

  WithdrawDisplayView({@required this.store, @required this.bankcard});

  @override
  _WithdrawDisplayViewState createState() => _WithdrawDisplayViewState();
}

class _WithdrawDisplayViewState extends State<WithdrawDisplayView> {
  final String tag = 'WithdrawDisplayView';
  final MemberGridItem pageItem = MemberGridItem.withdraw;

  static final GlobalKey<FormState> _formKey =
      new GlobalKey(debugLabel: 'form');
  final GlobalKey<CustomizeFieldWidgetState> _amountFieldKey =
      new GlobalKey(debugLabel: 'amount');
  final GlobalKey<CustomizeFieldWidgetState> _passwordFieldKey =
      new GlobalKey(debugLabel: 'password');
  final double _fieldInset = 48.0;

  double _valueTextPadding;
  bool _showAmountError = false;
  bool _showPasswordError = false;

  double _currentCredit = 0;
  int _amountMin = 300;
  int _amountMax = 0;

  // int _flowLimit = 0;

  void _validateForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      WithdrawForm dataForm = WithdrawForm(
        amount: _amountFieldKey.currentState.getInput,
        password: _passwordFieldKey.currentState.getInput,
        type: '0',
      );
      // if (_currentCredit != -1) {
      //   var hasEnoughFlow = rangeCheck(
      //       value: dataForm.amount.strToInt,
      //       min: _amountMin,
      //       // max: _currentCredit - _flowLimit);
      //       max: _currentCredit);
      //   debugPrint('hasEnoughFlow= $hasEnoughFlow');
      //   if (!hasEnoughFlow) {
      //     callToast(localeStr.withdrawViewOptionHint2 + '$_flowLimit');
      //     return;
      //   }
      // }
      if (dataForm.isValid) {
        debugPrint('bankcard form: ${dataForm.toJson()}');
        if (widget.store.waitForWithdrawResult) {
          callToast(localeStr.messageWait);
        } else {
          widget.store.sendRequest(dataForm);
        }
      } else {
        callToast(localeStr.messageActionFillForm);
      }
    }
  }

  @override
  void initState() {
    _valueTextPadding = (Global.device.width.roundToDouble() - _fieldInset) *
            ThemeInterface.prefixTextWidthFactor -
        ThemeInterface.minusSize;
    super.initState();
    _amountMax = widget.store.limit;
    // _flowLimit = widget.store.rollback;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    try {
      _currentCredit =
          getAppGlobalStreams.getCredit(addSymbol: false).strToDouble;
      debugPrint("user credit: $_currentCredit");
    } catch (e) {
      _currentCredit = -1;
      debugPrint("get user credit has exception: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Global.device.width - 24.0,
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
                    decoration: ThemeInterface.pageIconContainerDecor,
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
              padding: const EdgeInsets.fromLTRB(4.0, 20.0, 4.0, 0.0),
              child: Container(
                decoration: ThemeInterface.layerShadowDecor,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 30.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildRow(localeStr.bankcardViewTitleOwner,
                              widget.bankcard.firstName),
                          _buildRow(localeStr.bankcardViewTitleBankName,
                              widget.bankcard.bankName),
                          _buildRow(localeStr.bankcardViewTitleCardNumber,
                              widget.bankcard.bankAccountNo),
                          _buildRow(localeStr.bankcardViewTitleBankBranch,
                              widget.bankcard.bankAddress),
                          if (widget.bankcard.bankProvince.isNotEmpty)
                            _buildRow(localeStr.bankcardViewTitleBankProvince,
                                widget.bankcard.bankProvince),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 16.0),
              child: Container(
                decoration: ThemeInterface.layerShadowDecorBottom,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 24.0),
                    new Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          children: <Widget>[
                            ///
                            /// Amount Input Field
                            ///
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: new CustomizeTitledContainer(
                                prefixText: localeStr.withdrawViewTitleAmount,
                                prefixTextSize: FontSize.SUBTITLE.value,
                                backgroundColor: themeColor.fieldPrefixBgColor,
                                horizontalInset: _fieldInset,
                                child: new CustomizeFieldWidget(
                                  key: _amountFieldKey,
                                  fieldType: FieldType.Numbers,
                                  hint: '$_amountMin ~ $_amountMax',
                                  persistHint: false,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 0.0),
                                  maxInputLength: 6,
                                  onInputChanged: (input) {
                                    setState(() {
                                      _showAmountError = !rangeCheck(
                                        value: (input.isNotEmpty)
                                            ? int.parse(input)
                                            : 0,
                                        min: _amountMin,
                                        max: _amountMax,
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
                                  padding:
                                      EdgeInsets.only(left: _valueTextPadding),
                                  child: Visibility(
                                    visible: _showAmountError,
                                    child: Text(
                                      '${localeStr.messageInvalidDepositAmountMinLimit}$_amountMin',
                                      style: TextStyle(
                                          color: themeColor.defaultErrorColor),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            ///
                            /// Password Input Field
                            ///
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: new CustomizeTitledContainer(
                                prefixText: localeStr.withdrawViewTitlePwd,
                                prefixTextSize: FontSize.SUBTITLE.value,
                                backgroundColor: themeColor.fieldPrefixBgColor,
                                horizontalInset: _fieldInset,
                                child: new CustomizeFieldWidget(
                                  key: _passwordFieldKey,
                                  fieldType: FieldType.Password,
                                  hint: '',
                                  persistHint: false,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 0.0),
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
                                  padding:
                                      EdgeInsets.only(left: _valueTextPadding),
                                  child: Visibility(
                                    visible: _showPasswordError,
                                    child: Text(
                                      localeStr.messageInvalidWithdrawPassword,
                                      style: TextStyle(
                                          color: themeColor.defaultErrorColor),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    ///
                    /// Limit Hint
                    ///
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 4.0),
                      child: Text(
                        '※ ${localeStr.withdrawViewHintMax} $_amountMax',
                        style: TextStyle(
                          fontSize: FontSize.SUBTITLE.value,
                          color: themeColor.defaultHintColor,
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       vertical: 4.0, horizontal: 16.0),
                    //   child: RichText(
                    //     maxLines: 2,
                    //     text: TextSpan(
                    //       children: <InlineSpan>[
                    //         WidgetSpan(
                    //           child: Padding(
                    //             padding: const EdgeInsets.only(
                    //                 right: 4.0, bottom: 2.0),
                    //             child: Icon(
                    //               const IconData(0xf05a,
                    //                   fontFamily: 'FontAwesome'),
                    //               color: themeColor.hintHyperLink,
                    //               size: FontSize.NORMAL.value,
                    //             ),
                    //           ),
                    //         ),
                    //         TextSpan(
                    //           text: localeStr.withdrawViewOptionHint2,
                    //           style: TextStyle(color: themeColor.hintHyperLink),
                    //         ),
                    //         TextSpan(
                    //           text: '$_flowLimit',
                    //           style: TextStyle(color: themeColor.hintHyperLink),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    //   child: RichText(
                    //     maxLines: 2,
                    //     text: TextSpan(
                    //       children: <InlineSpan>[
                    //         WidgetSpan(
                    //           child: Padding(
                    //             padding: const EdgeInsets.only(
                    //                 right: 4.0, bottom: 2.0),
                    //             child: Icon(
                    //               const IconData(0xf05a,
                    //                   fontFamily: 'FontAwesome'),
                    //               color: themeColor.hintHyperLink,
                    //               size: FontSize.NORMAL.value,
                    //             ),
                    //           ),
                    //         ),
                    //         TextSpan(
                    //           text: localeStr.withdrawViewOptionHint3,
                    //           style: TextStyle(color: themeColor.hintHyperLink),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),

                    ///
                    /// Submit Button
                    ///
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 24.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: RaisedButton(
                              child: Text(localeStr.btnSubmit),
                              onPressed: () => _validateForm(),
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///
                    /// Notice Texts
                    ///
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: themeColor.defaultTextColor,
                          ),
                          children: [
                            TextSpan(
                              text: '${localeStr.balanceHintTextTitle}\n',
                              style: TextStyle(
                                color: themeColor.defaultSubtitleColor,
                                fontWeight: FontWeight.bold,
                                fontSize: FontSize.MESSAGE.value,
                                height: 3,
                              ),
                            ),
                            WidgetSpan(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Divider(
                                  height: 1.0,
                                  color: themeColor.defaultDividerColor,
                                ),
                              ),
                            ),
                            TextSpan(
                              text: '${localeStr.withdrawViewHint1}'
                                  '\n${localeStr.withdrawViewHint2}',
                              style: TextStyle(
                                  fontSize: FontSize.NORMAL.value, height: 1.5),
                            ),
                          ],
                        ),
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
    );
  }

  Widget _buildRow(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              flex: 3,
              child: Text(
                '$title',
                style: TextStyle(fontSize: FontSize.SUBTITLE.value),
              )),
          Expanded(
            flex: 5,
            child: Text(
              '\r\r$content',
              style: TextStyle(fontSize: FontSize.SUBTITLE.value),
            ),
          ),
        ],
      ),
    );
  }
}
