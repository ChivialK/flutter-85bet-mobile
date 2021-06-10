import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/input_limit.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_field_widget.dart';
import 'package:flutter_85bet_mobile/features/themes/theme_interface.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: new CustomizeFieldWidget(
                key: _searchFieldKey,
                hint: '',
                persistHint: false,
                minusHeight: 16.0,
                prefixBgColor: themeColor.defaultCardColor,
                useSameBgColor: true,
                fieldTextColor: Colors.white,
                maxInputLength: InputLimit.WECHAT_MAX,
              ),
            ),
          ),
          RaisedButton(
            visualDensity: VisualDensity(horizontal: -4, vertical: -0.75),
            child: Icon(Icons.search),
            onPressed: () =>
                widget.onSearch(_searchFieldKey.currentState?.getInput ?? ''),
          ),
        ],
      ),
    );
  }
}
