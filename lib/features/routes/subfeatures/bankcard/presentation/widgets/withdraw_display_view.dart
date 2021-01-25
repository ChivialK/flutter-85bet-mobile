import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_field_widget.dart';
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
  final double _fieldInset = 72.0;

  void _validateForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      WithdrawForm dataForm = WithdrawForm(
        amount: _amountFieldKey.currentState.getInput,
        password: _passwordFieldKey.currentState.getInput,
        type: '0',
      );
      if (dataForm.isValid) {
        debugPrint('bankcard form: ${dataForm.toJson()}');
        if (widget.store.waitForWithdrawResult)
          callToast(localeStr.messageWait);
        else
          widget.store.requestWithdraw(dataForm);
      } else {
        callToast(localeStr.messageActionFillForm);
      }
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
                decoration: ThemeInterface.layerShadowDecorRoundTop,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 36.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                          _buildRow(localeStr.bankcardViewTitleBankProvince,
                              widget.bankcard.bankProvince),
                        ],
                      ),
                    ),
                    SizedBox(height: 36.0),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 16.0),
              child: Container(
                decoration: ThemeInterface.layerShadowDecorRoundBottom,
                child: Column(
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
                            /// Amount Input Field
                            ///
                            new CustomizeFieldWidget(
                              key: _amountFieldKey,
                              fieldType: FieldType.Numbers,
                              hint: '',
                              persistHint: false,
                              prefixText: localeStr.withdrawViewTitleAmount,
                              prefixTextSize: FontSize.SUBTITLE.value,
                              horizontalInset: _fieldInset,
                              errorMsg: localeStr.messageInvalidDepositAmount,
                              validCondition: (value) => rangeCheck(
                                value:
                                    (value.isNotEmpty) ? int.parse(value) : 0,
                                min: 1,
                              ),
                            ),

                            ///
                            /// Password Input Field
                            ///
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 6.0),
                              child: new CustomizeFieldWidget(
                                key: _passwordFieldKey,
                                fieldType: FieldType.Password,
                                persistHint: false,
                                prefixText: localeStr.withdrawViewTitlePwd,
                                prefixTextSize: FontSize.SUBTITLE.value,
                                horizontalInset: _fieldInset,
                                maxInputLength: InputLimit.PASSWORD_MAX,
                                errorMsg:
                                    localeStr.messageInvalidWithdrawPassword,
                                validCondition: (value) => rangeCheck(
                                  value: value.length,
                                  min: InputLimit.PASSWORD_MIN_OLD,
                                  max: InputLimit.PASSWORD_MAX,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    ///
                    /// Submit Button
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
                                height: 3,
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
                '$title:',
                style: TextStyle(fontSize: FontSize.TITLE.value),
              )),
          Expanded(
            flex: 5,
            child: Text(
              '\r\r$content',
              style: TextStyle(fontSize: FontSize.TITLE.value),
            ),
          ),
        ],
      ),
    );
  }
}
