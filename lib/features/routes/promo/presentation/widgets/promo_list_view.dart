import 'package:flutter/material.dart';

import '../../data/models/promo_category.dart';
import '../../data/models/promo_freezed.dart' show PromoEntity;
import 'promo_list_item.dart';

/// Contains a List builder to show [PromoListItem]
/// [category] = promo category that the view belongs
/// [list] = promos data that are under [category]
class PromoListView extends StatelessWidget {
  final PromoCategoryEnum category;
  final List<PromoEntity> list;

  PromoListView({this.category, this.list});

  @override
  Widget build(BuildContext context) {
//    debugPrint('promo list view: $category');
//    debugPrint('promo list view list: $list');
    if (list == null || list.isEmpty) return SizedBox.shrink();
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return PromoListItem(list[index]);
      },
    );
  }
}
