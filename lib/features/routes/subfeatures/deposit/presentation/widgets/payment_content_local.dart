import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_dropdown_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_field_widget.dart';

import '../../data/form/deposit_form.dart';
import '../../data/model/deposit_info.dart';
import '../../data/model/payment_promo.dart';
import '../../data/model/payment_type_data.dart';

/// Content View for [PaymentEnum.bank]
///@author H.C.CHIANG
///@version 2020/3/26
class PaymentContentLocal extends StatefulWidget {
  final List<PaymentTypeData> dataList;
  final List<PaymentPromoData> promoList;
  final List<DepositInfo> infoList;
  final Map<int, String> bankMap;
  final Function depositFuncCall;

  PaymentContentLocal({
    @required this.dataList,
    @required this.promoList,
    @required this.infoList,
    @required this.bankMap,
    @required this.depositFuncCall,
  });

  @override
  _PaymentContentLocalState createState() => _PaymentContentLocalState();
}

class _PaymentContentLocalState extends State<PaymentContentLocal> {
  final String tag = 'PaymentContentLocal';
  static final GlobalKey<FormState> _formKey =
      new GlobalKey(debugLabel: 'form');

  final GlobalKey<CustomizeFieldWidgetState> _nameFieldKey =
      new GlobalKey(debugLabel: 'name');
  final GlobalKey<CustomizeFieldWidgetState> _accountFieldKey =
      new GlobalKey(debugLabel: 'account');
  final GlobalKey<CustomizeFieldWidgetState> _amountFieldKey =
      new GlobalKey(debugLabel: 'amount');
  final GlobalKey<CustomizeFieldWidgetState> _noteFieldKey =
      new GlobalKey(debugLabel: 'note');

  final double _fieldInset = 56.0;
  final double _titleWidthFactor = 0.35;
  double _valueTextPadding;

  List<String> _bankNames;
  List<int> _bankIds;

  PaymentTypeLocalData _localData;
  DepositInfo _selectedBankInfo;
  int _bankSelected = -1;
  int _promoSelected = -1;
  int _methodSelected = 1;
  int _amountVnd = 0;

