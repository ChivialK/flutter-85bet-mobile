import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_dropdown_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_field_widget.dart';

import '../../data/form/bankcard_form.dart';
import '../../data/models/bankcard_model.dart';
import '../state/bankcard_store.dart';

class BankcardDisplay extends StatefulWidget {
  final BankcardStore store;
  final BankcardModel bankcard;

  BankcardDisplay({this.store, this.bankcard});

  @override
  _BankcardDisplayState createState() => _BankcardDisplayState();
}

class _BankcardDisplayState extends State<BankcardDisplay> {
  final String tag = 'BankcardDisplay';
  final MemberGridItem pageItem = MemberGridItem.bankcard;
  final double _fieldInset = 72.0;

  static final GlobalKey<FormState> _formKey =
      new GlobalKey(debugLabel: 'form');

  // Fields
  final GlobalKey<CustomizeFieldWidgetState> _nameFieldKey =
      new GlobalKey(debugLabel: 'name');
  final GlobalKey<CustomizeFieldWidgetState> _accountFieldKey =
      new GlobalKey(debugLabel: 'account');

  List<ReactionDisposer> _disposers;
  Map<String, String> bankMap;
  String _bankSelected;

  void _validateForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      BankcardForm dataForm = BankcardForm(
        owner: _nameFieldKey.currentState.getInput,
        bankId: _bankSelected ?? '',
        card: _accountFieldKey.currentState.getInput,
      );
      if (dataForm.isValid) {
        // print('bankcard form: ${dataForm.toJson()}');
        if (widget.store.waitForNewCardResult)
          callToast(localeStr.messageWait);
        else
          widget.store.sendRequest(dataForm);
      } else {
        callToast(localeStr.messageActionFillForm);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    widget.store.getBanks();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposers ??= [
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => widget.store.banksMap,
        // Run some logic with the content of the observed field
        (map) {
          print('bank map changed, size: ${map.keys.length}');
          setState(() {
            bankMap = map;
          });
        },
      ),
    ];
  }

  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
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
                      style: TextStyle(
                          fontSize: FontSize.HEADER.value,
                          color: themeColor.defaultTitleColor),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 20.0, 4.0, 16.0),
              child: Container(
                decoration: ThemeInterface.layerShadowDecorRound,
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
                            /// Name Input Field
                            ///
                            new CustomizeFieldWidget(
                              key: _nameFieldKey,
                              hint: '',
                              fieldType: FieldType.TextOnly,
                              persistHint: false,
                              prefixText: localeStr.bankcardViewTitleOwner,
                              prefixTextSize: FontSize.SUBTITLE.value,
                              maxInputLength: InputLimit.NAME_MAX,
                              horizontalInset: _fieldInset,
                              errorMsg: localeStr.messageInvalidCardOwner,
                              validCondition: (value) => rangeCheck(
                                  value: value.length,
                                  min: InputLimit.NAME_MIN,
                                  max: InputLimit.NAME_MAX),
                            ),

                            ///
                            /// Bank Option
                            ///
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 6.0),
                              child: CustomizeDropdownWidget(
                                prefixText: localeStr.bankcardViewTitleBankName,
                                prefixTextSize: FontSize.SUBTITLE.value,
                                horizontalInset: _fieldInset,
                                optionValues: (bankMap != null)
                                    ? bankMap.keys.toList()
                                    : [],
                                optionStrings: (bankMap != null)
                                    ? bankMap.values.toList()
                                    : [],
                                changeNotify: (data) {
                                  _bankSelected = data;
                                },
                              ),
                            ),

                            ///
                            /// Account Input Field
                            ///
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 6.0),
                              child: new CustomizeFieldWidget(
                                key: _accountFieldKey,
                                fieldType: FieldType.Numbers,
                                hint: '9704xxxxxxxxxxxx',
                                persistHint: false,
                                prefixText:
                                    localeStr.bankcardViewTitleCardNumber,
                                prefixTextSize: FontSize.SUBTITLE.value,
                                maxInputLength: InputLimit.CARD_FIXED_MAX,
                                horizontalInset: _fieldInset,
                                errorMsg:
                                    localeStr.messageInvalidCardNumberFixed(
                                  InputLimit.CARD_FIXED_MIN,
                                  InputLimit.CARD_FIXED_MAX,
                                  '9704',
                                ),
                                validCondition: (value) =>
                                    rangeCheck(
                                      value: value.length,
                                      min: InputLimit.CARD_FIXED_MIN,
                                      max: InputLimit.CARD_FIXED_MAX,
                                    ) &&
                                    value.startsWith('9704'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    ///
                    /// Confirm Button
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
                              child: Text(localeStr.btnConfirm),
                              onPressed: () => _validateForm(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
