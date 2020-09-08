import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/core/internal/themes.dart';

class WarningDisplay extends StatelessWidget {
  final String message;
  final bool smallerText;
  final bool largerText;
  final bool highlight;
  final double widthFactor;
  final double fixedHeight;
  final bool isFailureMsg;

  const WarningDisplay({
    Key key,
    @required this.message,
    this.smallerText = false,
    this.largerText = false,
    this.highlight = false,
    this.widthFactor = 1.5,
    this.fixedHeight,
    this.isFailureMsg = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: Global.device.width / widthFactor,
        maxHeight: fixedHeight ?? double.infinity,
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Icon(
              Icons.warning,
              size: (largerText) ? 28 : (smallerText) ? 18 : 24,
              color:
                  (highlight) ? Themes.defaultErrorColor : Themes.iconSubColor1,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: RichText(
                maxLines: (isFailureMsg) ? 3 : 30,
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: (isFailureMsg) ? message.split('-')[0].trim() : message,
                  style: TextStyle(
                    fontSize: (largerText)
                        ? FontSize.SUBTITLE.value
                        : (smallerText)
                            ? FontSize.SMALLER.value
                            : FontSize.NORMAL.value,
                    color: (highlight)
                        ? Themes.defaultMessageColor
                        : Themes.defaultTextColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
