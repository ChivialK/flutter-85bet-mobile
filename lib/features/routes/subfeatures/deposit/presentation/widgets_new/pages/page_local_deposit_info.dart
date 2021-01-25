import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_dropdown_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_field_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_titled_container.dart';

import '../../../data/form/deposit_form.dart';
import '../../../data/model/payment_type_data.dart';
import '../deposit_page_type.dart';
import '../deposit_pages_inherited_widget.dart';

class PageLocalDepositInfo extends StatefulWidget {
  final PaymentTypeLocalData paymentData;
  final Map<int, String> bankMap;
  final DepositDataForm form;
  final Function onPreStep;
  final Function onConfirm;

  const PageLocalDepositInfo({
    @required this.paymentData,
    @required this.bankMap,
    @required this.form,
    @required this.onPreStep,
    @required this.onConfirm,
  });

  @override
  _PageLocalDepositInfoState createState() => _PageLocalDepositInfoState();
}

class _PageLocalDepositInfoState extends State<PageLocalDepositInfo>
    with AfterLayoutMixin {
  static final GlobalKey<FormState> _formKey =
      new GlobalKey(debugLabel: 'ldf2');
  final GlobalKey<CustomizeDropdownWidgetState> _bankOptionKey =
      new GlobalKey(debugLabel: 'ldf2b');
  final GlobalKey<CustomizeFieldWidgetState> _accountFieldKey =
      new GlobalKey(debugLabel: 'ldf2c');
  final GlobalKey<CustomizeFieldWidgetState> _amountFieldKey =
      new GlobalKey(debugLabel: 'ldf2v');

  List<String> _bankNames;
  List<int> _bankIds;
  int _bankSelected = -1;
  int _amountVnd = 0;

  double _errorTextPadding;
  bool _showAccountError = false;
  bool _showAmountError = false;

  @override
  void initState() {
    _errorTextPadding =
        (Global.device.width.roundToDouble() - ThemeInterface.horizontalInset) *
                ThemeInterface.prefixTextWidthFactor -
            ThemeInterface.minusSize;
    if (widget.bankMap != null && widget.bankMap.isNotEmpty) {
      _generateBankDataList();
      _bankSelected = widget.bankMap.keys.first;
    }
    super.initState();
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
  Widget build(BuildContext context) {
    if (widget.bankMap == null || widget.bankMap.isEmpty) {
      return WarningDisplay(
        message:
            Failure.internal(FailureCode(type: FailureType.DEPOSIT)).message,
      );
    }
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ///
          /// Bank Option
          ///
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CustomizeDropdownWidget(
              key: _bankOptionKey,
              roundCorner: false,
              prefixText: localeStr.depositPaymentSpinnerTitleAccountBank,
              prefixTextMaxLines: 3,
              optionValues: _bankIds,
              optionStrings: _bankNames,
              changeNotify: (data) {
                // clear text field focus
                FocusScope.of(context).unfocus();
                debugPrint(
                    'selected bank: $data, label: ${widget.bankMap[data]}');
                _bankSelected = data;
              },
            ),
          ),

          ///
          /// Account Input Field
          ///
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: new CustomizeTitledContainer(
              prefixText: localeStr.depositPaymentEditTitleAccount,
              prefixTextMaxLines: 3,
              backgroundColor: Colors.transparent,
              roundCorner: false,
              child: new CustomizeFieldWidget(
                key: _accountFieldKey,
                fieldType: FieldType.Numbers,
                hint: localeStr.depositPaymentEditTitleAccountHint,
                persistHint: false,
                roundCorner: false,
                maxInputLength: InputLimit.CARD_MAX,
                padding: EdgeInsets.zero,
                minusHeight: 12.0,
                onInputChanged: (input) {
                  setState(() {
                    _showAccountError = !rangeCheck(
                      value: input.length,
                      min: InputLimit.CARD_MIN,
                      max: InputLimit.CARD_MAX,
                    );
                  });
                },
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: _errorTextPadding),
                  child: Visibility(
                    visible: _showAccountError,
                    child: Text(
                      localeStr.messageInvalidCardNumber(
                        InputLimit.CARD_MIN,
                        InputLimit.CARD_MAX,
                      ),
                      style: TextStyle(color: themeColor.defaultErrorColor),
                    ),
                  ),
                ),
              ),
            ],
          ),

          ///
          /// Amount Input Field
          ///
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: new CustomizeTitledContainer(
              prefixText: localeStr.depositPaymentEditTitleAmount,
              prefixTextMaxLines: 3,
              backgroundColor: Colors.transparent,
              roundCorner: false,
              child: new CustomizeFieldWidget(
                key: _amountFieldKey,
                fieldType: FieldType.Numbers,
                hint: '$creditSymbol' +
                    localeStr.depositPaymentEditTitleAmountHintRange(
                      widget.paymentData.min ?? 1,
                      widget.paymentData.max,
                    ),
                persistHint: false,
                roundCorner: false,
                maxInputLength: InputLimit.CARD_MAX,
                padding: EdgeInsets.zero,
                minusHeight: 12.0,
                onInputChanged: (input) {
                  int vnd = input.strToInt;
                  setState(() {
                    _amountVnd = (vnd > 0) ? vnd * 1000 : 0;
                    _showAmountError = !rangeCheck(
                      value: (input.isNotEmpty) ? int.parse(input) : 0,
                      min: widget.paymentData.min?.strToInt ?? 1,
                      max: widget.paymentData.max.strToInt,
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
                padding: EdgeInsets.only(left: _errorTextPadding),
                child: Visibility(
                  visible: _showAmountError,
                  child: Text(
                    localeStr.messageInvalidDepositAmount,
                    style: TextStyle(color: themeColor.defaultErrorColor),
                  ),
                ),
              ),
            ],
          ),

          ///
          /// VND Amount Hint
          ///
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Text(
                  localeStr.depositPaymentEditTitleAmountHintVND(_amountVnd),
                  style: TextStyle(color: themeColor.defaultHintSubColor),
                ),
              ),
            ],
          ),

          ///
          /// Buttons
          ///
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GradientButton(
                    expand: true,
                    cornerRadius: 0,
                    height: Global.device.comfortButtonHeight * 0.85,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_left_sharp,
                          color: themeColor.defaultTextColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Text(
                            localeStr.btnPreStep,
                            style: TextStyle(
                              fontSize: FontSize.SUBTITLE.value,
                              color: themeColor.defaultTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      DepositPagesInheritedWidget.of(context)
                          .storage
                          .updateForm(
                            page: DepositPageType.LOCAL_BANK_DEPOSIT_INFO,
                            form: DepositDataForm(
                              methodId: -1,
                              bankIndex: -1,
                              localBank: _bankSelected,
                              localBankCard:
                                  _accountFieldKey.currentState.getInput,
                              amount: _amountFieldKey.currentState.getInput,
                            ),
                          );
                      widget.onPreStep();
                    },
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: GradientButton(
                    expand: true,
                    cornerRadius: 0,
                    height: Global.device.comfortButtonHeight * 0.85,
                    child: Text(
                      localeStr.btnConfirm,
                      style: TextStyle(
                        fontSize: FontSize.SUBTITLE.value,
                        color: themeColor.defaultTextColor,
                      ),
                    ),
                    onPressed: () {
                      if (_showAccountError ||
                          _showAmountError ||
                          _bankSelected == -1) {
                        callToastError(localeStr.messageActionFillForm);
                        return;
                      } else {
                        DepositPagesInheritedWidget.of(context)
                            .storage
                            .updateForm(
                              page: DepositPageType.LOCAL_BANK_DEPOSIT_INFO,
                              form: DepositDataForm(
                                methodId: -1,
                                bankIndex: -1,
                                localBank: _bankSelected,
                                localBankCard:
                                    _accountFieldKey.currentState.getInput,
                                amount: _amountFieldKey.currentState.getInput,
                              ),
                            );
                        widget.onConfirm();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    if (widget.form != null) {
      if (widget.form.localBank != -1) {
        _bankSelected = widget.form.localBank;
        _bankOptionKey?.currentState?.setSelected = widget.form.localBank;
      }
      if (widget.form.localBankCard.isNotEmpty) {
        _accountFieldKey?.currentState?.setInput = widget.form.localBankCard;
      }
      if (widget.form.amount.isNotEmpty && widget.form.amount != '-1') {
        _amountVnd = widget.form.amount.strToInt * 1000;
        _amountFieldKey?.currentState?.setInput = widget.form.amount;
      }
    }
  }
}
