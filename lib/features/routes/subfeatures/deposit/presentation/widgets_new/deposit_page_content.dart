import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/loading_widget.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../data/form/deposit_form.dart';
import '../../data/model/payment_type.dart';
import '../../data/model/payment_type_data.dart';
import 'deposit_page_type.dart';
import 'deposit_pages_inherited_widget.dart';
import 'pages/page_local_bank_option.dart';
import 'pages/page_local_deposit_info.dart';
import 'pages/page_online_bank_option.dart';
import 'pages/page_online_deposit_info.dart';
import 'pages/page_qr_deposit_code.dart';
import 'pages/page_qr_deposit_info.dart';
import 'pages/page_virtual_deposit_info.dart';

class DepositPageContent extends StatefulWidget {
  final int paymentKey;
  final PaymentType payment;
  final Function onReturn;

  DepositPageContent({
    Key key,
    @required this.paymentKey,
    @required this.payment,
    @required this.onReturn,
  }) : super(key: key);

  @override
  _DepositPageContentState createState() => _DepositPageContentState();
}

extension PaymentTypeExtension on PaymentType {
  List<DepositPageType> get getPages {
    switch (key) {
      case 1:
        return [
          DepositPageType.ONLINE_BANK_OPTION,
          DepositPageType.ONLINE_BANK_DEPOSIT_INFO,
        ];
      case 2:
      case 3:
        return [
          DepositPageType.LOCAL_BANK_OPTION,
          DepositPageType.LOCAL_BANK_DEPOSIT_INFO,
        ];
      case 6:
      case 7:
        return [
          DepositPageType.QR_DEPOSIT_CODE,
          DepositPageType.QR_DEPOSIT_INFO,
        ];
      case 8:
        return [
          DepositPageType.THIRD_PARTY_DEPOSIT_INFO,
        ];
      default:
        return [DepositPageType.ERROR];
    }
  }
}

