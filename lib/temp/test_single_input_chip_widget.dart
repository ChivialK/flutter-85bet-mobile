import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/themes/theme_interface.dart';
import 'package:flutter_85bet_mobile/features/general/toast_widget_export.dart';

class SingleInputChipWidget extends StatefulWidget {
  @override
  _SingleInputChipWidgetState createState() => _SingleInputChipWidgetState();
}

class _SingleInputChipWidgetState extends State<SingleInputChipWidget> {
  @override
  Widget build(BuildContext context) {
    return InputChip(
      avatar: CircleAvatar(
        backgroundColor: themeColor.hintHyperLink,
        child: Text('B'),
      ),
      label: Text('Button'),
      onPressed: () {
        callToast('You pressed me');
      },
    );
  }
}
