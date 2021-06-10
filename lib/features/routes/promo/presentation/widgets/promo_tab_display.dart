import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/types_grid_widget.dart';

import '../../data/models/promo_category.dart';
import '../../data/models/promo_freezed.dart';
import 'promo_detail.dart';
import 'promo_tab_list_item.dart';

/// Display promo category and items
/// [promos] = data from repository
/// [showPromoId] = promo's id when home page banner was clicked
class PromoTabDisplay extends StatefulWidget {
  final List<PromoEntity> promos;
  final int showPromoId;

  const PromoTabDisplay(this.promos, {this.showPromoId = -1});

  @override
  _PromoTabDisplayState createState() => _PromoTabDisplayState();
}

class _PromoTabDisplayState extends State<PromoTabDisplay>
    with AfterLayoutMixin {
  List<PromoCategoryEnum> _categories;

  List<PromoEntity> _contentList;

  void updateContent(PromoCategoryEnum type) {
    debugPrint('switching promo type list...$type');
    if (!mounted) return;
    setState(() {
      _contentList = (type == PromoCategoryEnum.all)
          ? widget.promos
          : widget.promos
              .where((promo) => promo.categoryStr == type.value.category)
              .toList();
    });
  }

  @override
  void initState() {
    _contentList ??= widget.promos;
    super.initState();
    _categories ??= [
      PromoCategoryEnum.fish,
      PromoCategoryEnum.slot,
      PromoCategoryEnum.live,
      PromoCategoryEnum.sport,
      PromoCategoryEnum.lottery,
      PromoCategoryEnum.other
    ];
    _categories.removeWhere((cat) => !(widget.promos
        .any((promo) => promo.categoryStr == cat.value.category)));
    _categories.insert(0, PromoCategoryEnum.all);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: true,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 0.0),
          child: TypesGridWidget<PromoCategoryEnum>(
            types: _categories,
            titleKey: 'label',
            onTypeGridTap: (_, type) => updateContent(type),
            tabsPerRow: (Global.device.widthScale > 1.2) ? 5 : 4,
            itemSpace: 2.0,
            expectTabHeight: 36.0,
            icons: _categories.map((e) => e.value.iconData).toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 8.0),
          child: Container(
            constraints: BoxConstraints(minHeight: 100),
            // decoration: ThemeInterface.layerShadowDecorRoundBottom,
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List<Widget>.generate(_contentList.length, (index) {
                return PromoTabListItem(_contentList[index], (promo) {
                  showDialog(
                    context: context,
                    builder: (context) => new PromoDetail(promo),
                  );
                });
              }),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    // show Promo Detail if id is specified
    if (widget.showPromoId != -1) {
      debugPrint('open promo id: ${widget.showPromoId}');
      Future.delayed(Duration(milliseconds: 500), () {
        var promo = widget.promos
            .firstWhere((element) => element.id == widget.showPromoId);
        debugPrint('debug show promo on home image click: $promo');
        if (promo != null) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => new PromoDetail(promo),
          );
        }
      });
    }
  }
}
