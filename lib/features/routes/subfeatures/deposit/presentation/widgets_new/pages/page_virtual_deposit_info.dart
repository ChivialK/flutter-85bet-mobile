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

class PageVirtualDepositInfo extends StatefulWidget {
  final PaymentTypeOnlineData paymentData;
  final Function onConfirm;

  const PageVirtualDepositInfo({
    @required this.paymentData,
    @required this.onConfirm,
  });

  @override
  _PageVirtualDepositInfoState createState() => _PageVirtualDepositInfoState();
}

class _PageVirtualDepositInfoState extends State<PageVirtualDepositInfo> {
  static final GlobalKey<FormState> _formKey =
      new GlobalKey(debugLabel: 'vdf1');
  final GlobalKey<CustomizeFieldWidgetState> _amountFieldKey =
      new GlobalKey(debugLabel: 'vdf1v');

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
                  setState(() {
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
          /// Buttons
          ///
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
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
                  DepositPagesInheritedWidget.of(context).storage.updateForm(
                        page: DepositPageType.THIRD_PARTY_DEPOSIT_INFO,
                        form: DepositDataForm(
                          methodId: 3,
                          gateway: widget.paymentData.gateway,
                          bankIndex: widget.paymentData.sb.first,
                          bankId: widget.paymentData.bankAccountId,
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
    );
  }
}
