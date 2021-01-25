import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/routes/home/data/models/game_category_model.dart';

import 'tab_control.dart';

class TabItem extends StatefulWidget {
  final int index;
  final GameCategory category;
  final BoxConstraints itemConstraints;

  TabItem({
    @required this.index,
    @required this.category,
    @required this.itemConstraints,
  });

  @override
  _TabItemState createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  bool _selected;
  String _asset = '';

  @override
  void initState() {
    _asset = widget.category.value.assetPath ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<TabControl, int>(
      selector: (_, provider) => provider.getTabIndex,
      builder: (_, index, __) {
        // debugPrint('tab ${widget.index} receives index change: $index');
        if (_selected != (index == widget.index)) {
          _selected = index == widget.index;
        }
        return Container(
          color: (_selected)
              ? themeColor.homeTabIconBgColor
              : themeColor.homeTabBgColor,
          constraints: widget.itemConstraints,
          padding: const EdgeInsets.only(top: 6.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 6.0),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        (_selected)
                            ? themeColor.homeTabSelectedTextColor
                            : themeColor.homeTabIconColor,
                        BlendMode.srcIn),
                    child: Image.asset(_asset),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: AutoSizeText(
                  widget.category.value.label,
                  maxLines: 1,
                  minFontSize: FontSize.NORMAL.value,
                  maxFontSize: FontSize.SUBTITLE.value,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
