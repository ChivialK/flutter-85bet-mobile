import 'package:flutter/material.dart';

class BlankWidget extends StatefulWidget {
  BlankWidget({Key key}) : super(key: key);

  @override
  _BlankWidgetState createState() => _BlankWidgetState();
}

class _BlankWidgetState extends State<BlankWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Text('Test Area'),
    );
  }
}
