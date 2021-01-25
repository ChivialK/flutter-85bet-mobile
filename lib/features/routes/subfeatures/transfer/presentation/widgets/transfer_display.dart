import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_dropdown_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_field_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_input_chip_container.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_titled_container.dart';

import '../../data/form/transfer_form.dart';
import '../../data/models/transfer_platform_model.dart';
import '../state/transfer_store.dart';

class TransferDisplay extends StatefulWidget {
  final TransferStore store;

  TransferDisplay({this.store});

  @override
  _TransferDisplayState createState() => _TransferDisplayState();
}

class _TransferDisplayState extends State<TransferDisplay> {
  final String tag = 'TransferDisplay';
  final MemberGridItem pageItem = MemberGridItem.transfer;

  static final GlobalKey<FormState> _formKey =
      new GlobalKey(debugLabel: 'form');
  // Fields
  final GlobalKey<CustomizeFieldWidgetState> _amountFieldKey =
      new GlobalKey(debugLabel: 'amount');

  // Dropdowns
  final GlobalKey<CustomizeDropdownWidgetState> _site1Key =
      new GlobalKey(debugLabel: 'site1');
  final GlobalKey<CustomizeDropdownWidgetState> _site2Key =
      new GlobalKey(debugLabel: 'site2');

  final double _fieldInset = 72.0;
  double _valueTextPadding;
  String _valueInitText;

  final List<String> _chipValues = [
    '100',
    '500',
    '1000',
    '2000',
    '5000',
    'all',
  ];
  List<String> _chipLabels;

  List<TransferPlatformModel> _site2List = [];
  List<String> _site1Labels;
  List<String> _site2Labels;
  String _site1Selected;
  String _site2Selected;
  double _site1Value;

  void _updateChipLabels() {
    _chipLabels = _chipValues
        .map((e) => e == 'all' ? localeStr.transferViewTextOptionAll : e)
        .toList(growable: false);
  }

  List<String> _localeSiteLabel(List<TransferPlatformModel> list) {
    debugPrint('update dropdown labels: ${list.length}');
    return list
        .map((e) =>
            e.name == 'center wallet' ? localeStr.walletViewTitle : e.name)
        .toList();
  }

