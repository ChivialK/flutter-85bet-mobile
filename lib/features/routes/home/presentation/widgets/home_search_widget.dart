import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/font_size.dart';
import 'package:flutter_85bet_mobile/core/internal/themes.dart';
import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_field_widget.dart';

typedef OnSearch = void Function(String);

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
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: Themes.defaultTabUnselectedColor,
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: new CustomizeFieldWidget(
                key: _searchFieldKey,
                persistHint: false,
                prefixBgColor: Themes.fieldPrefixBgColor,
                useSameBgColor: true,
                padding: EdgeInsets.zero,
                fieldTextSize: FontSize.SUBTITLE.value,
                hint: '',
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text(localeStr.btnSearch),
                onPressed: () => widget
                    .onSearch(_searchFieldKey.currentState?.getInput ?? ''),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
