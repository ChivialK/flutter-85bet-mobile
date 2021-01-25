import 'package:after_layout/after_layout.dart';
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

class PageOnlineDepositInfo extends StatefulWidget {
  final PaymentTypeOnlineData paymentData;
  final DepositDataForm form;
  final Function onPreStep;
  final Function onConfirm;

  const PageOnlineDepositInfo({
    @required this.paymentData,
    @required this.form,
    @required this.onPreStep,
    @required this.onConfirm,
  });

  @override
  _PageOnlineDepositInfoState createState() => _PageOnlineDepositInfoState();
}

class _PageOnlineDepositInfoState extends State<PageOnlineDepositInfo>
    with AfterLayoutMixin {
  static final GlobalKey<FormState> _formKey =
      new GlobalKey(debugLabel: 'odf2');
  final GlobalKey<CustomizeFieldWidgetState> _amountFieldKey =
      new GlobalKey(debugLabel: 'odf2v');

  int _amountVnd = 0;
  double _errorTextPadding;
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
                      min: widget.paymentData.min ?? 1,
                      max: widget.paymentData.max,
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
                            page: DepositPageType.ONLINE_BANK_DEPOSIT_INFO,
                            form: DepositDataForm(
                              methodId: -1,
                              bankIndex: -1,
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
                      if (_showAmountError) {
                        callToastError(localeStr.messageActionFillForm);
                        return;
                      } else {
                        DepositPagesInheritedWidget.of(context)
                            .storage
                            .updateForm(
                              page: DepositPageType.ONLINE_BANK_DEPOSIT_INFO,
                              form: DepositDataForm(
                                methodId: -1,
                                bankIndex: -1,
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
      if (widget.form.amount.isNotEmpty && widget.form.amount != '-1') {
        _amountVnd = widget.form.amount.strToInt * 1000;
        _amountFieldKey?.currentState?.setInput = widget.form.amount;
      }
    }
  }
}
