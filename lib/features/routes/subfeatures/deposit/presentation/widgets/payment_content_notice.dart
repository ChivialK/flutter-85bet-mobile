import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';

/// NoticeView for each Payment type
///@author H.C.CHIANG
///@version 2020/3/26
class PaymentContentNotice extends StatelessWidget {
  final int typeKey;

  PaymentContentNotice(this.typeKey);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
            color: Themes.defaultTextColor, fontSize: FontSize.SUBTITLE.value),
        children: _buildNoticeList,
      ),
    );
  }

  List<InlineSpan> get _buildNoticeList {
    switch (typeKey) {
      // PaymentEnum.online
      case 2:
        return [
          TextSpan(text: localeStr.depositHintTextMaxExceed('1.')),
          TextSpan(text: localeStr.depositHintTextInfo('2.')),
          TextSpan(
            text: '${localeStr.depositHintTextService}\n',
            style: TextStyle(color: Themes.hintHyperLink),
            //TODO add link
            recognizer: new TapGestureRecognizer()
              ..onTap = () => debugPrint('Tapped'),
          ),
          TextSpan(text: localeStr.depositHintTextUnion('3.')),
          TextSpan(text: localeStr.depositHintTextFailure('4.')),
          TextSpan(text: localeStr.depositHintTextLastNum('5.')),
        ];
        break;
      // PaymentEnum.wechat
      case 3:
        return [
          TextSpan(text: localeStr.depositHintTextMaxExceed('1.')),
          TextSpan(text: localeStr.depositHintTextInfo('2.')),
          TextSpan(
            text: '${localeStr.depositHintTextService}\n',
            style: TextStyle(color: Themes.hintHyperLink),
            recognizer: new TapGestureRecognizer()
              ..onTap = () => debugPrint('Tapped'),
          ),
          TextSpan(text: localeStr.depositHintTextFailure('3.')),
          TextSpan(text: localeStr.depositHintTextLimit('4.')),
        ];
        break;
      // PaymentEnum.quickPay
      case 4:
        return [
          TextSpan(text: localeStr.depositHintTextMaxExceed('1.')),
          TextSpan(text: localeStr.depositHintTextInfo('2.')),
          TextSpan(
            text: '${localeStr.depositHintTextService}\n',
            style: TextStyle(color: Themes.hintHyperLink),
            recognizer: new TapGestureRecognizer()
              ..onTap = () => debugPrint('Tapped'),
          ),
          TextSpan(text: localeStr.depositHintTextFailure('3.')),
          TextSpan(text: localeStr.depositHintTextQuickpay('4.')),
        ];
        break;
      // PaymentEnum.ali
      case 5:
        return [
          TextSpan(
            text: localeStr.depositHintTextAli('1.'),
            style: TextStyle(color: Themes.hintHighlightRed),
          ),
          TextSpan(text: localeStr.depositHintTextMaxExceed('2.')),
          TextSpan(text: localeStr.depositHintTextInfo('3.')),
          TextSpan(
            text: '${localeStr.depositHintTextService}\n',
            style: TextStyle(color: Themes.hintHyperLink),
            recognizer: new TapGestureRecognizer()
              ..onTap = () => debugPrint('Tapped'),
          ),
          TextSpan(text: localeStr.depositHintTextFailure('4.')),
        ];
        break;
      // PaymentEnum.union
      case 7:
        return [
          TextSpan(text: localeStr.depositHintTextMaxExceed('1.')),
          TextSpan(text: localeStr.depositHintTextInfo('2.')),
          TextSpan(
            text: '${localeStr.depositHintTextService}\n',
            style: TextStyle(color: Themes.hintHyperLink),
            recognizer: new TapGestureRecognizer()
              ..onTap = () => debugPrint('Tapped'),
          ),
          TextSpan(text: localeStr.depositHintTextUnionShortcut('3.')),
          TextSpan(text: localeStr.depositHintTextFailure('4.')),
          TextSpan(text: localeStr.depositHintTextUnion('5.')),
          TextSpan(text: '\t${localeStr.depositHintTextUnionA}'),
          TextSpan(text: '\t${localeStr.depositHintTextUnionB}'),
          TextSpan(text: '\t${localeStr.depositHintTextUnionC}'),
        ];
        break;
      // PaymentEnum.virtual
      case 8:
        return [
          TextSpan(text: localeStr.depositHintTextMaxExceed('1.')),
          TextSpan(text: localeStr.depositHintTextInfo('2.')),
          TextSpan(
            text: '${localeStr.depositHintTextService}\n',
            style: TextStyle(color: Themes.hintHyperLink),
            recognizer: new TapGestureRecognizer()
              ..onTap = () => debugPrint('Tapped'),
          ),
          TextSpan(text: localeStr.depositHintTextFailure('3.')),
        ];
        break;
      // PaymentEnum.bank
      // PaymentEnum.atm
      // PaymentEnum.jdcom
      default:
        return [
          TextSpan(text: localeStr.depositHintTextClearInfo('1.')),
          TextSpan(text: localeStr.depositHintTextMaxExceed('2.')),
          TextSpan(text: localeStr.depositHintTextFailure('3.')),
        ];
        break;
    }
  }
}
