import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:flutter/widgets.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/cached_network_image.dart';
import 'package:flutter_85bet_mobile/features/routes/home/data/models/game_category_model.dart';
import 'package:flutter_85bet_mobile/res.dart';

import 'corner_clipper.dart';

enum HomeTabItemType { LIGHT, DARK }

class HomeTabItem extends StatefulWidget {
  final GameCategoryModel category;
  final double itemWidth;

  HomeTabItem.light({
    Key key,
    @required this.category,
    @required this.itemWidth,
  })  : type = HomeTabItemType.LIGHT,
        super(key: key);

  HomeTabItem.dark({
    Key key,
    @required this.category,
    @required this.itemWidth,
  })  : type = HomeTabItemType.DARK,
        super(key: key);

  final HomeTabItemType type;

  @override
  HomeTabItemState createState() => HomeTabItemState();
}

class HomeTabItemState extends State<HomeTabItem> {
  final Size _iconSize = Size(36.0, 30.0) * Global.device.widthScale;
  final Size _cornerSize = Size(16.0, 12.0) * Global.device.heightScale;

  Decoration _boxDecor;
  Decoration _boxSelectedDecor;

  Widget _corner;
  Widget _divider;

  bool _isSelected = false;

  set setSelected(bool selected) {
    if (selected != _isSelected) {
      setState(() {
        _isSelected = selected;
      });
    }
  }

  @override
  void didUpdateWidget(HomeTabItem oldWidget) {
    _boxDecor = null;
    _boxSelectedDecor = null;
    _corner = null;
    _divider = null;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case HomeTabItemType.LIGHT:
        _boxDecor ??= BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xff75695d),
              Color(0xffab988a),
              Color(0xff8a7363),
              themeColor.homeTabLinearColor1,
              themeColor.homeTabLinearColor2,
              Color(0xfffdecdc),
            ],
            stops: [0.0, 0.1, 0.19, 0.39, 0.59, 1.0],
            tileMode: TileMode.clamp,
          ),
        );
        _boxSelectedDecor ??= BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              themeColor.homeTabSelectedLinearColor1,
              themeColor.homeTabSelectedLinearColor2,
              themeColor.homeTabSelectedLinearColor1,
            ],
            stops: [0.1, 0.4, 1.0],
            tileMode: TileMode.clamp,
          ),
        );
        _corner ??= _buildCornerClipperWidget();
        _divider ??= _buildGradientDividerWidget();
        break;
      case HomeTabItemType.DARK:
        _boxDecor ??= BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              themeColor.homeTabLinearColor1,
              themeColor.homeTabLinearColor2,
              themeColor.homeTabLinearColor1,
            ],
            stops: [0.1, 0.5, 1.0],
            tileMode: TileMode.clamp,
          ),
        );
        _boxSelectedDecor ??= BoxDecoration(
            gradient: RadialGradient(
          colors: [
            themeColor.homeTabSelectedLinearColor1,
            themeColor.homeTabSelectedLinearColor2,
          ],
          stops: [0.1, 1.0],
          radius: 1.3,
          focal: Alignment.topCenter,
          focalRadius: 0.05,
          center: Alignment(0.0, -1.0),
          tileMode: TileMode.clamp,
        ));
        _corner ??= _buildCornerImageWidget();
        _divider ??= _buildGradientDividerWidget();
        break;
    }
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
                padding: const EdgeInsets.all(4.0),
                constraints: BoxConstraints.tight(_iconSize),
                child: (widget.category.iconUrl.isNotEmpty)
                    ? networkImageBuilder(
                        widget.category.iconUrl,
                        imgColor: themeColor.homeTabIconColor,
                      )
                    : (widget.category.iconCode != null)
                        ? Icon(widget.category.iconCode,
                            color: themeColor.homeTabIconColor)
                        : Icon(Icons.add, color: themeColor.homeTabIconColor),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: AutoSizeText(
                    widget.category.label,
                    style: TextStyle(fontSize: FontSize.NORMAL.value),
                    maxLines: 2,
                    minFontSize: FontSize.SMALL.value,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
        _corner,
        _divider,
      ],
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

  Widget _buildCornerImageWidget() {
    return Positioned(
      right: 0,
      bottom: 0,
      child: ClipPath(
        clipper: CornerClipper(),
        clipBehavior: Clip.antiAlias,
        child: Container(
          constraints: BoxConstraints.tight(_cornerSize),
          child: Image.asset(Res.tab_corner),
        ),
      ),
    );
  }

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
