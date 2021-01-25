import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/themes/theme_interface.dart';
import 'package:flutter_85bet_mobile/utils/regex_util.dart';

import '../../data/models/message_model.dart';
import 'message_item_size_calc.dart';

typedef MessageTapCall = void Function(int);

class MessageDisplayItem extends StatefulWidget {
  final MessageModel data;
  final MessageTapCall onItemTap;
  final MessageItemSizeCalc itemSize;

  MessageDisplayItem(Key key,
      {@required this.data, @required this.itemSize, this.onItemTap})
      : super(key: key);

  @override
  MessageDisplayItemState createState() => MessageDisplayItemState();
}

class MessageDisplayItemState extends State<MessageDisplayItem> {
  bool isRead;
  bool hasChinese;
  int availableCharacters;
  bool headerMultiLine;

  MessageItemSizeCalc get calc => widget.itemSize;

  @override
  void initState() {
    isRead = widget.data.isRead;
    hasChinese = widget.data.title.hasChinese;
    availableCharacters = (calc.maxWidth * 0.75 / calc.headerTextSize).floor();
    headerMultiLine = widget.data.title.countLength > availableCharacters;
    debugPrint('header has chinese: $hasChinese, multiline: $headerMultiLine');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Container(
          decoration: new BoxDecoration(
            color: themeColor.dialogBgColor0,
          ),
          child: ConfigurableExpansionTile(
            header: _buildHeader(false),
            headerExpanded: _buildHeader(true),
            children: <Widget>[
              Container(
                constraints: BoxConstraints(minHeight: calc.headerTextSize * 3),
                margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Divider(
                        height: 2.0,
                        color: Colors.black26,
                        thickness: 2.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 16.0,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              '${widget.data.msg}',
                              style: TextStyle(
                                  fontSize: calc.headerTextSize - 2,
                                  color: themeColor.defaultCardTitleColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              '${widget.data.date}',
                              style: TextStyle(
                                  fontSize: calc.headerTextSize - 4,
                                  color: themeColor.defaultCardTitleColor),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
            onExpansionChanged: (isExpanded) {
              if (!isRead && isExpanded) {
                widget.onItemTap(widget.data.id);
                setState(() {
                  isRead = true;
                });
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(bool isExpanded) {
    return Container(
      width: calc.maxWidth,
      height: calc.maxHeaderHeight,
      margin: EdgeInsets.symmetric(vertical: calc.headerInset),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 0,
            child: Padding(
              padding: (isExpanded)
                  ? EdgeInsets.only(
                      left: 12.0,
                      right: 12.0,
                      top: (headerMultiLine && hasChinese)
                          ? 3
                          : (hasChinese) ? 2 : 0,
                    )
                  : const EdgeInsets.symmetric(horizontal: 12.0),
              child: (isRead || isExpanded)
                  ? Icon(
                      Icons.check_box,
                      color: themeColor.iconColorGreen,
                      size: calc.iconSize,
                    )
                  : Icon(
                      const IconData(0xf086, fontFamily: 'FontAwesome'),
                      color: themeColor.iconColorYellow,
                      size: calc.iconSize,
                    ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              widget.data.title,
              style: TextStyle(
                fontSize: calc.headerTextSize,
                color: themeColor.defaultCardTitleColor,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: (headerMultiLine) ? 2 : 1,
            ),
          ),
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Icon(
                (isExpanded) ? Icons.remove : Icons.add,
                color: themeColor.defaultCardTitleColor,
                size: calc.iconSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
