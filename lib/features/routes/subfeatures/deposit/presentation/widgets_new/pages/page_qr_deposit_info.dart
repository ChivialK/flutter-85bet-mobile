import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_field_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_titled_container.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/gradient_button.dart';
import 'package:flutter_85bet_mobile/utils/value_util.dart';

import '../../../data/form/deposit_form.dart';
import '../../../data/model/payment_type_data.dart';
import '../deposit_page_type.dart';
import '../deposit_pages_inherited_widget.dart';

class PageQrDepositInfo extends StatefulWidget {
  final PaymentTypeLocalData paymentData;
  final Function onPreStep;
  final Function onConfirm;

  const PageQrDepositInfo({
    @required this.paymentData,
    @required this.onPreStep,
    @required this.onConfirm,
  });

  @override
  _PageQrDepositInfoState createState() => _PageQrDepositInfoState();
}

class _PageQrDepositInfoState extends State<PageQrDepositInfo> {
  static final GlobalKey<FormState> _formKey =
      new GlobalKey(debugLabel: 'qdf1');

  final GlobalKey<CustomizeFieldWidgetState> _codeFieldKey =
      new GlobalKey(debugLabel: 'qdf1c');
  final GlobalKey<CustomizeFieldWidgetState> _amountFieldKey =
      new GlobalKey(debugLabel: 'qdf1v');

  int _amountVnd = 0;
  double _errorTextPadding;
  bool _showCodeError = false;
  bool _showAmountError = false;

  @override
  void initState() {
    _errorTextPadding =
        (Global.device.width.roundToDouble() - ThemeInterface.horizontalInset) *
                ThemeInterface.prefixTextWidthFactor -
            ThemeInterface.minusSize;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ///
          /// Transaction Code Field
          ///
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: new CustomizeTitledContainer(
              prefixText: localeStr.depositPaymentEditTitleCode,
              prefixTextMaxLines: 3,
              backgroundColor: Colors.transparent,
              roundCorner: false,
              child: new CustomizeFieldWidget(
                key: _codeFieldKey,
                fieldType: FieldType.DateWithoutHelper,
                hint: localeStr.depositPaymentEditHintCode,
                persistHint: false,
                roundCorner: false,
                maxInputLength: (widget.paymentData.payment == '6') ? 16 : 10,
                padding: EdgeInsets.zero,
                minusHeight: 12.0,
                onInputChanged: (input) {
                  setState(() {
                    if (widget.paymentData.payment == '6') {
                      _showCodeError = !isZaloCodeValid(input);
                    } else if (widget.paymentData.payment == '7') {
                      _showCodeError = !isMomoCodeValid(input);
                    }
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
                    visible: _showCodeError,
                    child: Text(
                      localeStr.messageInvalidFormat,
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
                      min: widget.paymentData.min.strToInt ?? 1,
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
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: _errorTextPadding),
                  child: Visibility(
                    visible: _showAmountError,
                    child: Text(
                      localeStr.messageInvalidDepositAmount,
                      style: TextStyle(color: themeColor.defaultErrorColor),
                    ),
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
                  style: TextStyle(
                    color: themeColor.defaultHintSubColor,
                    fontSize: FontSize.SUBTITLE.value,
                  ),
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
                    onPressed: widget.onPreStep,
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
                      if (_showCodeError || _showAmountError) {
                        callToastError(localeStr.messageActionFillForm);
                        return;
                      } else {
                        DepositPagesInheritedWidget.of(context)
                            .storage
                            .updateForm(
                              page: DepositPageType.QR_DEPOSIT_INFO,
                              form: DepositDataForm(
                                methodId: 1,
                                gateway: widget.paymentData.payment,
                                bankIndex: widget.paymentData.bankIndex,
                                bankId: widget.paymentData.bankAccountId,
                                amount: _amountFieldKey.currentState.getInput,
                                transactionCode:
                                    _codeFieldKey.currentState.getInput,
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
}

final RegExp _zaloTransactionCodeRegex = RegExp("^([0-9]{6})-(?:[0-9]{9})");

bool isZaloCodeValid(String input) =>
    input != null &&
    input.isNotEmpty &&
    _zaloTransactionCodeRegex.hasMatch(input);

final RegExp _momoTransactionCodeRegex = RegExp("^4(?:[0-9]{9})");

bool isMomoCodeValid(String input) =>
    input != null &&
    input.isNotEmpty &&
    _momoTransactionCodeRegex.hasMatch(input);
