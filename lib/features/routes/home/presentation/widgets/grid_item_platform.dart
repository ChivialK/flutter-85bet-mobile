import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/cached_network_image.dart';
import 'package:relative_layout/relative_layout.dart';

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
            margin: const EdgeInsets.only(bottom: 18.0),
            constraints: BoxConstraints.tight(
              Size(itemSize, itemSize),
            ),
            child: (imgUrl != null)
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        constraints: BoxConstraints.tight(
                          Size(itemSize, itemSize) * 0.75,
                        ),
                        margin: EdgeInsets.only(top: itemSize * 0.15),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(26, 119, 223, 0.3),
                        ),
                      ),
                      SizedBox(
                          width: itemSize,
                          height: itemSize - textHeight,
                          child: networkImageBuilder(imgUrl,
                              addPendingIconOnError: true)),
                    ],
                  )
                : Center(child: Icon(Icons.broken_image)),
          ),
        ),
      ],
    );
  }
}
