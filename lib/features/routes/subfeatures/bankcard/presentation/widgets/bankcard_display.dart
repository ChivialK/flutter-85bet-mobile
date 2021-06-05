import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_dropdown_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_field_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_titled_container.dart';

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
  final GlobalKey<CustomizeFieldWidgetState> _branchFieldKey =
      new GlobalKey(debugLabel: 'branch');

  List<ReactionDisposer> _disposers;
  Map<String, String> bankMap;
  String _bankSelected;

  double _errorTextPadding;
  bool _showAccountError = false;
  bool _showCardError = false;
  bool _showBranchError = false;

  void _validateForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      BankcardForm dataForm = BankcardForm(
        owner: _nameFieldKey.currentState.getInput,
        bankId: _bankSelected ?? '',
        card: _accountFieldKey.currentState.getInput,
        branch: _branchFieldKey.currentState.getInput,
        province: '',
        area: '',
      );
      if (dataForm.isValid) {
        debugPrint('bankcard form: ${dataForm.toJson()}');
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
    _errorTextPadding = (Global.device.width.roundToDouble() - _fieldInset) *
            ThemeInterface.prefixTextWidthFactor -
        ThemeInterface.minusSize +
        10.0;
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
          debugPrint('bank map changed, size: ${map.keys.length}');
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
                      style: TextStyle(fontSize: FontSize.HEADER.value),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 20.0, 4.0, 16.0),
              child: Container(
                decoration: ThemeInterface.layerShadowDecor,
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
                            new CustomizeTitledContainer(
                              prefixText: localeStr.bankcardViewTitleOwner,
                              prefixTextSize: FontSize.SUBTITLE.value,
                              backgroundColor: themeColor.fieldPrefixBgColor,
                              horizontalInset: _fieldInset,
                              child: new CustomizeFieldWidget(
                                key: _nameFieldKey,
                                hint: '',
                                persistHint: false,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 0.0),
                                maxInputLength: InputLimit.NAME_MAX,
                                onInputChanged: (input) {
                                  setState(() {
                                    _showAccountError = !rangeCheck(
                                      value: input.length,
                                      min: 2,
                                      max: InputLimit.NAME_MAX,
                                    );
                                  });
                                },
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: _errorTextPadding),
                                  child: Visibility(
                                    visible: _showAccountError,
                                    child: Text(
                                      localeStr.messageInvalidCardOwner,
                                      style: TextStyle(
                                          color: themeColor.defaultErrorColor),
                                    ),
                                  ),
                                ),
                              ],
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
                              child: new CustomizeTitledContainer(
                                prefixText:
                                    localeStr.bankcardViewTitleCardNumber,
                                prefixTextSize: FontSize.SUBTITLE.value,
                                backgroundColor: themeColor.fieldPrefixBgColor,
                                horizontalInset: _fieldInset,
                                child: new CustomizeFieldWidget(
                                  key: _accountFieldKey,
                                  fieldType: FieldType.Numbers,
                                  hint: '',
                                  persistHint: false,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 0.0),
                                  maxInputLength: InputLimit.CARD_MAX,
                                  onInputChanged: (input) {
                                    setState(() {
                                      _showCardError = !rangeCheck(
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
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: _errorTextPadding),
                                  child: Visibility(
                                    visible: _showCardError,
                                    child: Text(
                                      localeStr.messageInvalidCardNumber(
                                        InputLimit.CARD_MIN,
                                        InputLimit.CARD_MAX,
                                      ),
                                      style: TextStyle(
                                          color: themeColor.defaultErrorColor),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            ///
                            /// Branch Input Field
                            ///
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: new CustomizeTitledContainer(
                                prefixText:
                                    localeStr.bankcardViewTitleBankBranch,
                                prefixTextSize: FontSize.SUBTITLE.value,
                                backgroundColor: themeColor.fieldPrefixBgColor,
                                horizontalInset: _fieldInset,
                                child: new CustomizeFieldWidget(
                                  key: _branchFieldKey,
                                  hint: '',
                                  persistHint: false,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 0.0),
                                  maxInputLength: InputLimit.NAME_MAX,
                                  onInputChanged: (input) {
                                    setState(() {
                                      _showBranchError = !rangeCheck(
                                        value: input.length,
                                        min: 3,
                                        max: InputLimit.NAME_MAX,
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
                                  padding:
                                      EdgeInsets.only(left: _errorTextPadding),
                                  child: Visibility(
                                    visible: _showBranchError,
                                    child: Text(
                                      localeStr.messageInvalidCardBankPoint,
                                      style: TextStyle(
                                          color: themeColor.defaultErrorColor),
                                    ),
                                  ),
                                ),
                              ],
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
