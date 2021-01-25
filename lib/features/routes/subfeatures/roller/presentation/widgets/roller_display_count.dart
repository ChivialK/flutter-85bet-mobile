import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_mobx/flutter_mobx.dart' show Observer;

import '../state/roller_store.dart';

class RollerDisplayCount extends StatefulWidget {
  final RollerStore store;

  RollerDisplayCount(this.store);

  @override
  _RollerDisplayCountState createState() => _RollerDisplayCountState();
}

class _RollerDisplayCountState extends State<RollerDisplayCount> {
  Widget _widget;
  int count;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (count != widget.store.count) {
          count = widget.store.count;
          _widget = _buildText();
        }
        _widget ??= _buildText();
        return _widget;
      },
    );
  }

  Widget _buildText() {
    return AutoSizeText(
      localeStr.wheelTextTitleCount(count ?? ' '),
      style: TextStyle(
        color: themeColor.hintHighlightNotice,
        fontSize: FontSize.TITLE.value,
        fontWeight: FontWeight.bold,
      ),
      maxFontSize: FontSize.TITLE.value,
      minFontSize: FontSize.SMALL.value,
    );
  }
}