  void _validateForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
//      debugPrint('The user wants to login with $_username and $_password');
      try {
        DepositDataForm dataForm = DepositDataForm(
          bankIndex: _localData.bankIndex,
          bankId: _localData.bankAccountId,
          methodId: _methodSelected,
          name: _nameFieldKey.currentState.getInput,
          amount: _amountFieldKey.currentState.getInput,
          localBank: _bankSelected,
          localBankCard: _accountFieldKey.currentState.getInput,
          promoId: _promoSelected,
          gateway: '1',
          remark: _noteFieldKey.currentState.getInput,
        );
        if (dataForm.isValid == false) {
          callToast(localeStr.messageActionFillForm);
          return;
        }
//        debugPrint('deposit form: ${dataForm.toJson()}');
        if (widget.depositFuncCall != null) widget.depositFuncCall(dataForm);
      } catch (e) {
        debugPrint('validate deposit form has exception: $e');
        callToastError(localeStr.depositMessageFailed);
      }
    }
  }

  void _updateSelected() {
    _localData = widget.dataList.firstWhere(
        (element) => element.bankAccountId == _selectedBankInfo.bankAccountId);
  }

  void _generateBankDataList() {
    debugPrint('bank map: ${widget.bankMap}');
    _bankNames = widget.bankMap.values.toList()..sort();
    debugPrint('bank names sorted: $_bankNames\n\n');
    _bankIds = _bankNames
        .map((value) =>
            widget.bankMap.entries
                .firstWhere((element) => element.value == value,
                    orElse: () => null)
                ?.key ??
            -1)
        .toList()
          ..removeWhere((element) => element == -1);
    debugPrint('bank ids sorted: $_bankIds\n\n');
  }

  @override
  void initState() {
    _valueTextPadding = (Global.device.width.roundToDouble() - _fieldInset) *
            _titleWidthFactor -
        Themes.minusSize;

    _selectedBankInfo = widget.infoList.first;
    _bankSelected = widget.bankMap.keys.first;
    _generateBankDataList();
    _updateSelected();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.dataList == null || widget.dataList.isEmpty) {
      return Center(
        child: WarningDisplay(
          message: Failure.server().message,
        ),
      );
    } else {
      List<String> methods = [
        localeStr.depositPaymentMethodLocal1,
        localeStr.depositPaymentMethodLocal2,
      ];
      List<PaymentPromoData> promos = [
        PaymentPromoData(
          promoId: -1,
          promoDesc: localeStr.depositPaymentNoPromo,
        ),
      ];
      if (widget.promoList != null) promos.addAll(widget.promoList);
      return new Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ///
            /// Target Bank Option
            ///
            CustomizeDropdownWidget(
              prefixText: localeStr.depositPaymentSpinnerTitleBank,
              prefixTextSize: FontSize.SUBTITLE.value,
              titleWidthFactor: _titleWidthFactor,
              horizontalInset: _fieldInset,
              optionValues:
                  widget.infoList.map((item) => item.bankAccountId).toList(),
              optionStrings:
                  widget.infoList.map((item) => item.bankAccountName).toList(),
              changeNotify: (data) {
                // clear text field focus
                FocusScope.of(context).requestFocus(new FocusNode());
                // set selected data
                if (_selectedBankInfo == data) return;
                setState(() {
                  _selectedBankInfo = data;
                  _localData = widget.dataList.firstWhere((element) =>
                      element.bankAccountId == _selectedBankInfo.bankAccountId);
                });
              },
            ),

            ///
            /// Deposit Info Area
            ///
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: DottedBorder(
                dashPattern: const <double>[4, 2],
                color: const Color.fromRGBO(206, 0, 0, 0.2),
                padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        color: Themes.hintDarkRed,
                        fontSize: FontSize.MESSAGE.value,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: '${localeStr.bankcardViewTitleOwner}:\r\r'),
                        TextSpan(
                          text: '${_selectedBankInfo.accountName}\n',
                          style: TextStyle(color: Themes.hintHighlightDarkRed),
                        ),
                        TextSpan(
                            text:
                                '${localeStr.bankcardViewTitleCardNumber}:\r\r'),
                        TextSpan(
                          text: '${_selectedBankInfo.bankAccountNo}\n',
                          style: TextStyle(color: Themes.hintHighlightDarkRed),
                        ),
                        TextSpan(
                            text: '${localeStr.bankcardViewTitleBank}:\r\r'),
                        TextSpan(
                            text: '${_selectedBankInfo.bankAccountName}\n'),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            ///
            /// Promo Option
            ///
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: CustomizeDropdownWidget(
                prefixText: localeStr.depositPaymentSpinnerTitlePromo,
                prefixTextSize: FontSize.SUBTITLE.value,
                titleWidthFactor: _titleWidthFactor,
                horizontalInset: _fieldInset,
                optionValues: promos.map((item) => item.promoId).toList(),
                optionStrings: promos.map((item) => item.promoDesc).toList(),
                changeNotify: (data) {
                  // clear text field focus
                  FocusScope.of(context).requestFocus(new FocusNode());
                  // set selected data
                  if (data is PaymentPromoData) _promoSelected = data.promoId;
                },
              ),
            ),

            ///
            /// Method Option
            ///
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: CustomizeDropdownWidget(
                prefixText: localeStr.depositPaymentSpinnerTitleMethod,
                prefixTextSize: FontSize.SUBTITLE.value,
                titleWidthFactor: _titleWidthFactor,
                horizontalInset: _fieldInset,
                optionStrings: methods,
                optionValues: [1, 2],
                changeNotify: (data) {
                  // clear text field focus
                  FocusScope.of(context).requestFocus(new FocusNode());
                  // set selected data
                  _methodSelected = data;
                },
              ),
            ),

            ///
            /// Bank Option
            ///
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: CustomizeDropdownWidget(
                prefixText: localeStr.depositPaymentSpinnerTitleAccountBank,
                prefixTextSize: FontSize.SUBTITLE.value,
                titleWidthFactor: _titleWidthFactor,
                horizontalInset: _fieldInset,
                optionValues: _bankIds,
                optionStrings: _bankNames,
                changeNotify: (data) {
                  // clear text field focus
                  FocusScope.of(context).requestFocus(new FocusNode());
                  debugPrint(
                      'selected bank: $data, label: ${widget.bankMap[data]}');
                  _bankSelected = data;
                },
              ),
            ),

            ///
            /// Name Input Field
            ///
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: new CustomizeFieldWidget(
                key: _nameFieldKey,
                hint: localeStr.depositPaymentEditTitleNameHint,
                persistHint: false,
                prefixText: localeStr.depositPaymentEditTitleName,
                prefixTextSize: FontSize.SUBTITLE.value,
                titleWidthFactor: _titleWidthFactor,
                horizontalInset: _fieldInset,
                maxInputLength: InputLimit.NAME_MAX,
                errorMsg: localeStr.messageInvalidDepositName,
                validCondition: (value) => rangeCheck(
                    value: value.length,
                    min: InputLimit.NAME_MIN,
                    max: InputLimit.NAME_MAX),
              ),
            ),

            ///
            /// Account Input Field
            ///
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: new CustomizeFieldWidget(
                key: _accountFieldKey,
                hint: localeStr.depositPaymentEditTitleAccountHint,
                persistHint: false,
                prefixText: localeStr.depositPaymentEditTitleAccount,
                prefixTextSize: FontSize.SUBTITLE.value,
                titleWidthFactor: _titleWidthFactor,
                horizontalInset: _fieldInset,
                maxInputLength: InputLimit.CARD_MAX,
                errorMsg: localeStr.messageInvalidCardNumber,
                validCondition: (value) => rangeCheck(
                  value: value.length,
                  min: InputLimit.CARD_MIN,
                  max: InputLimit.CARD_MAX,
                ),
              ),
            ),

            ///
            /// Amount Input Field
            ///
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: new CustomizeFieldWidget(
                key: _amountFieldKey,
                fieldType: FieldType.Numbers,
                hint: localeStr.depositPaymentEditTitleAmountHintRange(
                  _localData.min?.strToInt ?? 1,
                  _localData.max.strToInt,
                ),
                persistHint: false,
                prefixText: localeStr.depositPaymentEditTitleAmount,
                prefixTextSize: FontSize.SUBTITLE.value,
                titleWidthFactor: _titleWidthFactor,
                horizontalInset: _fieldInset,
                maxInputLength: _localData.max.length,
                errorMsg: localeStr.messageInvalidDepositAmount,
                validCondition: (value) =>
                    value.contains('.') == false &&
                    rangeCheck(
                      value: (value.isNotEmpty) ? int.parse(value) : 0,
                      min: _localData.min?.strToInt ?? 1,
                      max: _localData.max.strToInt,
                    ),
                onInputChanged: (value) {
//                  debugPrint('received field value: $value');
                  int input = value.strToInt;
                  setState(() {
                    _amountVnd = (input > 0) ? input * 1000 : 0;
                  });
                },
              ),
            ),

            ///
            /// VND Amount Hint
            ///
            Padding(
              padding: EdgeInsets.fromLTRB(_valueTextPadding, 24.0, 0.0, 16.0),
              child: Text(
                localeStr.depositPaymentEditTitleAmountHintVND(_amountVnd),
                style: TextStyle(
                  color: Themes.defaultHintColor,
                  fontSize: FontSize.SUBTITLE.value,
                ),
              ),
            ),

            ///
            /// Note Input Field
            ///
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: new CustomizeFieldWidget(
                key: _noteFieldKey,
                hint: localeStr.depositPaymentEditTitleNote,
                persistHint: false,
                prefixText: localeStr.depositPaymentEditTitleNote,
                prefixTextSize: FontSize.SUBTITLE.value,
                titleWidthFactor: _titleWidthFactor,
                horizontalInset: _fieldInset,
                maxInputLength: InputLimit.NOTE_MAX,
                errorMsg: localeStr.messageInvalidFormat,
                validCondition: (value) => rangeCheck(
                    value: value.length, min: 0, max: InputLimit.NOTE_MAX),
              ),
            ),

            ///
            /// Confirm Button
            ///
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: RaisedButton(
                      child: Text(localeStr.btnConfirm),
                      onPressed: () => _validateForm(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
