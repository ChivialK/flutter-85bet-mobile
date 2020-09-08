import 'package:flutter/material.dart';

class TestBasicDropdownWidget extends StatefulWidget {
  TestBasicDropdownWidget({
    key,
  }) : super(key: key);

  @override
  _TestBasicDropdownWidgetState createState() =>
      _TestBasicDropdownWidgetState();
}

class _TestBasicDropdownWidgetState extends State<TestBasicDropdownWidget> {
  String type;
  int optionId;

  final items = [
    {
      "displayName": "Enter value",
      "type": "string",
    },
    {
      "displayName": "Source",
      "type": "list",
      "data": [
        {"id": 1, "displayId": "MO"},
        {"id": 2, "displayId": "AO"},
        {"id": 3, "displayId": "OffNet"}
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    Widget supporting = buildSupportingWidget();
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        DropdownButtonHideUnderline(
          child: DropdownButton(
            value: type,
            hint: Text("Select a type"),
            items: items
                .map((json) => DropdownMenuItem(
                    child: Text(json["displayName"]), value: json["type"]))
                .toList(),
            onChanged: (newType) {
              setState(() {
                type = newType;
              });
            },
          ),
        ),
        if (supporting != null) supporting,
      ],
    );
  }

  Widget buildSupportingWidget() {
    if (type == "list") {
      List<Map<String, Object>> options = items[1]["data"];
      return Expanded(
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: optionId,
            hint: Text("Select an entry"),
            items: options
                .map((option) => DropdownMenuItem(
                    child: Text(option["displayId"]), value: option["id"]))
                .toList(),
            onChanged: (newId) => setState(() {
              this.optionId = newId;
            }),
          ),
        ),
      );
    } else if (type == "string") {
      return Expanded(child: TextFormField());
    }
    return null;
  }
}
