import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' show IconData;
import 'package:flutter_85bet_mobile/features/router/route_page.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_list_item.freezed.dart';

@freezed
abstract class RouteListItem with _$RouteListItem {
  const factory RouteListItem({
    RouteEnum routeId,
    IconData iconData, // IconData need to be constant
    String imageName,
    String imageSubName,
    RoutePage route,
    bool userOnly,
  }) = _RouteListItem;
}

extension RouteListItemExtension on RouteListItem {
  RouteEnum get id => routeId ?? route.value.id;
  String get title => id.title;
  bool get isUserOnly => userOnly ?? route.value.isUserOnly;
}
