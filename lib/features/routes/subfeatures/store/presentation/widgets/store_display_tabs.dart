import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/types_grid_widget.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/store/data/entity/store_tabs.dart';

import '../state/point_store.dart';
import 'point_store_inherit_widget.dart';
import 'point_widget.dart';
import 'store_display_products.dart';
import 'store_display_record.dart';
import 'store_display_rules.dart';

/// Display promo category and items
/// [promos] = data from repository
/// [showPromoId] = promo's id when home page banner was clicked
class StoreDisplayTabs extends StatefulWidget {
  final PointStore store;
  final double maxHeight;

  StoreDisplayTabs({
    @required this.store,
    @required this.maxHeight,
  });

  @override
  _StoreDisplayTabsState createState() => _StoreDisplayTabsState();
}

class _StoreDisplayTabsState extends State<StoreDisplayTabs> {
  final GlobalKey routeKey = new GlobalKey();
  final List<StoreTabsEnum> _tabs = [
    StoreTabsEnum.product,
    StoreTabsEnum.rules,
    StoreTabsEnum.records,
  ];

  int _tabIndex = 0;
  double _contentMaxHeight;

  @override
  void initState() {
    _contentMaxHeight = widget.maxHeight - 8.0 - 36.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.maxHeight,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(4.0, 16.0, 4.0, 0.0),
            child: TypesGridWidget<StoreTabsEnum>(
              types: _tabs,
              titleKey: 'label',
              onTypeGridTap: (index, _) {
                if (mounted) {
                  setState(() {
                    _tabIndex = index;
                  });
                }
              },
              tabsPerRow: 3,
              itemSpace: 2.0,
              expectTabHeight: 36.0,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
              child: Container(
                constraints: BoxConstraints(minHeight: 100),
                color: themeColor.defaultLayeredBackgroundColor,
                padding: const EdgeInsets.all(8.0),
                child: PointStoreInheritedWidget(
                    key: routeKey,
                    store: widget.store,
                    pointWidget: PointWidget(widget.store),
                    child: IndexedStack(
                      index: _tabIndex,
                      children: [
                        StoreDisplayProducts(),
                        StoreDisplayRules(_contentMaxHeight),
                        StoreDisplayRecord(_contentMaxHeight),
                      ],
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
