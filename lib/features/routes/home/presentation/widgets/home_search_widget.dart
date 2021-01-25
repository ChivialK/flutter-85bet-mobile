import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';

import 'package:flutter_85bet_mobile/features/general/widgets/customize_field_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/gradient_button.dart';

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
    return (ThemeInterface.theme.isDefaultColor)
        ? Container(
            margin: const EdgeInsets.symmetric(horizontal: 12.0),
            alignment: Alignment.center,
            child: Material(
              elevation: 6.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 2,
                      child: new CustomizeFieldWidget(
                        key: _searchFieldKey,
                        persistHint: false,
                        prefixBgColor: (ThemeInterface.theme.isDefaultColor)
                            ? themeColor.fieldInputSubBgColor
                            : Colors.transparent,
                        useSameBgColor: true,
                        padding: EdgeInsets.zero,
                        minusHeight: 16.0,
                        hint: '',
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GradientButton(
                          child: Text(localeStr.btnSearch),
                          onPressed: () => widget.onSearch(
                              _searchFieldKey.currentState?.getInput ?? ''),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Container(
            margin: const EdgeInsets.symmetric(horizontal: 12.0),
            alignment: Alignment.center,
            child: Material(
              elevation: 6.0,
              color: themeColor.homeTabBgColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 2,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: themeColor.defaultBorderColor)),
                        child: new CustomizeFieldWidget(
                          key: _searchFieldKey,
                          persistHint: false,
                          prefixBgColor: Colors.transparent,
                          fieldTextColor: themeColor.fieldInputColor,
                          useSameBgColor: true,
                          minusHeight: 16.0,
                          hint: '',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GradientButton(
                          child: Text(localeStr.btnSearch),
                          onPressed: () => widget.onSearch(
                              _searchFieldKey.currentState?.getInput ?? ''),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
