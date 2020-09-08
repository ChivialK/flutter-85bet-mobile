import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/core/internal/themes.dart';
import 'package:flutter_85bet_mobile/res.dart';

typedef PluginTapAction = void Function(bool);

class GridPluginFavorite extends StatefulWidget {
  final PluginTapAction onTap;
  final bool initValue;
  final EdgeInsets padding;

  GridPluginFavorite({
    this.initValue = false,
    this.padding = const EdgeInsets.only(left: 6.0, top: 5.0),
    this.onTap,
  });

  @override
  _GridPluginFavoriteState createState() => _GridPluginFavoriteState();
}

class _GridPluginFavoriteState extends State<GridPluginFavorite> {
  bool checked;

  void setFavorite(bool value) {
    if (checked == value) return;
    if (widget.onTap != null) widget.onTap(value);
    setState(() {
      checked = value;
    });
  }

  @override
  void initState() {
    checked = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.0 * Global.device.widthScale,
      height: 24.0 * Global.device.widthScale,
      child: IconButton(
        icon: Image.asset(
          Res.tbico_fav,
          color: (checked) ? Colors.pinkAccent : Themes.homeFavoriteColor,
        ),
        iconSize: 18.0,
        visualDensity: VisualDensity.compact,
        padding: widget.padding,
        onPressed: () => setFavorite(!checked),
      ),
    );
  }
}
