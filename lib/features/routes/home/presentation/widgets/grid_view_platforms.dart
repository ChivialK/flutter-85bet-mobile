import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/routes/home/data/models/game_platform.dart';
import 'package:flutter_85bet_mobile/features/themes/font_size.dart';

import 'grid_view_item.dart';

typedef OnPlatformItemTap = void Function(GamePlatformEntity);
typedef OnPlatformItemTapFavor = void Function(GamePlatformEntity, bool);

class GridViewPlatform extends StatelessWidget {
  final double pageMaxWidth;
  final double labelWidthFactor;
  final bool isIos;
  final List<GamePlatformEntity> platforms;
  final OnPlatformItemTap onTap;
  final bool addPlugin;
  final OnPlatformItemTapFavor onFavorTap;

  GridViewPlatform({
    @required this.pageMaxWidth,
    @required this.labelWidthFactor,
    @required this.isIos,
    @required this.platforms,
    @required this.onTap,
    this.addPlugin = false,
    this.onFavorTap,
  });

  final FontSize _basicFontSize = FontSize.MESSAGE; // FontSize.SMALLER
  final int _itemPerRow = 1; // 3
  final int _itemMaxWidth = 140; // 100
  final double _verticalEmptySpace = 8.0;

  @override
  Widget build(BuildContext context) {
    int plusOnWidth = _itemMaxWidth * (_itemPerRow + 1);
    int plusPerRow = (pageMaxWidth >= plusOnWidth)
        ? (pageMaxWidth / _itemMaxWidth).floor() - _itemPerRow
        : 0;
    int calcPerRow = _itemPerRow + plusPerRow;
    // debugPrint(
    //     'platform page width: $pageMaxWidth, minimum width: $plusOnWidth');
    // debugPrint('platform grid per row: $_itemPerRow, plus per row: $plusPerRow');

    double fontSize =
        ((isIos) ? _basicFontSize.value + 2 : _basicFontSize.value) -
            2 * plusPerRow;
    double textHeight = fontSize * 1.75 + _verticalEmptySpace;
    double perItemWidth = pageMaxWidth / calcPerRow;
    if (perItemWidth > 200) perItemWidth = 200;
    double ratio = perItemWidth / (perItemWidth + textHeight);
    debugPrint('platform item size: $perItemWidth, font: $fontSize '
        'perRow: $calcPerRow, ratio: $ratio');

    if (calcPerRow > 1) {
      return GridView.count(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 2.0),
        crossAxisCount: calcPerRow,
        childAspectRatio: ratio,
        shrinkWrap: true,
        children: platforms
            .map((entity) => _createGridItem(
                  platform: entity,
                  imgSize: perItemWidth,
                  fontSize: FontSize.define(fontSize + FontSize.minus),
                  textHeight: textHeight,
                ))
            .toList(),
      );
    } else {
      return ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 2.0),
        shrinkWrap: true,
        itemCount: platforms.length,
        itemBuilder: (_, index) {
          return _createGridItem(
            platform: platforms[index],
            imgSize: perItemWidth,
            fontSize: FontSize.define(fontSize + FontSize.minus),
            textHeight: textHeight,
          );
        },
      );
    }
  }

  /// Create grid item for data [platform]
  /// Returns a [Stack] widget with image and name
  Widget _createGridItem(
      {@required GamePlatformEntity platform,
      @required imgSize,
      @required fontSize,
      @required textHeight}) {
    return GestureDetector(
      onTap: () => onTap(platform),
      child: GridViewItem.platform(
        imgUrl: platform.imageUrl,
        label: platform.label,
        imageSize: imgSize,
        fontSize: fontSize,
        labelHeight: textHeight,
        labelMaxWidthFactor: labelWidthFactor,
        verticalSpaceAroundLabel: _verticalEmptySpace,
        isFavorite: platform.favorite == '1',
        pluginTapAction: (addPlugin &&
                onFavorTap != null &&
                platform.imageUrl != null &&
                platform.label != null)
            ? (isFavorite) => onFavorTap(platform, isFavorite)
            : null,
      ),
    );
  }
}
