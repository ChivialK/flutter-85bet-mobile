import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../data/model/deposit_info.dart';
import '../../data/model/payment_promo.dart';
import '../../data/model/payment_type.dart';
import 'payment_content_local.dart';
import 'payment_content_online.dart';

/// Content View
///@author H.C.CHIANG
///@version 2020/3/26
class PaymentContent extends StatefulWidget {
  final Function depositCall;
  final Map<int, List<PaymentPromoData>> promos;
  final List<DepositInfo> infoList;
  final Map<int, String> rules;
  final Map<int, String> banks;
  final int firstTypeKey;

  PaymentContent({
    key,
    @required this.promos,
    @required this.infoList,
    @required this.depositCall,
    @required this.rules,
    @required this.banks,
    @required this.firstTypeKey,
  }) : super(key: key);

  @override
  PaymentContentState createState() => PaymentContentState();
}

class PaymentContentState extends State<PaymentContent> {
  PaymentType _paymentType;
  Widget _typeContent;
  Widget _noticeContent;
  int _noticeType;

  void update(PaymentType type) {
//    debugPrint('updating payment type ${type.label} content...');
    if (_paymentType != type) {
      _paymentType = type;
      setState(() {
        updateContent(type);
      });
    }
  }

  void updateContent(PaymentType type) {
    _typeContent = (type.key == 1)
        ? new PaymentContentLocal(
            dataList: type.data,
            promoList: (widget.promos.containsKey(type.key))
                ? widget.promos[type.key]
                : [],
            infoList: widget.infoList,
            bankMap: widget.banks,
            depositFuncCall: widget.depositCall,
          )
        : new PaymentContentOnline(
            dataList: type.data,
            depositFuncCall: widget.depositCall,
          );

    if (_noticeType != type.key) {
      _noticeContent = _buildNotice(context, type.key);
      _noticeType = type.key;
    }
  }

  @override
  void initState() {
    _noticeType = widget.firstTypeKey;
    super.initState();
  }

  @override
  void didUpdateWidget(PaymentContent oldWidget) {
    _typeContent = null;
    _noticeContent = null;
    _noticeType = null;
    super.didUpdateWidget(oldWidget);
    updateContent(_paymentType);
  }

  @override
  Widget build(BuildContext context) {
    _noticeContent ??= _buildNotice(context, _noticeType);
    _typeContent ??= SizedBox.shrink();
    return Container(
      constraints: BoxConstraints(minHeight: 100),
      decoration: ThemeInterface.layerShadowDecorRoundBottom,
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (_paymentType != null) _typeContent,
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Row(
              children: <Widget>[
                Text(
                  '${localeStr.depositHintTextTitle}：',
                  style: TextStyle(
                    color: themeColor.defaultTextColor,
                    fontSize: FontSize.TITLE.value,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: _noticeContent,
          ),
        ],
      ),
    );
  }

  Widget _buildNotice(BuildContext context, int typeId) {
    debugPrint('build deposit rules count: ${widget.rules.length}');
    if (widget.rules != null &&
        widget.rules.isNotEmpty &&
        widget.rules.containsKey(typeId)) {
//      debugPrint('rules content: ${widget.rules[typeId]}');
      return HtmlWidget(widget.rules[typeId]);
    } else {
      return SizedBox.shrink();
    }
  }
}
