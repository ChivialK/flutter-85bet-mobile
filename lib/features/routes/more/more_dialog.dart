import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/cached_network_image.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/dialog_widget.dart';
import 'package:flutter_85bet_mobile/features/screen/feature_screen_store.dart';

import 'more_grid_item.dart';

///
///@author H.C.CHIANG
///@version 2020/6/1
///
class MoreDialog extends StatelessWidget {
  final FeatureScreenStore store;

  MoreDialog(this.store);

  static final List<MoreGridItem> gridItems = [
    MoreGridItem.notice,
    MoreGridItem.download,
    MoreGridItem.tutorial,
    MoreGridItem.service,
    MoreGridItem.routeChange,
//    MoreGridItem.store,
//    MoreGridItem.roller,
    MoreGridItem.task,
    MoreGridItem.sign,
    MoreGridItem.agentAbout,
    MoreGridItem.collect,
  ];

  final double _titleHeight = 54.0;
  final double _gridRatio = 1.15;

  void _itemTapped(BuildContext context, RouteListItem itemValue) {
    debugPrint('item tapped: $itemValue');
    if (itemValue.route != null) {
      if (itemValue.isUserOnly && store.hasUser == false) {
        // navigate to login page
        RouterNavigate.navigateToPage(RoutePage.login);
      } else if (itemValue.id == RouteEnum.TUTORIAL ||
          itemValue.id == RouteEnum.AGENT_ABOUT ||
          itemValue.id == RouteEnum.SERVICE) {
        RouterNavigate.replacePage(itemValue.route);
      } else {
        // navigate to route
        RouterNavigate.navigateToPage(itemValue.route);
      }
      Future.delayed(
        Duration(milliseconds: 100),
        () => Navigator.of(context).pop(),
      );
    } else if (itemValue == MoreGridItem.sign.value) {
      if (store == null) return;
      if (store.hasUser == false)
        callToastError(localeStr.messageErrorNotLogin);
//      else
//        store.setForceShowEvent = true;
    } else {
      callToastInfo(localeStr.workInProgress);
    }
  }

  @override
  Widget build(BuildContext context) {
    double gridItemHeight = 320 / 3 / _gridRatio;
    debugPrint('grid item height: $gridItemHeight');

    int row = gridItems.length ~/ 3;
    if (gridItems.length % 3 > 0) row += 1;
    int _generateGrid = row * 3;
    debugPrint('grid row: $row, generate: $_generateGrid');

    double _height = (_titleHeight + row * gridItemHeight).ceilToDouble();
    debugPrint('dialog height: $_height');

    return DialogWidget(
      constraints: BoxConstraints.tight(Size(320.0, _height)),
      customBg: themeColor.moreDialogColor,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: _titleHeight,
                    decoration: BoxDecoration(
                      color: themeColor.dialogTitleBgColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      localeStr.pageTitleMore,
                      style: TextStyle(
                        fontSize: FontSize.TITLE.value,
                        color: themeColor.dialogTitleColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
              ),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: _gridRatio,
                ),
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: _generateGrid,
                itemBuilder: (context, index) {
                  var itemValue = (index < gridItems.length)
                      ? gridItems[index].value
                      : null;
                  return GestureDetector(
                    onTap: (itemValue != null)
                        ? () => _itemTapped(context, itemValue)
                        : null,
                    child: _createGridItem(
                      itemValue,
                      cornerBorderLeft: index == _generateGrid - 3,
                      cornerBorderRight: index == _generateGrid - 1,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _createGridItem(
    RouteListItem itemValue, {
    bool cornerBorderLeft,
    bool cornerBorderRight,
  }) {
    BorderRadius cornerBorder;
    if (cornerBorderLeft)
      cornerBorder = BorderRadius.only(
        bottomLeft: Radius.circular(16.0),
      );
    else if (cornerBorderRight)
      cornerBorder = BorderRadius.only(
        bottomRight: Radius.circular(16.0),
      );
    else
      cornerBorder = BorderRadius.zero;

    return Container(
      decoration: BoxDecoration(
        color: themeColor.moreGridColor,
        borderRadius: cornerBorder,
      ),
      margin: const EdgeInsets.fromLTRB(0.5, 0.5, 0.0, 0.5),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: (itemValue == null)
            ? []
            : <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: (itemValue.imageName != null)
                      ? SizedBox(
                          width: 32.0,
                          height: 32.0,
                          child: (itemValue.imageName.startsWith('assets/'))
                              ? Image.asset(
                                  itemValue.imageName,
                                  color: themeColor.defaultAccentColor,
                                )
                              : networkImageBuilder(
                                  itemValue.imageName,
                                  imgColor: themeColor.defaultAccentColor,
                                ),
                        )
                      : Icon(
                          itemValue.iconData,
                          color: themeColor.defaultAccentColor,
                          size: 32.0,
                        ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 3.0),
                  height: (FontSize.SUBTITLE.value - 1) * 3,
                  child: Text(
                    itemValue.title ?? itemValue.route?.pageTitle ?? '?',
                    style: TextStyle(
                      fontSize: FontSize.SUBTITLE.value - 1,
                      color: themeColor.defaultGridTextColor,
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
      ),
    );
  }
}
