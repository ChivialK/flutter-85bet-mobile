import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';

import '../state/balance_store.dart';
import 'balance_grid_item.dart';

class BalanceDisplay extends StatefulWidget {
  final BalanceStore store;

  BalanceDisplay(this.store);

  @override
  _BalanceDisplayState createState() => _BalanceDisplayState();
}

class _BalanceDisplayState extends State<BalanceDisplay> {
  final MemberGridItem pageItem = MemberGridItem.balance;

  final GlobalKey progressTextKey = new GlobalKey();
  final int _itemPerRow = 2;
  final double _itemSpace = 12.0;
  double _gridRatio;

  List<String> platforms;
  List<GlobalKey<BalanceGridItemState>> gridKeys;
  List<BalanceGridItem> gridItems;
  List<ReactionDisposer> _disposers;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposers ??= [
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => widget.store.balanceUpdated,
        // Run some logic with the content of the observed field
        (String platform) {
          if (platform == null || platform.isEmpty) return;
          debugPrint('reaction on $platform update...');
          int gridIndex = platforms.indexOf(platform);
          debugPrint('grid index: $gridIndex');
          GlobalKey<BalanceGridItemState> key = gridItems[gridIndex].key;
          debugPrint(
              'new platform credit: ${widget.store.balanceMap[platform]}');
          key.currentState.setCredit = widget.store.balanceMap[platform];
        },
      ),
    ];
  }

  @override
  void dispose() {
    try {
      widget.store.closeStreams();
      _disposers.forEach((d) => d());
    } on Exception {}
    super.dispose();
  }

  @override
  void initState() {
    platforms = widget.store.promises;
    double gridItemWidth =
        ((Global.device.width - 32) - _itemSpace * (_itemPerRow + 2) - 32) /
            _itemPerRow;
    _gridRatio = gridItemWidth / 128;
    debugPrint('grid item width: $gridItemWidth, gridRatio: $_gridRatio');
    super.initState();
    widget.store.getCreditLimit();
  }

  @override
  void didUpdateWidget(BalanceDisplay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (gridItems != null && gridItems.isNotEmpty) {
      gridKeys.forEach((element) {
        if (element.currentState?.mounted ?? false) {
          element.currentState?.updateVariables(true);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    gridKeys ??= new List();
    gridItems ??= platforms.map((platform) {
      GlobalKey<BalanceGridItemState> key =
          new GlobalKey<BalanceGridItemState>(debugLabel: platform);
      gridKeys.add(key);
      return BalanceGridItem(
        key,
        platform,
        onTapAction: (action, platform) {
          if (widget.store.waitForTransferResult)
            callToast(localeStr.messageWait);
          else
            widget.store.exeGridAction(action, platform);
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
                  decoration: ThemeInterface.pageIconContainerDecor,
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
            padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 8.0),
            child: StreamBuilder<String>(
              stream: widget.store.loadingStream,
              builder: (context, snapshot) {
                if (snapshot != null &&
                    snapshot.data != null &&
                    snapshot.data.isNotEmpty) {
//                        debugPrint('balance progress: ${snapshot.data}');
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        width: 14.0,
                        height: 14.0,
                        child: CircularProgressIndicator(
                          strokeWidth: 3.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          snapshot.data,
                          key: progressTextKey,
                          style: TextStyle(
                            fontSize: FontSize.SUBTITLE.value,
                          ),
                        ),
                      ),
                    ],
                  );
                } else
                  return SizedBox.shrink();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GridView.count(
              physics: ClampingScrollPhysics(),
              crossAxisCount: _itemPerRow,
              mainAxisSpacing: _itemSpace,
              crossAxisSpacing: _itemSpace * 1.5,
              childAspectRatio: _gridRatio,
              shrinkWrap: true,
              primary: false,
              children: gridItems,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: themeColor.defaultTextColor),
                      children: [
                        TextSpan(
                          text: '${localeStr.balanceHintTextTitle}\n',
                          style: TextStyle(
                            color: themeColor.defaultSubtitleColor,
                            fontWeight: FontWeight.bold,
                            height: 3,
                          ),
                        ),
                        TextSpan(
                          text: '${localeStr.balanceHintText1}'
                              '\n${localeStr.balanceHintText2}'
                              '\n${localeStr.balanceHintText3}'
                              '\n${localeStr.balanceHintText4}',
                          style: TextStyle(height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
