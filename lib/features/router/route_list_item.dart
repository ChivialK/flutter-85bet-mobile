import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' show IconData;
import 'package:flutter_85bet_mobile/features/router/route_page.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_list_item.freezed.dart';

@freezed
abstract class RouteListItem with _$RouteListItem {
  const factory RouteListItem({
    @required RouteEnum id,
    IconData iconData, // IconData need to be constant
    String imageName,
    RoutePage route,
    @Default(false) bool isUserOnly,
  }) = _RouteListItem;
}

extension RouteListItemExtension on RouteListItem {
  String get title => id.title;
}
