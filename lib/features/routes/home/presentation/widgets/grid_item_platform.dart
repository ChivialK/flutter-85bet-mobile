import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/cached_network_image.dart';
import 'package:relative_layout/relative_layout.dart';

const _platformBg1Color = Color.fromRGBO(193, 161, 127, 0.6);
const _platformBg2Color = Color.fromRGBO(104, 77, 54, 0.6);

class GridItemPlatform extends StatelessWidget {
  final String imgUrl;
  final String label;
  final double itemSize;
  final double textHeight;
  final bool isIos;

  GridItemPlatform({
    @required this.imgUrl,
    @required this.label,
    @required this.itemSize,
    @required this.textHeight,
    @required this.isIos,
  });

  @override
  Widget build(BuildContext context) {
    return RelativeLayout(
      children: <Widget>[
        LayoutId(
          id: RelativeId('img', alignment: Alignment.topCenter),
          child: Container(
            constraints: BoxConstraints.tight(
              Size(itemSize - 5, itemSize + textHeight),
            ),
            margin: const EdgeInsets.fromLTRB(2.5, 0.0, 2.5, 18.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [_platformBg1Color, _platformBg2Color],
                stops: [0.3, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
            child: (imgUrl != null)
                ? Container(
                    margin: const EdgeInsets.all(8.0),
                    width: itemSize - 5,
                    height: itemSize,
                    child: networkImageBuilder(imgUrl,
                        addPendingIconOnError: true))
                : Center(child: Icon(Icons.broken_image)),
          ),
        ),
      ],
    );
  }
}
