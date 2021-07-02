import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:flutter/widgets.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/cached_network_image.dart';
import 'package:flutter_85bet_mobile/features/routes/home/data/models/game_category_model.dart';

import 'corner_clipper.dart';

enum HomeTabItemType { NORMAL, LIGHT, DARK }

class HomeTabItem extends StatefulWidget {
  final GameCategoryModel category;
  final double itemWidth;
  final bool isFirst;

  HomeTabItem.transparent({
    Key key,
    @required this.category,
    @required this.itemWidth,
    @required this.isFirst,
  })  : type = HomeTabItemType.NORMAL,
        super(key: key);

  HomeTabItem.light({
    Key key,
    @required this.category,
    @required this.itemWidth,
    @required this.isFirst,
  })  : type = HomeTabItemType.LIGHT,
        super(key: key);

  HomeTabItem.dark({
    Key key,
    @required this.category,
    @required this.itemWidth,
    @required this.isFirst,
  })  : type = HomeTabItemType.DARK,
        super(key: key);

  final HomeTabItemType type;

  @override
  HomeTabItemState createState() => HomeTabItemState();
}

class HomeTabItemState extends State<HomeTabItem> {
  final Size _cornerSize = Size(16.0, 12.0) * Global.device.heightScale;

  Size _iconSize;
  Decoration _boxDecor;
  Decoration _boxSelectedDecor;

  bool _isImage;
  bool _isAsset;
  Widget _corner;
  Widget _divider;
  Widget _imageWidget;

  bool _isSelected = false;

  set setSelected(bool selected) {
    if (selected != _isSelected) {
      _isSelected = selected;
      setState(() {
        _imageWidget = _buildImage();
      });
    }
  }

  @override
  void initState() {
    _isSelected = widget.isFirst;
    _iconSize = Size(widget.itemWidth + 4, widget.itemWidth) *
        ((Global.device.widthScale + 1.0) / 2);
    super.initState();
  }

  @override
  void didUpdateWidget(HomeTabItem oldWidget) {
    _boxDecor = null;
    _boxSelectedDecor = null;
    // _corner = null;
    // _divider = null;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case HomeTabItemType.LIGHT:
        _boxDecor ??= BoxDecoration(
          color: themeColor.homeTabBgColor,
        );
        _boxSelectedDecor ??= BoxDecoration(
          color: themeColor.homeTabBgColor,
        );
        // _boxDecor ??= BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.centerLeft,
        //     end: Alignment.centerRight,
        //     colors: [
        //       Color(0xff75695d),
        //       Color(0xffab988a),
        //       Color(0xff8a7363),
        //       themeColor.homeTabLinearColor1,
        //       themeColor.homeTabLinearColor2,
        //       Color(0xfffdecdc),
        //     ],
        //     stops: [0.0, 0.1, 0.19, 0.39, 0.59, 1.0],
        //     tileMode: TileMode.clamp,
        //   ),
        // );
        // _boxSelectedDecor ??= BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.centerLeft,
        //     end: Alignment.centerRight,
        //     colors: [
        //       themeColor.homeTabSelectedLinearColor1,
        //       themeColor.homeTabSelectedLinearColor2,
        //       themeColor.homeTabSelectedLinearColor1,
        //     ],
        //     stops: [0.1, 0.4, 1.0],
        //     tileMode: TileMode.clamp,
        //   ),
        // );
        _corner ??= _buildCornerClipperWidget();
        _divider ??= _buildGradientDividerWidget();
        break;
      case HomeTabItemType.DARK:
        _boxDecor ??= BoxDecoration(
          color: themeColor.homeTabBgColor,
        );
        _boxSelectedDecor ??= BoxDecoration(
          color: themeColor.homeTabBgColor,
        );
        // _boxDecor ??= BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.centerLeft,
        //     end: Alignment.centerRight,
        //     colors: [
        //       themeColor.homeTabLinearColor1,
        //       themeColor.homeTabLinearColor2,
        //       themeColor.homeTabLinearColor1,
        //     ],
        //     stops: [0.1, 0.5, 1.0],
        //     tileMode: TileMode.clamp,
        //   ),
        // );
        // _boxSelectedDecor ??= BoxDecoration(
        //     gradient: RadialGradient(
        //   colors: [
        //     themeColor.homeTabSelectedLinearColor1,
        //     themeColor.homeTabSelectedLinearColor2,
        //   ],
        //   stops: [0.1, 1.0],
        //   radius: 1.3,
        //   focal: Alignment.topCenter,
        //   focalRadius: 0.05,
        //   center: Alignment(0.0, -1.0),
        //   tileMode: TileMode.clamp,
        // ));
        _corner ??= _buildCornerClipperWidget();
        // _corner ??= _buildCornerImageWidget();
        _divider ??= _buildGradientDividerWidget();
        break;
      default:
        _boxDecor = null;
        _boxSelectedDecor = null;
        _corner = null;
        _divider = null;
        break;
    }

