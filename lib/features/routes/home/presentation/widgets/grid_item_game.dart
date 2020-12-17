import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/cached_network_image.dart';
import 'package:flutter_85bet_mobile/features/themes/theme_interface.dart';

class GridItemGame extends StatelessWidget {
  final String imgUrl;
  final String label;
  final double itemSize;
  final double fontSize;
  final bool twoLineText;
  final bool isIos;

  GridItemGame({
    @required this.imgUrl,
    @required this.label,
    @required this.itemSize,
    @required this.fontSize,
    @required this.twoLineText,
    @required this.isIos,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        Container(
          constraints: BoxConstraints.tight(Size(itemSize, itemSize)),
          child: (imgUrl != null)
              ? networkImageBuilder(imgUrl, addPendingIconOnError: true)
              : Center(child: Icon(Icons.broken_image)),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            color: Color(0xc01a77df),
            alignment: Alignment.center,
            width: itemSize,
            height: (twoLineText) ? fontSize * 2.5 + 12 : fontSize * 1.5 + 12,
            padding: const EdgeInsets.all(6.0),
            child: Text(
              label,
              maxLines: (twoLineText) ? 2 : 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                color: themeColor.homeTabSelectedTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
