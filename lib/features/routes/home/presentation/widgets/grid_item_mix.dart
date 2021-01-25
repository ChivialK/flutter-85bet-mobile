import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/themes/theme_interface.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/cached_network_image.dart';
import 'package:relative_layout/relative_layout.dart';

import 'grid_plugin_favorite.dart';

class GridItemMix extends StatelessWidget {
  final String imgUrl;
  final String label;
  final bool isFavorite;
  final double itemSize;
  final double textHeight;
  final bool twoLineText;
  final bool isPlatform;
  final PluginTapAction pluginTapAction;
  final bool isIos;

  GridItemMix({
    @required this.isPlatform,
    @required this.imgUrl,
    @required this.label,
    @required this.isFavorite,
    @required this.itemSize,
    @required this.textHeight,
    @required this.twoLineText,
    @required this.pluginTapAction,
    @required this.isIos,
  });

  @override
  Widget build(BuildContext context) {
    return RelativeLayout(
      children: <Widget>[
        LayoutId(
          id: RelativeId('img', alignment: Alignment.topCenter),
          child: Container(
//            margin: const EdgeInsets.only(bottom: 12.0),
            constraints: BoxConstraints.tight(Size(itemSize, itemSize)),
            child: (imgUrl != null)
                ? Transform.scale(
                    scale: (isPlatform) ? 1.15 : 0.9,
                    child: networkImageBuilder(imgUrl,
                        addPendingIconOnError: true),
                  )
                : Center(child: Icon(Icons.broken_image)),
          ),
        ),
        LayoutId(
          id: RelativeId(
            'lb',
            below: 'img',
            alignment: Alignment.center,
          ),
          child: Container(
            margin: const EdgeInsets.only(bottom: 14.0),
            padding: (isIos)
                ? (twoLineText)
                    ? const EdgeInsets.only(bottom: 9.0)
                    : const EdgeInsets.only(bottom: 3.0)
                : (twoLineText)
                    ? const EdgeInsets.only(bottom: 8.0)
                    : EdgeInsets.zero,
            constraints: BoxConstraints.tightFor(
              width: itemSize * 0.9,
              height:
                  (twoLineText) ? textHeight - 6 : textHeight, // move up 6 pix
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        label ?? '?',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: (twoLineText) ? 2 : 1,
                        style: TextStyle(
                          fontSize: FontSize.NORMAL.value,
                          color: themeColor.defaultGridTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (pluginTapAction != null)
          LayoutId(
            id: RelativeId('fav', alignment: Alignment.topLeft),
            child: GridPluginFavorite(
              initValue: isFavorite,
              onTap: (checked) => pluginTapAction(checked),
            ),
          ),
      ],
    );
  }
}
