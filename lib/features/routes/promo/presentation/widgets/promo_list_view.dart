import 'dart:async' show StreamSubscription;

import 'package:flutter/material.dart';

import '../../data/models/promo_category.dart';
import '../../data/models/promo_freezed.dart' show PromoEntity;

import 'package:flutter_85bet_mobile/features/router/app_global_streams.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'promo_list_item.dart';

/// Contains a List builder to show [PromoListItem]
/// [category] = promo category that the view belongs
/// [list] = promos data that are under [category]
class PromoListView extends StatefulWidget {
  final PromoCategoryEnum category;
  final List<PromoEntity> list;

  PromoListView({this.category, this.list});

  @override
  _PromoListViewState createState() => _PromoListViewState();
}

class _PromoListViewState extends State<PromoListView> {
  StreamSubscription _langStream;
  String _lang;

  @override
  void initState() {
    _lang = Global.lang.code;
    super.initState();
    _langStream ??= getAppGlobalStreams.languageStream.listen((event) {
      if (event != _lang) {
        _lang = event;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    try {
      _langStream?.cancel();
      _langStream = null;
    } catch (e) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    debugPrint('promo list view: $category');
//    debugPrint('promo list view list: $list');
    if (widget.list == null || widget.list.isEmpty) return SizedBox.shrink();
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      addAutomaticKeepAlives: true,
      itemCount: widget.list.length,
      itemBuilder: (context, index) {
        return PromoListItem(widget.list[index]);
      },
    );
  }
}
