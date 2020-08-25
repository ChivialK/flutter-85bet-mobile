import 'package:flutter_85bet_mobile/core/internal/font_size.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';

class MessageItemSizeCalc {
  double headerTextSize;
  double maxHeight;
  double maxHeaderHeight;
  double headerInset;
  double maxWidth;
  double iconSize;

  MessageItemSizeCalc() {
    headerTextSize = FontSize.TITLE.value;
    maxHeight = headerTextSize * 4;
    maxHeaderHeight = headerTextSize * 3;
    headerInset = (maxHeight - maxHeaderHeight) / 2 - 4.0;

    maxWidth = Global.device.width - 56.0;
    iconSize = 28.0 * Global.device.widthScale;
  }
}