    _isImage ??= widget.category.iconUrl.isNotEmpty;
    _isAsset ??= widget.category.assetPath.isNotEmpty;
    _imageWidget ??= _buildImage();

    return Stack(
      children: [
        Container(
          decoration: (_isSelected) ? _boxSelectedDecor : _boxDecor,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(3.0),
                constraints: BoxConstraints.tight(_iconSize),
                child: _buildImage(),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: AutoSizeText(
                    widget.category.label,
                    style: TextStyle(
                      fontSize: FontSize.NORMAL.value,
                      color: (_isSelected)
                          ? themeColor.homeTabSelectedTextColor
                          : themeColor.defaultTextColor,
                    ),
                    maxLines: (Global.lang.isChinese) ? 2 : 3,
                    minFontSize: (Global.lang.isChinese)
                        ? FontSize.NORMAL.value
                        : FontSize.SMALL.value,
                    maxFontSize: FontSize.SUBTITLE.value,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (_corner != null) _corner,
        if (_divider != null) _divider,
      ],
    );
  }

  Widget _buildImage() {
    return (_isImage)
        ? networkImageBuilder(
            widget.category.iconUrl,
            imgColor: (_isSelected)
                ? themeColor.homeTabSelectedTextColor
                : themeColor.defaultAccentColor,
          )
        : (_isAsset)
            ? Image.asset(
                widget.category.info.value.assetPath,
                color: (_isSelected)
                    ? themeColor.homeTabSelectedTextColor
                    : themeColor.defaultAccentColor,
              )
            : Icon(
                (widget.category.iconData != null)
                    ? widget.category.iconData
                    : Icons.add,
                color: (_isSelected)
                    ? themeColor.homeTabSelectedTextColor
                    : themeColor.defaultAccentColor,
                size: (widget.category.info.value.id == HomeCategoryEnum.FISH)
                    ? _iconSize.width - (12 * Global.device.widthScale)
                    : _iconSize.width - (8 * Global.device.widthScale),
              );
  }

  Widget _buildCornerClipperWidget() {
    return Positioned(
      right: 0,
      bottom: 0,
      child: ClipPath(
        clipper: CornerClipper(),
        clipBehavior: Clip.antiAlias,
        child: Container(
          constraints: BoxConstraints.tight(_cornerSize),
          color: cornerColor,
        ),
      ),
    );
  }

  // Widget _buildCornerImageWidget() {
  //   return Positioned(
  //     right: 0,
  //     bottom: 0,
  //     child: ClipPath(
  //       clipper: CornerClipper(),
  //       clipBehavior: Clip.antiAlias,
  //       child: Container(
  //         constraints: BoxConstraints.tight(_cornerSize),
  //         child: Image.asset(Res.corner),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildGradientDividerWidget() {
    return Positioned(
      left: _iconSize.width + 4.0,
      child: Container(
        height: 48.0 * Global.device.widthScale - 16.0,
        width: 1.0,
        margin: const EdgeInsets.symmetric(vertical: 6.0),
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              themeColor.homeBoxDividerColor,
              themeColor.homeTabDividerColor,
              themeColor.homeBoxDividerColor,
            ],
            stops: [0.0, 0.5, 1.0],
            radius: 1.3,
            focal: Alignment.topCenter,
            focalRadius: 0.3,
            center: Alignment(0.0, 1.0),
            tileMode: TileMode.clamp,
          ),
        ),
      ),
    );
  }
}
