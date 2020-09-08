import 'package:flutter/material.dart';

class HorizontalRadioGroupWidget extends StatefulWidget {
  final List<String> radioLabels;
  final List<dynamic> radioValues;
  final int initIndex;
  final EdgeInsets horizontalPadding;
  final EdgeInsets horizontalTextPadding;
  final bool debug;

  HorizontalRadioGroupWidget(
    Key key, {
    @required this.radioLabels,
    @required this.radioValues,
    this.initIndex = 0,
    this.horizontalPadding = EdgeInsets.zero,
    this.horizontalTextPadding = EdgeInsets.zero,
    this.debug = false,
  }) : super(key: key);

  @override
  HorizontalRadioGroupWidgetState createState() =>
      HorizontalRadioGroupWidgetState();
}

class HorizontalRadioGroupWidgetState
    extends State<HorizontalRadioGroupWidget> {
  dynamic _selected;

  dynamic get getSelected => _selected;

  @override
  void initState() {
    _selected = widget.radioValues[widget.initIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(widget.radioLabels.length, (index) {
        return Padding(
          padding: widget.horizontalPadding,
          child: Row(
            children: <Widget>[
              Radio(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                value: widget.radioValues[index],
                groupValue: _selected,
                onChanged: (value) {
                  _selected = value;
                  if (widget.debug) debugPrint('selected type: $_selected');
                  setState(() {});
                },
              ),
              Padding(
                padding: widget.horizontalTextPadding,
                child: Text(widget.radioLabels[index]),
              ),
            ],
          ),
        );
      }),
    );
  }
}
