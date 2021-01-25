import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_dropdown_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_titled_container.dart';

import '../../../data/form/deposit_form.dart';
import '../../../data/model/deposit_info.dart';
import '../../../data/model/payment_type_data.dart';
import '../deposit_page_type.dart';
import '../deposit_pages_inherited_widget.dart';

class PageLocalBankOption extends StatefulWidget {
  final List<PaymentTypeData> dataList;
  final List<DepositInfo> infoList;
  final PaymentTypeLocalData selected;
  final Function onNextStep;

  const PageLocalBankOption({
    @required this.dataList,
    @required this.infoList,
    @required this.selected,
    @required this.onNextStep,
  });

  @override
  _PageLocalBankOptionState createState() => _PageLocalBankOptionState();
}

class _PageLocalBankOptionState extends State<PageLocalBankOption>
    with AfterLayoutMixin {
  static final GlobalKey<FormState> _formKey =
      new GlobalKey(debugLabel: 'ldf1');
  final GlobalKey<CustomizeDropdownWidgetState> _optionKey =
      new GlobalKey(debugLabel: 'ldf1i');

  PaymentTypeLocalData _localData;
  DepositInfo _selectedBankInfo;

  List<DepositInfo> _infoOptions;
  List<String> _infoStrings;

  @override
  void initState() {
    // debugPrint('available payment types: ${widget.dataList}');
    // create option list when the required data exists
    if (widget.dataList != null &&
        widget.dataList.isNotEmpty &&
        widget.infoList != null &&
        widget.infoList.isNotEmpty) {
      _infoOptions = new List();
      _infoOptions
          .add(DepositInfo(bankAccountName: localeStr.hintActionSelect));
      widget.dataList.forEach((data) {
        DepositInfo info = widget.infoList.singleWhere(
            (info) => info.bankAccountId == data.bankAccountId,
            orElse: () => null);
        if (info != null) _infoOptions.add(info);
      });
      _infoStrings = _infoOptions.map((item) => item.bankAccountName).toList();
      debugPrint('payment option: $_infoOptions');
    }
    super.initState();
    if (_infoOptions != null && widget.selected != null) {
      _selectedBankInfo = _infoOptions.singleWhere(
        (info) => info.bankAccountId == widget.selected.bankAccountId,
        orElse: () => null,
      );
      if (_selectedBankInfo != null) {
        _localData = widget.selected;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_infoOptions == null) {
      return WarningDisplay(
        message:
            Failure.internal(FailureCode(type: FailureType.DEPOSIT)).message,
      );
    }
    _selectedBankInfo ??= _infoOptions.first;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CustomizeDropdownWidget(
            key: _optionKey,
            prefixText: localeStr.depositPaymentSpinnerTitleBank,
            roundCorner: false,
            optionValues: _infoOptions,
            optionStrings: _infoStrings,
            changeNotify: (data) {
              // clear text field focus
              FocusScope.of(context).unfocus();
              // set selected data
              if (_selectedBankInfo == data) return;
              setState(() {
                _selectedBankInfo = data;
                _localData = widget.dataList.firstWhere(
                  (data) =>
                      data.bankAccountId == _selectedBankInfo.bankAccountId,
                  orElse: () => null,
                );
              });
            },
          ),
          if (_selectedBankInfo.bankAccountId != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  CustomizeTitledContainer(
                    prefixText: localeStr.bankcardViewTitleCardNumber,
                    prefixTextMaxLines: 3,
                    prefixBgColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    roundCorner: false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(_selectedBankInfo.bankAccountNo),
                    ),
                  ),
                  SizedBox(height: 8),
                  CustomizeTitledContainer(
                    prefixText: localeStr.bankcardViewTitleBank,
                    prefixTextMaxLines: 3,
                    prefixBgColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    roundCorner: false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(_selectedBankInfo.bankCode),
                    ),
                  )
                ],
              ),
            ),
          if (_selectedBankInfo.bankAccountId != null)
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
                        if (_localData != null) {
                          DepositPagesInheritedWidget.of(context)
                              .storage
                              .updateForm(
                                page: DepositPageType.LOCAL_BANK_OPTION,
                                form: DepositDataForm(
                                  methodId: 1,
                                  bankIndex: _localData.bankIndex,
                                  bankId: _localData.bankAccountId,
                                  gateway: _localData.payment,
                                ),
                                selectedPaymentType: _localData,
                              );
                          widget.onNextStep();
                        } else {
                          callToastError(localeStr.messageErrorInternal);
                          debugPrint('selected bank info: $_selectedBankInfo');
                          debugPrint(
                              'available payment types: ${widget.dataList}');
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
    if (_selectedBankInfo != null) {
      _optionKey?.currentState?.setSelected = _selectedBankInfo;
    }
  }
}
