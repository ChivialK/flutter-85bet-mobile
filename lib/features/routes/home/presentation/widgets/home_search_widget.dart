import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_field_widget.dart';
import 'package:flutter_85bet_mobile/features/themes/theme_interface.dart';

import '../../../../export_internal_file.dart';

typedef OnSearch = void Function(HomeSearchType, String);

enum HomeSearchType { PLATFORM, GAME }

class HomeSearchWidget extends StatefulWidget {
  final OnSearch onSearch;

  HomeSearchWidget({@required this.onSearch});

  @override
  _HomeSearchWidgetState createState() => _HomeSearchWidgetState();
}

class _HomeSearchWidgetState extends State<HomeSearchWidget> {
  final GlobalKey<CustomizeFieldWidgetState> _searchFieldKey =
      new GlobalKey(debugLabel: 'search');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Global.device.width,
      height: 68.0,
      color: themeColor.defaultIndicatorColor,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.apps,
                    color: themeColor.homeTabIconColor,
                    size: 26.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AutoSizeText(
                      localeStr.gameCategoryAll,
                      style: TextStyle(
                        color: themeColor.homeTabIconColor,
                        fontWeight: FontWeight.w500,
                      ),
                      minFontSize: FontSize.NORMAL.value,
                      maxFontSize: FontSize.MESSAGE.value,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: themeColor.homeTabBgColor,
                ),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: new CustomizeFieldWidget(
                          key: _searchFieldKey,
                          persistHint: false,
                          prefixBgColor: themeColor.fieldPrefixBgColor,
                          useSameBgColor: true,
                          padding: EdgeInsets.zero,
                          fieldTextSize: FontSize.SUBTITLE.value,
                          roundCorner: true,
                          hint: localeStr.hintActionSearchGame,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: themeColor.homeBoxButtonTextColor,
                      ),
                      onPressed: () => widget.onSearch(
                        HomeSearchType.GAME,
                        _searchFieldKey.currentState?.getInput ?? '',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
