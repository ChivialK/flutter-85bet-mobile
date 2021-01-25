import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_dropdown_widget.dart';

import '../../../data/form/deposit_form.dart';
import '../../../data/model/payment_type_data.dart';
import '../deposit_page_type.dart';
import '../deposit_pages_inherited_widget.dart';

class PageOnlineBankOption extends StatefulWidget {
  final List<PaymentTypeData> dataList;
  final PaymentTypeOnlineData selected;
  final Function onNextStep;

  const PageOnlineBankOption({
    @required this.dataList,
    @required this.selected,
    @required this.onNextStep,
  });

  @override
  _PageOnlineBankOptionState createState() => _PageOnlineBankOptionState();
}

class _PageOnlineBankOptionState extends State<PageOnlineBankOption>
    with AfterLayoutMixin {
  static final GlobalKey<FormState> _formKey =
      new GlobalKey(debugLabel: 'odf1');
  final GlobalKey<CustomizeDropdownWidgetState> _optionKey =
      new GlobalKey(debugLabel: 'odf1b');

  PaymentTypeOnlineData _selectedPayment;

  List<PaymentTypeData> _bankOptions;
  List<String> _bankStrings;

  @override
  void initState() {
    if (widget.dataList.isNotEmpty) {
      _bankOptions = new List();
      _bankOptions.add(PaymentTypeOnlineData(type: localeStr.hintActionSelect));
      _bankOptions.addAll(widget.dataList);
      _bankStrings = _bankOptions.map((item) => item.type).toList();
      debugPrint('payment option: $_bankOptions');
    }
    super.initState();
    if (widget.selected != null) {
      _selectedPayment = widget.selected;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.dataList.isEmpty) {
      return WarningDisplay(
        message:
            Failure.internal(FailureCode(type: FailureType.DEPOSIT)).message,
      );
    }
    _selectedPayment ??= _bankOptions.first;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CustomizeDropdownWidget(
            key: _optionKey,
            prefixText: localeStr.depositPaymentSpinnerTitleBank,
            prefixTextMaxLines: 3,
            roundCorner: false,
            optionValues: _bankOptions,
            optionStrings: _bankStrings,
            changeNotify: (data) {
              // clear text field focus
              FocusScope.of(context).unfocus();
              // set selected data
              if (_selectedPayment == data) return;
              setState(() {
                _selectedPayment = data;
              });
            },
          ),

          /// Account Hint
          Padding(
            padding: const EdgeInsets.only(left: 4.0, top: 30.0),
            child: Text(
              localeStr.depositHintTextAccount,
              style: TextStyle(color: themeColor.defaultHintSubColor),
            ),
          ),
          if (_selectedPayment != null &&
              _selectedPayment.bankAccountId != null)
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
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              localeStr.btnNextStep,
                              style: TextStyle(
                                fontSize: FontSize.SUBTITLE.value,
                                color: themeColor.defaultTextColor,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_right_sharp,
                            color: themeColor.defaultTextColor,
                          ),
                        ],
                      ),
                      onPressed: () {
                        DepositPagesInheritedWidget.of(context)
                            .storage
                            .updateForm(
                              page: DepositPageType.ONLINE_BANK_OPTION,
                              form: DepositDataForm(
                                bankIndex: '${_selectedPayment.key}'.strToInt,
                                bankId: _selectedPayment.bankAccountId,
                                gateway: _selectedPayment.gateway,
                                methodId: 3,
                              ),
                              selectedPaymentType: _selectedPayment,
                            );
                        widget.onNextStep();
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
    if (_selectedPayment != null && _selectedPayment.bankAccountId != null) {
      _optionKey?.currentState?.setSelected = _selectedPayment;
    }
  }
}
