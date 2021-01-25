import 'package:flutter/widgets.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';

import '../state/point_store.dart';
import 'store_display_tabs.dart';

class StoreDisplay extends StatefulWidget {
  final PointStore store;

  StoreDisplay(this.store);

  @override
  _StoreDisplayState createState() => _StoreDisplayState();
}

class _StoreDisplayState extends State<StoreDisplay> {
  double availableHeight;

  // double imageHeight;
  double titleHeight;
  double titleImageSize;
  double contentHeight;

  @override
  void initState() {
    // double imageContainerScale = 1920 / Global.device.width;
    // origin pic size is w1920*h530
    // imageHeight = 530 / imageContainerScale;
    // print('store banner height: $imageHeight');

    titleImageSize = 32 * Global.device.widthScale;
    titleHeight = titleImageSize * 2 + 10.0;

    availableHeight = Global.device.featureContentHeight - 8;
    contentHeight = availableHeight - titleHeight - 8.0;
    print('store content height: $contentHeight');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // ConstrainedBox(
        //   constraints: BoxConstraints(
        //     minWidth: Global.device.width,
        //     maxWidth: Global.device.width,
        //     minHeight: imageHeight,
        //     maxHeight: imageHeight,
        //   ),
        //   child: StoreDisplayBanner(images: widget.store.banners),
        // ),
        Container(
          constraints: BoxConstraints.tightFor(height: titleHeight),
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          margin: const EdgeInsets.only(top: 4.0, bottom: 6.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: themeColor.iconBgColor,
                  boxShadow: ThemeInterface.iconBottomShadow,
                ),
                child: DecoratedBox(
                  decoration: ThemeInterface.iconDecorNoColor,
                  child: Icon(
                    const IconData(0xe946, fontFamily: 'IconMoon'),
                    size: titleImageSize,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  localeStr.pageTitleStore,
                  style: TextStyle(fontSize: FontSize.HEADER.value),
                ),
              )
            ],
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: Global.device.width,
            maxWidth: Global.device.width,
            minHeight: contentHeight,
            maxHeight: contentHeight,
          ),
          child: StoreDisplayTabs(
            store: widget.store,
            parentHeight: contentHeight,
          ),
        ),
      ],
    );
  }
}
