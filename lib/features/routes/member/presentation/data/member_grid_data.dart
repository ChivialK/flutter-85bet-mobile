import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show IconData, Color;
import 'package:flutter_85bet_mobile/features/router/route_page.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_grid_data.freezed.dart';

@freezed
abstract class MemberGridData with _$MemberGridData {
  const factory MemberGridData({
    @required RouteEnum id,
    @required IconData iconData,
    Color iconDecorColor,
    Color iconDecorColorStart,
    Color iconDecorColorEnd,
    RoutePage route,
    @Default(true) bool isUserOnly,
  }) = _MemberGridData;
}

extension MemberGridDataExtension on MemberGridData {
  String get label => id.gridTitle ?? id.title;
}
