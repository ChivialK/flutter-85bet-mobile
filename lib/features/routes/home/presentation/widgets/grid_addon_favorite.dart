import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/res.dart';

typedef PluginTapAction = Future<bool> Function(bool);

class GridAddonFavorite extends StatefulWidget {
  final PluginTapAction onTap;
  final bool initValue;
  final EdgeInsets padding;

  GridAddonFavorite({
    Key key,
    this.initValue = false,
    this.padding = const EdgeInsets.only(left: 6.0, top: 5.0),
    @required this.onTap,
  }) : super(key: key);

  @override
  GridAddonFavoriteState createState() => GridAddonFavoriteState();
}

class GridAddonFavoriteState extends State<GridAddonFavorite> {
  bool _locked = false;
  bool checked;

  void setFavorite({bool favor, bool request = false}) async {
    if (checked == favor) return;
    if (_locked) {
      callToast(localeStr.messageWait);
      return;
    }
    if (request) {
      setState(() => _locked = true);
      await widget.onTap(favor).then((success) {
        if (success) {
          callToast(localeStr.messageSuccess);
          setState(() {
            checked = favor;
            _locked = false;
          });
        } else {
          callToast(localeStr.messageFailed);
          setState(() => _locked = false);
        }
      });
    } else {
      setState(() => checked = favor);
    }
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
      child: Stack(
        children: [
          if (!_locked)
            IconButton(
              icon: Image.asset(
                Res.tbico_love,
                color: (checked)
                    ? Colors.pinkAccent
                    : themeColor.homeFavoriteColor,
              ),
              iconSize: 18.0,
              visualDensity: VisualDensity.compact,
              padding: widget.padding,
              onPressed: () => setFavorite(favor: !checked, request: true),
            ),
          if (_locked)
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Center(
                child: SizedBox(
                  width: 16.0,
                  height: 16.0,
                  child: CircularProgressIndicator(),
                ),
              ),
            )
        ],
      ),
    );
  }
}
