import 'package:flutter/material.dart' show BuildContext, Locale;
import 'package:flutter_85bet_mobile/generated/l10n.dart';
import 'package:flutter_85bet_mobile/mylogger.dart';

import '../../injection_container.dart' show sl;

S get localeStr {
  try {
    return sl.get<LocalStrings>()?.res;
  } catch (e) {
    MyLogger.error(msg: 'Localize File not initialized', tag: 'LocalStrings');
    return null;
  }
}

/// Class for access I10n Localize String without context
/// Using flutter_intl plugin to auto generate I10n.dart file, which will generate a [S] class.
///
///@author H.C.CHIANG
///@version 2020/2/6
///
class LocalStrings {
  final BuildContext ctx;

  LocalStrings(this.ctx);

  S get res => S.of(ctx);

  /// Load desired locale language
  Future<bool> setLanguage(String lang) async {
    try {
      return await S.load(Locale(lang, '')).then((value) => true);
    } catch (e) {
      MyLogger.error(msg: 'Load locale $lang error: $e', tag: 'LocalStrings');
      return false;
    }
  }
}
