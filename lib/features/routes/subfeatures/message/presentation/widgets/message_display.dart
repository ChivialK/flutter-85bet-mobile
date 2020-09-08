import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/event/event_inject.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/screen/feature_screen_inherited_widget.dart';

import '../state/message_store.dart';
import 'message_display_item.dart';
import 'message_item_size_calc.dart';

class MessageDisplay extends StatefulWidget {
  final MessageStore store;

  MessageDisplay(this.store);

  @override
  _MessageDisplayState createState() => _MessageDisplayState();
}

class _MessageDisplayState extends State<MessageDisplay> {
  final MemberGridItem pageItem = MemberGridItem.stationMessages;
  List<GlobalKey<MessageDisplayItemState>> _itemKeys;
  List<MessageDisplayItem> _listItems;

  EventStore _eventStore;
  MessageItemSizeCalc _itemSizeCalc;
  bool _waitDelayedCheck = false;

  @override
  Widget build(BuildContext context) {
    if (widget.store.messageList == null) {
      return Center(
        child: WarningDisplay(
          message:
              Failure.internal(FailureCode(type: FailureType.MESSAGE, code: 10))
                  .message,
        ),
      );
    }

    _eventStore = FeatureScreenInheritedWidget.of(context)?.eventStore;
    debugPrint('screen has new message: ${_eventStore?.hasNewMessage}');

    _itemSizeCalc ??= new MessageItemSizeCalc();
    _itemKeys ??= new List();
    _listItems ??= widget.store.messageList.map((message) {
      GlobalKey<MessageDisplayItemState> key =
          new GlobalKey<MessageDisplayItemState>(debugLabel: 'm${message.id}');
      _itemKeys.add(key);
      return MessageDisplayItem(
        key,
        data: message,
        itemSize: _itemSizeCalc,
        onItemTap: (id) {
          widget.store.updateMessageStatus(id);
          if (!_waitDelayedCheck) {
            _waitDelayedCheck = true;
            Future.delayed(Duration(milliseconds: 500), () {
              _eventStore?.getNewMessageCount();
              _waitDelayedCheck = false;
            });
          }
        },
      );
    }).toList();
    return SizedBox(
      width: Global.device.width - 24.0,
      child: ListView(
        primary: true,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(4.0, 20.0, 4.0, 12.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Themes.memberIconColor,
                    boxShadow: Themes.roundIconShadow,
                  ),
                  child: Icon(
                    pageItem.value.iconData,
                    size: 32 * Global.device.widthScale,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    pageItem.value.label,
                    style: TextStyle(fontSize: FontSize.HEADER.value),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4.0, 20.0, 4.0, 8.0),
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: _listItems.length,
              itemBuilder: (_, index) {
                return _listItems[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
