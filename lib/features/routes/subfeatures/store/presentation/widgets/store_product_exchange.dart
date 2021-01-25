import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_field_widget.dart';
import 'package:flutter_85bet_mobile/utils/regex_util.dart';

import '../../data/form/store_exchange_form.dart';
import '../../data/models/store_product_model.dart';
import '../state/point_store.dart';

class StoreProductExchange extends StatefulWidget {
  final PointStore store;
  final StoreProductModel product;
  final int memberPoints;
  final double maxWidth;

  StoreProductExchange({
    @required this.store,
    @required this.product,
    @required this.memberPoints,
    @required this.maxWidth,
  });

  @override
  _StoreProductExchangeState createState() => _StoreProductExchangeState();
}

class _StoreProductExchangeState extends State<StoreProductExchange> {
  static final _formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomizeFieldWidgetState> _nameFieldKey =
      new GlobalKey(debugLabel: 'name');
  final GlobalKey<CustomizeFieldWidgetState> _phoneFieldKey =
      new GlobalKey(debugLabel: 'phone');
  final GlobalKey<CustomizeFieldWidgetState> _postcodeFieldKey =
      new GlobalKey(debugLabel: 'code');
  final GlobalKey<CustomizeFieldWidgetState> _addressFieldKey =
      new GlobalKey(debugLabel: 'address');

  void _validateForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      StoreExchangeForm dataForm = StoreExchangeForm(
        productId: widget.product.productId,
        name: _nameFieldKey.currentState.getInput,
        phone: _phoneFieldKey.currentState.getInput,
        postCode: _postcodeFieldKey.currentState.getInput,
        address: _addressFieldKey.currentState.getInput,
      );
      if (dataForm.phone.length < InputLimit.PHONE_MAX) {
        callToast(localeStr.messageInvalidPhone(InputLimit.PHONE_MAX));
      } else if (dataForm.postCode.length < 5) {
        callToast(localeStr.messageInvalidPostCode);
      } else if (dataForm.name.hasInvalidChinese) {
        callToast(localeStr.messageInvalidSymbol);
      } else if (dataForm.isValid) {
        widget.store.exchangeProduct(dataForm);
      } else {
        callToast(localeStr.messageActionFillForm);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: localeStr.storeRequestWindowPoints,
                  style: TextStyle(
                    color: themeColor.storeDialogSpanText,
                    fontSize: FontSize.SUBTITLE.value,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                      '${localeStr.storeTextItemPoint(widget.memberPoints)} - '
                      '${localeStr.storeTextItemPoint(widget.product.point)}',
                  style: TextStyle(
                    color: themeColor.storeHighlightTextColor,
                    fontSize: FontSize.SUBTITLE.value,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 0.5,
          width: widget.maxWidth - 20,
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 10.0,
          ),
          color: themeColor.defaultWidgetColor,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Text(
            localeStr.storeRequestWindowHint,
            style: TextStyle(
              fontSize: FontSize.SUBTITLE.value,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 12.0),
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: widget.maxWidth - 40),
            child: new Form(
              key: _formKey,
              child: ListView(
                primary: false,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  _buildInput(0),
                  _buildInput(1),
                  _buildInput(2),
                  _buildInput(3),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 0.5,
          width: widget.maxWidth - 20,
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 10.0,
          ),
          color: themeColor.defaultWidgetColor,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
          child: GradientButton(
            expand: true,
            onPressed: () => _validateForm(),
            child: Text(localeStr.btnConfirmSend),
          ),
        ),
        SizedBox(height: Global.device.height * 0.4),
      ],
    );
  }

  Widget _buildInput(int index) {
    String title;
    GlobalKey fieldKey;
    FieldType fieldType;
    int maxLength;
    switch (index) {
      case 0:
        title = localeStr.storeRequestWindowFieldTitleName;
        fieldKey = _nameFieldKey;
        fieldType = FieldType.TextOnly;
        maxLength = InputLimit.NAME_MAX;
        break;
      case 1:
        title = localeStr.storeRequestWindowFieldTitlePhone;
        fieldKey = _phoneFieldKey;
        fieldType = FieldType.Numbers;
        maxLength = InputLimit.PHONE_MAX;
        break;
      case 2:
        title = localeStr.storeRequestWindowFieldTitlePostno;
        fieldKey = _postcodeFieldKey;
        fieldType = FieldType.Numbers;
        maxLength = InputLimit.POSTCODE_MAX;
        break;
      default:
        title = localeStr.storeRequestWindowFieldTitleAddress;
        fieldKey = _addressFieldKey;
        fieldType = FieldType.Normal;
        maxLength = InputLimit.ADDRESS_MAX;
        break;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          /* Title Text */
          Expanded(
            flex: 2,
            child: (title.isNotEmpty)
                ? RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: ' *  ',
                          style: TextStyle(
                            color: themeColor.hintHighlightRed,
                            fontSize: FontSize.SUBTITLE.value,
                          ),
                        ),
                        TextSpan(
                          text: title,
                          style: TextStyle(
                            color: themeColor.defaultHintColor,
                            fontSize: FontSize.SUBTITLE.value,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
          ),
          /* Input Field */
          Expanded(
            flex: 5,
            child: new CustomizeFieldWidget(
              key: fieldKey,
              fieldType: fieldType,
              hint: '',
              persistHint: false,
              maxInputLength: maxLength,
              minusHeight: 20,
              subTheme: themeColor.isDarkTheme,
            ),
          ),
        ],
      ),
    );
  }
}
