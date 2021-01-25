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

  final List<String> chipValues = [
    '100',
    '500',
    '1000',
    '2000',
    '5000',
    'all',
  ];
  List<String> chipLabels;
  List<TransferPlatformModel> _site2List = [];

  final double _fieldInset = 72.0;

//  double _valueTextPadding;
  String _valueInitText;
  String _site1Selected;
  String _site2Selected;

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
      if (!rangeCheck(
        value: amount,
        min: 1,
        max: widget.store.creditLimit,
      )) {
        callToastError(localeStr.messageInvalidDepositAmount);
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

  void _setSite1(String platform) {
    if (platform == null) return;
    debugPrint('display selected: $platform');
    // platform credit can only transfer to member wallet
    if (platform != '0') {
      _site2List = [widget.store.platforms.first];
      _site2Selected = '0';
      _site2Key.currentState.setSelected = '0';
      widget.store.setSite2Value('');
      widget.store.getBalance('0');
      setState(() {});
    } else if (_site2List.length == 1) {
      // restore site2 dropdown to normal
      _site2List = List.from(widget.store.platforms)..removeAt(0);
      _site2Selected = null;
      _site2Key.currentState.setSelected = null;
      widget.store.setSite2Value('');
      setState(() {});
    } else if (platform == '0' && _site2List.length == 0) {
      // when site2 dropdown not initialized
      _site2List = List.from(widget.store.platforms)..removeAt(0);
      setState(() {});
    }
    // set site1 selected
    _site1Selected = platform;
//  widget.store.setSite1Value('$data');
    widget.store.setSite1Value('');
    widget.store.getBalance(platform, isLimit: true);
  }

  void _setSite2(String platform) {
    if (platform == null) return;
    debugPrint('display selected: $platform');
    // set site2 selected
    _site2Selected = platform;
    widget.store.setSite2Value('');
    widget.store.getBalance(platform);
  }

  @override
  void initState() {
//    _valueTextPadding = (Global.device.width.roundToDouble() - _fieldInset) *
//            themeColor.prefixTextWidthFactor -
//        themeColor.minusSize +
//        16.0;
    _valueInitText = localeStr.transferViewSiteHint;
    chipLabels = [
      '100',
      '500',
      '1000',
      '2000',
      '5000',
      localeStr.transferViewTextOptionAll,
    ];
    super.initState();
  }

  @override
  void didUpdateWidget(TransferDisplay oldWidget) {
    _valueInitText = localeStr.transferViewSiteHint;
    super.didUpdateWidget(oldWidget);
    chipLabels.replaceRange(chipLabels.length - 1, chipLabels.length,
        [localeStr.transferViewTextOptionAll]);
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
                            /// From Site Option
                            ///
                            new CustomizeTitledContainer(
                              prefixText: localeStr.transferViewTitleOut,
                              prefixTextSize: FontSize.SUBTITLE.value,
                              prefixBgColor: themeColor.fieldPrefixBgColor,
                              backgroundColor: themeColor.fieldPrefixBgColor,
                              horizontalInset: _fieldInset,
                              roundCorner: false,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: CustomizeDropdownWidget(
                                      key: _site1Key,
                                      horizontalInset: _fieldInset,
                                      padding: EdgeInsets.zero,
                                      roundCorner: false,
                                      optionValues: widget.store.platforms
                                          .map((e) => e.site)
                                          .toList(),
                                      optionStrings: widget.store.platforms
                                          .map((e) => e.name)
                                          .toList(),
                                      clearValueOnMenuChanged: true,
                                      changeNotify: (data) => _setSite1(data),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          8.0, 4.0, 0.0, 6.0),
                                      child: StreamBuilder<String>(
                                        stream: widget.store.site1ValueStream,
                                        initialData: _valueInitText,
                                        builder: (context, snapshot) {
                                          bool reset = snapshot.data == null ||
                                              snapshot.data.isEmpty ||
                                              widget.store.site1.strToInt == -1;
                                          String text = (reset)
                                              ? _valueInitText
                                              : snapshot.data;
                                          debugPrint('site1 reset: $reset');
                                          return GestureDetector(
                                            onTap: () {
                                              if (_site1Selected == null)
                                                return;
                                              widget.store.setSite1Value('');
                                              widget.store
                                                  .getBalance(_site1Selected);
                                            },
                                            child: Text(text,
                                                style: TextStyle(
                                                  color: themeColor
                                                      .fieldSuffixColor,
                                                )),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            ///
                            /// To Site Option
                            ///
                            new CustomizeTitledContainer(
                              prefixText: localeStr.transferViewTitleIn,
                              prefixTextSize: FontSize.SUBTITLE.value,
                              prefixBgColor: themeColor.fieldPrefixBgColor,
                              backgroundColor: themeColor.fieldPrefixBgColor,
                              horizontalInset: _fieldInset,
                              roundCorner: false,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: CustomizeDropdownWidget(
                                      key: _site2Key,
                                      horizontalInset: _fieldInset,
                                      padding: EdgeInsets.zero,
                                      roundCorner: false,
                                      optionValues: _site2List
                                          .map((e) => e.site)
                                          .toList(),
                                      optionStrings: _site2List
                                          .map((e) => e.name)
                                          .toList(),
                                      clearValueOnMenuChanged: true,
                                      changeNotify: (data) => _setSite2(data),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          8.0, 4.0, 0.0, 6.0),
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
                                              if (_site2Selected == null)
                                                return;
                                              widget.store.setSite2Value('');
                                              widget.store
                                                  .getBalance(_site2Selected);
                                            },
                                            child: Text(text,
                                                style: TextStyle(
                                                  color: themeColor
                                                      .fieldSuffixColor,
                                                )),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            ///
                            /// Amount Input Field
                            ///
                            new CustomizeTitledContainer(
                              prefixText: localeStr.transferViewTitleAmount,
                              prefixTextSize: FontSize.SUBTITLE.value,
                              prefixBgColor: themeColor.fieldPrefixBgColor,
                              backgroundColor: themeColor.fieldPrefixBgColor,
                              horizontalInset: _fieldInset,
                              roundCorner: false,
                              child: new CustomizeFieldWidget(
                                key: _amountFieldKey,
                                fieldType: FieldType.Numbers,
                                persistHint: false,
                                hint: 'VDK',
                                maxInputLength: 10,
                                horizontalInset: _fieldInset,
                                padding: EdgeInsets.zero,
                                roundCorner: false,
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
                              labels: chipLabels,
                              values: chipValues,
                              heightFactor: 1.75,
                              backgroundColor:
                                  themeColor.defaultLayeredBackgroundColor,
                              roundChip: false,
                              chipTapCall: (value) {
                                if (value == 'all')
                                  _amountFieldKey.currentState.setInput =
                                      '${widget.store.creditLimit}';
                                else
                                  _amountFieldKey.currentState.setInput = value;
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
                            child: GradientButton(
                              expand: true,
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