  void _validateForm() {
    if (widget.store.isPlatformValid == false) {
      callToast(localeStr.transferPlatformError);
      return;
    }
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      String amountText = _amountFieldKey.currentState.getInput;
      int amount = amountText.strToInt;
      if (!rangeCheck(value: amount, min: 1, max: widget.store.creditLimit) ||
          _site1Value < amount) {
        callToastError(localeStr.messageExceedRemainCredit);
        return;
      }
      TransferForm dataForm = TransferForm(
        from: _site1Selected,
        to: _site2Selected,
        amount: amountText,
      );
      widget.store.sendRequest(dataForm);
    }
  }

  void _onSelectSite1(String platform) async {
    if (platform == null) return;
    debugPrint('site1 selected: $platform');

    // set site1 selected
    _site1Selected = platform;
    widget.store.setSite1Value('');
    widget.store.getBalance(platform, isLimit: true);

    /// platform credit can only transfer to member wallet
    if (platform != '0') {
      // if site2 list only has center wallet option, there's no need to update
      // condition:
      // 1. site2 list not initialize
      // 2.3. site2 has other options than wallet
      if (_site2List.isEmpty ||
          _site2List.length > 1 ||
          _site2List.any((e) => e.site != '0')) {
        _site2List = widget.store.platforms
            .takeWhile((e) => e.site == '0')
            .toList(growable: false);
        _site2Labels = _localeSiteLabel(_site2List);
        _site2Selected = '0';
        _site2Key.currentState.setSelected = '0';
        widget.store.setSite2Value('');
        widget.store.getBalance('0');
        setState(() {});
      }

      /// restore site2 options to available platforms
    } else {
      // condition:
      // 1. site2 list not initialize
      // 2. site1 select wallet and site2 list probably only has wallet
      // 3. site1 select platform and site2 has other options than wallet
      if (_site2List.isEmpty ||
          (platform == '0' && _site2List.length <= 1) ||
          _site2List.length == 1 && _site2List.any((e) => e.site != '0')) {
        _site2List = widget.store.platforms
            .where((e) => e.site != '0')
            .toList(growable: false);
        _site2Labels = _localeSiteLabel(_site2List);
      }
      _site2Selected = null;
      _site2Key.currentState.setSelected = null;
      widget.store.setSite2Value('');
      setState(() {});
    }
  }

  void _onSelectSite2(String platform) {
    if (platform == null) return;
    debugPrint('site2 selected: $platform');
    // set site2 selected
    _site2Selected = platform;
    widget.store.setSite2Value('');
    widget.store.getBalance(platform);
  }

  @override
  void initState() {
    _valueTextPadding = (Global.device.width.roundToDouble() - _fieldInset) *
            ThemeInterface.prefixTextWidthFactor -
        ThemeInterface.minusSize +
        16.0;
    _valueInitText = localeStr.transferViewSiteHint;
    _updateChipLabels();
    super.initState();
  }

  @override
  void didUpdateWidget(TransferDisplay oldWidget) {
    _valueInitText = localeStr.transferViewSiteHint;
    _site1Labels = null;
    _site2Labels = null;
    super.didUpdateWidget(oldWidget);
    _updateChipLabels();
  }

  @override
  Widget build(BuildContext context) {
    _site1Labels ??= widget.store.platforms
        .map((e) =>
            e.name == 'center wallet' ? localeStr.walletViewTitle : e.name)
        .toList();
    if (_site2Labels == null && _site2List != null) {
      _site2Labels = _site2List.map((e) => e.name).toList();
    }
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
                            /// From Site Option
                            ///
                            CustomizeDropdownWidget(
                              key: _site1Key,
                              prefixText: localeStr.transferViewTitleOut,
                              prefixTextSize: FontSize.SUBTITLE.value,
                              horizontalInset: _fieldInset,
                              optionValues: widget.store.platforms
                                  .map((e) => e.site)
                                  .toList(),
                              optionStrings: _site1Labels,
                              clearValueOnMenuChanged: true,
                              changeNotify: (data) => _onSelectSite1(data),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      _valueTextPadding, 4.0, 0.0, 6.0),
                                  child: StreamBuilder<String>(
                                    stream: widget.store.site1ValueStream,
                                    initialData: _valueInitText,
                                    builder: (context, snapshot) {
                                      bool reset = snapshot.data == null ||
                                          snapshot.data.isEmpty ||
                                          widget.store.site1.strToInt == -1;
                                      debugPrint('site1 reset: $reset');
                                      String text = (reset)
                                          ? _valueInitText
                                          : snapshot.data;
                                      _site1Value = (reset)
                                          ? 0
                                          : snapshot.data.strToDouble;
                                      return GestureDetector(
                                        onTap: () {
                                          if (_site1Selected == null) return;
                                          widget.store.setSite1Value('');
                                          widget.store
                                              .getBalance(_site1Selected);
                                        },
                                        child: Text(text,
                                            style: TextStyle(
                                                color: themeColor
                                                    .fieldSuffixColor)),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),

                            ///
                            /// To Site Option
                            ///
                            CustomizeDropdownWidget(
                              key: _site2Key,
                              prefixText: localeStr.transferViewTitleIn,
                              prefixTextSize: FontSize.SUBTITLE.value,
                              horizontalInset: _fieldInset,
                              optionValues:
                                  _site2List.map((e) => e.site).toList(),
                              optionStrings: _site2Labels,
                              clearValueOnMenuChanged: true,
                              changeNotify: (data) => _onSelectSite2(data),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      _valueTextPadding, 4.0, 0.0, 6.0),
                                  child: StreamBuilder<String>(
                                    stream: widget.store.site2ValueStream,
                                    initialData: _valueInitText,
                                    builder: (context, snapshot) {
                                      bool reset = snapshot.data == null ||
                                          snapshot.data.isEmpty ||
                                          widget.store.site1.strToInt == -1;
                                      String text = (reset)
                                          ? _valueInitText
                                          : snapshot.data;
                                      debugPrint('site2 reset: $reset');
                                      return GestureDetector(
                                        onTap: () {
                                          if (_site2Selected == null) return;
                                          widget.store.setSite2Value('');
                                          widget.store
                                              .getBalance(_site2Selected);
                                        },
                                        child: Text(text,
                                            style: TextStyle(
                                              color:
                                                  themeColor.fieldSuffixColor,
                                            )),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),

                            ///
                            /// Amount Input Field
                            ///
                            new CustomizeTitledContainer(
                              prefixText: localeStr.transferViewTitleAmount,
                              prefixTextSize: FontSize.SUBTITLE.value,
                              backgroundColor: themeColor.fieldPrefixBgColor,
                              horizontalInset: _fieldInset,
                              child: new CustomizeFieldWidget(
                                key: _amountFieldKey,
                                fieldType: FieldType.Numbers,
                                hint: 'VDK',
                                persistHint: false,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 0.0),
                                maxInputLength: InputLimit.AMOUNT,
                              ),
                            ),

                            ///
                            /// Amount Chip
                            ///
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 12.0, 16.0, 4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      localeStr.transferViewTitleOption,
                                      style: TextStyle(
                                          fontSize: FontSize.SUBTITLE.value),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: SizedBox(),
                                  )
                                ],
                              ),
                            ),
                            new CustomizeInputChipContainer(
                              horizontalInset: _fieldInset,
                              labels: _chipLabels,
                              values: _chipValues,
                              heightFactor: 1.75,
                              backgroundColor:
                                  themeColor.defaultLayeredBackgroundColor,
                              roundChip: false,
                              chipTapCall: (value) {
                                if (value == 'all') {
                                  _amountFieldKey.currentState.setInput =
                                      '${widget.store.creditLimit}';
                                } else {
                                  _amountFieldKey.currentState.setInput = value;
                                }
                              },
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

                    ///
                    /// Notice Texts
                    ///
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: themeColor.defaultTextColor,
                          ),
                          children: [
                            TextSpan(
                              text: '${localeStr.balanceHintTextTitle}\n',
                              style: TextStyle(
                                color: themeColor.defaultSubtitleColor,
                                fontWeight: FontWeight.bold,
                                height: 3,
                              ),
                            ),
                            TextSpan(
                              text: '${localeStr.balanceHintText1}'
                                  '\n${localeStr.balanceHintText2}'
                                  '\n${localeStr.balanceHintText3}'
                                  '\n${localeStr.transferHintRefresh}',
                              style: TextStyle(
                                  fontSize: FontSize.NORMAL.value, height: 1.5),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24.0),
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
