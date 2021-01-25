import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_dropdown_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_field_widget.dart';
import 'package:flutter_85bet_mobile/features/router/app_navigate.dart';
import 'package:flutter_85bet_mobile/utils/datetime_format.dart';
import 'package:flutter_85bet_mobile/utils/regex_util.dart';

import '../../data/entity/center_account_entity.dart'
    show CenterAccountEntity, CenterAccountEntityExtension;
import '../state/center_store.dart';
import 'center_store_inherit_widget.dart';

class CenterDisplayAccount extends StatefulWidget {
  @override
  _CenterDisplayAccountState createState() => _CenterDisplayAccountState();
}

class _CenterDisplayAccountState extends State<CenterDisplayAccount> {
  final MemberGridItem pageItem = MemberGridItem.accountCenter;

  static final Key _streamKey = new Key('accountstream');
  final GlobalKey<CustomizeFieldWidgetState> _mailFieldKey =
      new GlobalKey(debugLabel: 'mail');

  CenterStore _store;
  CenterAccountEntity _storeData;
  Widget contentWidget;

  double maxFieldWidth;
  double fieldBtnWidth;
  TextStyle _textStyle = TextStyle(fontSize: FontSize.SUBTITLE.value);

  int _selectedYear;
  int _selectedMonth;
  int _selectedDay;

  void checkAndPost(BuildContext context, Function postCall) {
    FocusScope.of(context).unfocus();
    if (_store == null) return;
    if (_store.waitForResponse) {
      callToast(localeStr.messageWait);
      return;
    }
    postCall();
  }

