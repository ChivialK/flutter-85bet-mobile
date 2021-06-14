import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:flutter_85bet_mobile/features/themes/theme_interface.dart';

class BankcardDisplayNotice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: themeColor.defaultTextColor,
          fontSize: FontSize.SUBTITLE.value,
          height: 1.25,
        ),
        children: _buildNoticeList,
      ),
    );
  }

  List<InlineSpan> get _buildNoticeList {
    return [
      TextSpan(
        text: "${localeStr.depositHintTextTitle}:\n\n",
        style: TextStyle(
          color: themeColor.hintHighlightDarkRed,
          fontSize: FontSize.MESSAGE.value,
        ),
      ),
      TextSpan(text: "${localeStr.bankcardNotice1}\n\n"),
      TextSpan(text: "${localeStr.bankcardNotice2}\n\n"),
      TextSpan(text: "${localeStr.bankcardNotice3}\n\n"),
      TextSpan(text: "${localeStr.bankcardNotice4}\n\n"),
      TextSpan(text: "${localeStr.bankcardNotice5}\n\n"),
      TextSpan(text: "${localeStr.bankcardNotice6}"),
    ];
  }
}