class _DepositPageContentState extends State<DepositPageContent> {
  final LinearGradient _dividerGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0x34666666),
      Color(0xf0999999),
      Color(0xff979797),
      Color(0x34666666),
    ],
    stops: [0.1, 0.52, 0.54, 1.0],
    tileMode: TileMode.clamp,
  );

  DepositPagesInheritedWidget _inherited;
  List<DepositPageType> _pages;
  DepositPageType _pageType;
  int _pageIndex = -1;

  Widget _pageFormWidget;
  Widget _rulesWidget;

  @override
  void didUpdateWidget(covariant DepositPageContent oldWidget) {
    if (oldWidget.payment != widget.payment) {
      _inherited?.storage?.clearStorage();
      _pages = null;
      _pageType = null;
      _pageIndex = -1;
      _pageFormWidget = null;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    _inherited ??= DepositPagesInheritedWidget.of(context);
    if (_inherited == null) {
      return Center(
        child: WarningDisplay(
          message: Failure.internal(
            FailureCode(type: FailureType.INHERIT),
          ).message,
        ),
      );
    }

    if (_pages == null || _pageIndex == -1) {
      _setPage = 0;
    }
    _rulesWidget ??= _buildRulesWidget(
      (widget.payment.key < 5) ? widget.payment.key + 1 : widget.payment.key,
    );
    return Container(
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          FlatButton(
            onPressed: widget.onReturn,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.arrow_left_sharp,
                  color: themeColor.defaultTextColor,
                ),
                Text(
                  localeStr.btnPreStep,
                  style: TextStyle(
                    fontSize: FontSize.SUBTITLE.value,
                    color: themeColor.defaultTextColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: ThemeInterface.layerShadowDecor,
            margin: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ///
                /// PAYMENT TITLE
                ///
                Container(
                  padding: const EdgeInsets.fromLTRB(12.0, 20.0, 12.0, 12.0),
                  child: RichText(
                    text: TextSpan(children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Container(
                          margin: const EdgeInsets.all(4.0),
                          padding: const EdgeInsets.all(8.0),
                          decoration: ThemeInterface.pageIconContainerDecor,
                          child: FittedBox(
                            child: Icon(widget.payment.icon),
                          ),
                        ),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: Text(
                            widget.payment.label,
                            style: TextStyle(
                              fontSize: FontSize.SUBTITLE.value,
                              color: themeColor.defaultTitleColor,
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),

                ///
                /// PAGE FORM
                ///
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: FontSize.SUBTITLE.value,
                        color: themeColor.defaultTextColor,
                        fontStyle: FontStyle.italic,
                      ),
                      children: [
                        TextSpan(
                          text: 'Bước ',
                        ),
                        TextSpan(
                          text: '${_pageIndex + 1}',
                          style: TextStyle(fontSize: FontSize.MESSAGE.value),
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Icon(
                              const IconData(0xe902, fontFamily: 'IconMoon'),
                              color: themeColor.defaultHintSubColor,
                              size: FontSize.SUBTITLE.value * 1.25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 1.0,
                  margin: const EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(gradient: _dividerGradient),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 30.0),
                  child: _pageFormWidget,
                ),

                ///
                /// PAYMENT RULES
                ///
                _rulesWidget,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRulesWidget(int ruleKey) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                style: TextStyle(
                  fontSize: FontSize.SUBTITLE.value,
                  color: themeColor.defaultHintSubColor,
                  fontStyle: FontStyle.italic,
                ),
                children: [
                  TextSpan(
                    text: '${localeStr.depositHintTextTitle}: ',
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: Icon(
                        const IconData(0xe902, fontFamily: 'IconMoon'),
                        color: themeColor.defaultHintSubColor,
                        size: FontSize.SUBTITLE.value * 1.25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 1.0,
            margin: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(gradient: _dividerGradient),
          ),
          if (_inherited.store.hasRules)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: HtmlWidget(
                _inherited.store.depositRule[ruleKey],
                buildAsync: false,
              ),
            ),
        ],
      ),
    );
  }

  void _checkAndDeposit(bool isValid) {
    // debugPrint('form: ${_inherited.storage.getDepositForm.toJson()}');
    if (isValid) {
      _inherited.store
          .sendRequest(_inherited.storage.getDepositForm.copyWith());
    } else {
      debugPrint('form: ${_inherited.storage.getDepositForm.toJson()}');
      callToastError(
        localeStr.depositMessageFormError,
        duration: ToastDuration.LONG,
      );
    }
  }

  set _setPage(int page) {
    _pages ??= widget.payment.getPages;
    if (_pages.length > page) {
      _pageIndex = page;
      _pageType = _pages[page];

      // create form widget
      Widget _formWidget;
      switch (_pageType) {
        case DepositPageType.LOCAL_BANK_OPTION:
          _formWidget = PageLocalBankOption(
            dataList: widget.payment.data,
            infoList: _inherited.store.getLocalDepositInfoList,
            selected: _inherited.storage.getSelectedPaymentType,
            onNextStep: () => _setPage = 1,
          );
          break;
        case DepositPageType.LOCAL_BANK_DEPOSIT_INFO:
          _formWidget = PageLocalDepositInfo(
            paymentData: _inherited.storage.getSelectedPaymentType
                as PaymentTypeLocalData,
            bankMap: _inherited.store.banks,
            form: _inherited.storage.getDepositForm,
            onPreStep: () => _setPage = 0,
            onConfirm: () {
              _inherited.storage.updateGateway(widget.paymentKey);
              _checkAndDeposit(
                _inherited.storage.getDepositForm.isLocalPayValid,
              );
            },
          );
          break;
        case DepositPageType.ONLINE_BANK_OPTION:
          _formWidget = PageOnlineBankOption(
            dataList: widget.payment.data,
            selected: _inherited.storage.getSelectedPaymentType,
            onNextStep: () => _setPage = 1,
          );
          break;
        case DepositPageType.ONLINE_BANK_DEPOSIT_INFO:
          _formWidget = PageOnlineDepositInfo(
            paymentData: _inherited.storage.getSelectedPaymentType
                as PaymentTypeOnlineData,
            form: _inherited.storage.getDepositForm,
            onPreStep: () => _setPage = 0,
            onConfirm: () {
              _inherited.storage.updateGateway(widget.paymentKey);
              _checkAndDeposit(
                _inherited.storage.getDepositForm.isOnlinePayValid,
              );
            },
          );
          break;
        case DepositPageType.QR_DEPOSIT_CODE:
          _formWidget = FutureBuilder(
            future: _inherited.store.getDepositPic(
              widget.payment.data.first.bankAccountId,
            ),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return PageQrDepositCode(
                  qrCode: snapshot.data,
                  onNextStep: () => _setPage = 1,
                );
              } else {
                return LoadingWidget();
              }
            },
          );
          break;
        case DepositPageType.QR_DEPOSIT_INFO:
          _formWidget = PageQrDepositInfo(
            paymentData: widget.payment.data.first as PaymentTypeLocalData,
            onPreStep: () => _setPage = 0,
            onConfirm: () {
              _inherited.storage.updateGateway(widget.paymentKey);
              _checkAndDeposit(
                _inherited.storage.getDepositForm.isQrPayValid,
              );
            },
          );
          break;
        case DepositPageType.THIRD_PARTY_DEPOSIT_INFO:
          _formWidget = PageVirtualDepositInfo(
            paymentData: widget.payment.data.first as PaymentTypeOnlineData,
            onConfirm: () {
              _inherited.storage.updateGateway(widget.paymentKey);
              _checkAndDeposit(
                _inherited.storage.getDepositForm.isOnlinePayValid,
              );
            },
          );
          break;
        case DepositPageType.ERROR:
        default:
          _formWidget = WarningDisplay(
            message: Failure.internal(FailureCode(type: FailureType.DEPOSIT))
                .message,
          );
          break;
      }

      // Update page form widget
      if (_pageFormWidget != null) {
        Future.delayed(Duration(milliseconds: 200), () {
          if (mounted) {
            setState(() => _pageFormWidget = _formWidget);
          }
        });
      } else {
        _pageFormWidget = _formWidget;
      }
    }
    debugPrint(
      'page index: $_pageIndex, '
      'payment page: ${_pageType.toString()}, ',
      // 'payment: ${widget.payment}',
    );
  }
}
