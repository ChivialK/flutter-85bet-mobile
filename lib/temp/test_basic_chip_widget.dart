import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/themes.dart';

class TestBasicChipWidget extends StatefulWidget {
  @override
  _TestBasicChipWidgetState createState() => _TestBasicChipWidgetState();
}

class _TestBasicChipWidgetState extends State<TestBasicChipWidget> {
  bool isDelete = false;

  @override
  Widget build(BuildContext context) {
    return (isDelete)
        ? SizedBox.shrink()
        : Chip(
            avatar: CircleAvatar(
              backgroundColor: Theme.of(context).accentColor,
              child: Text('L'),
            ),
            label: Text('Label'),
            deleteIcon: Icon(
              Icons.cancel,
              color: Themes.defaultWidgetColor,
            ),
            onDeleted: () => setState(() {
              isDelete = !isDelete;
            }),
          );
  }
}