  @override
  void initState() {
    maxFieldWidth = (Global.device.width - 48) / 7 * 4;
    if (Global.device.widthScale > 1.0) {
      fieldBtnWidth = maxFieldWidth * 0.4 / Global.device.widthScale;
    } else {
      fieldBtnWidth = maxFieldWidth * 0.4;
    }
    if (fieldBtnWidth < Global.device.comfortButtonHeight) {
      fieldBtnWidth = FontSize.SUBTITLE.value * 6;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _store ??= CenterStoreInheritedWidget.of(context).store;
    if (_store == null) {
      return Center(
        child: WarningDisplay(
          message:
              Failure.internal(FailureCode(type: FailureType.INHERIT)).message,
        ),
      );
    }
    return Container(
      decoration: ThemeInterface.layerShadowDecorRoundBottom,
      constraints: BoxConstraints(minHeight: 60),
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: InkWell(
        // to dismiss the keyboard when the user tabs out of the TextField
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: StreamBuilder(
          key: _streamKey,
          stream: _store.accountStream,
          builder: (context, snapshot) {
//        print('account stream snapshot: $snapshot');
            if (_storeData != _store.accountEntity) {
              _storeData = _store.accountEntity;
              contentWidget = _buildContent();
            }
            contentWidget ??= _buildContent();
            return contentWidget;
          },
        ),
      ),
    );
  }

  Widget _buildContent() {
    return ListView(
      primary: true,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      children: [
        _buildRow(
          localeStr.centerTextTitleAccount,
          Text('${_storeData.accountCode}', style: _textStyle),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: GestureDetector(
              child: _buildButtonContainer(localeStr.centerTextButtonChangePwd),
              onTap: () {
                RouterNavigate.navigateToPage(
                  RoutePage.centerPassword,
                  arg: CenterDisplayAccountPasswordArguments(store: _store),
                );
              },
            ),
          ),
        ),
        _buildRow(
          localeStr.centerTextTitleName,
          (_storeData.firstName.isNotEmpty)
              ? Text('${_storeData.firstName}', style: _textStyle)
              : Text('${_storeData.accountCode}', style: _textStyle),
        ),
        _buildRow(
          localeStr.centerTextTitleBirth,
          (_storeData.canBindBirthDate)
              ? _buildDateSelector()
              : Text('${_storeData.birthDate}', style: _textStyle),
          child: (_storeData.canBindBirthDate)
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: GestureDetector(
                    child:
                        _buildButtonContainer(localeStr.centerTextButtonBind),
                    onTap: () {
                      if (_selectedYear != null &&
                          _selectedMonth != null &&
                          _selectedDay != null) {
//                        print('request bind birth date: $_selectedYear-$_selectedMonth-$_selectedDay');
                        DateTime date = DateTime(
                            _selectedYear, _selectedMonth, _selectedDay);
                        String birth = date.toDateString;
//                        print('birth date: $birth');
                        checkAndPost(context, () {
                          if (birth.isDate &&
                              checkDateRange(birth, getDateString())) {
                            _store.bindBirth(birth);
                          } else {
                            callToast(localeStr.messageInvalidFormat);
                          }
                        });
                      }
                    },
                  ),
                )
              : null,
          wrapInColumn: _storeData.canBindBirthDate,
        ),
        _buildRow(
          localeStr.centerTextTitlePhone,
          Text('${_storeData.phone}', style: _textStyle),
        ),
        _buildRow(
          localeStr.centerTextTitleMail,
          (_storeData.canBindMail)
              ? new CustomizeFieldWidget(
                  key: _mailFieldKey,
                  persistHint: false,
                  hint: '',
                  horizontalInset: Global.device.width - maxFieldWidth,
                  maxInputLength: InputLimit.ADDRESS_MAX,
                )
              : Text('${_storeData.email}', style: _textStyle),
          child: (_storeData.canBindMail)
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: GestureDetector(
                    child:
                        _buildButtonContainer(localeStr.centerTextButtonEdit),
                    onTap: () {
                      checkAndPost(context, () {
                        String mail = _mailFieldKey.currentState.getInput;
                        if (mail.isNotEmpty && mail.isEmail)
                          _store.bindEmail(mail);
                        else
                          callToast(localeStr.messageInvalidFormat);
                      });
                    },
                  ),
                )
              : null,
          wrapInColumn: _storeData.canBindMail,
        ),
      ],
    );
  }

  Widget _buildRow(
    String title,
    Widget content, {
    Widget child,
    bool wrapInColumn = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '$title:',
              style: _textStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 5,
            child: (wrapInColumn)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      content,
                      if (child != null) child,
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        content,
                        if (child != null) child,
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonContainer(String text) {
    return Container(
      constraints: BoxConstraints(
        minHeight: Global.device.comfortButtonHeight * 0.75,
        maxHeight: Global.device.comfortButtonHeight,
        minWidth: Global.device.comfortButtonHeight,
        maxWidth: fieldBtnWidth,
      ),
      decoration: BoxDecoration(
        color: themeColor.centerButtonColor,
        border: Border.all(color: themeColor.centerButtonBorderColor),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8.0),
          bottomLeft: Radius.circular(8.0),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: themeColor.centerButtonShadowColor,
            spreadRadius: 1.15,
            blurRadius: 3.0,
            offset: Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          /// use stack to apply foreground color
          DecoratedBox(
            decoration: BoxDecoration(
              color: Color.fromRGBO(243, 152, 0, 0.1),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
              ),
            ),
          ),
          Center(
              child: Text(
            text,
            style: _textStyle,
            maxLines: 2,
            textAlign: TextAlign.center,
          )),
        ],
      ),
    );
  }

  Widget _buildDateSelector() {
    int thisYear = DateTime.now().year;
    List<int> years = List.generate(120, (index) => thisYear - index);
    List<int> months =
        List.generate(12, (index) => 12 - index).reversed.toList();
    List<int> days = List.generate(31, (index) => 31 - index).reversed.toList();
    _selectedYear = years.first;
    _selectedMonth = months.first;
    _selectedDay = days.first;
    return SizedBox(
      width: maxFieldWidth,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: CustomizeDropdownWidget(
              optionValues: years,
              changeNotify: (data) {
                _selectedYear = data;
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomizeDropdownWidget(
              optionValues: months,
              changeNotify: (data) {
                _selectedMonth = data;
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomizeDropdownWidget(
              optionValues: days,
              changeNotify: (data) {
                _selectedDay = data;
              },
            ),
          ),
        ],
      ),
    );
  }
}
