import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/cached_network_image.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/checkbox_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/dialog_widget.dart';
import 'package:flutter_85bet_mobile/features/home/data/models/ad_model.dart';

class HomeDisplayAdDialog extends StatefulWidget {
  final List<AdModel> ads;
  final CheckBoxCallBack onClose;

  HomeDisplayAdDialog({@required this.ads, @required this.onClose});

  @override
  _HomeDisplayAdDialogState createState() => _HomeDisplayAdDialogState();
}

class _HomeDisplayAdDialogState extends State<HomeDisplayAdDialog> {
  final GlobalKey<CheckboxWidgetState> _skipKey =
      new GlobalKey(debugLabel: 'skip');

  Size adSize;
  bool skip = false;

  @override
  void initState() {
    double adWidth = Global.device.width * 0.825;
    if (adWidth > 300) adWidth = 300;
    adSize = Size(adWidth, adWidth);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.onClose != null) widget.onClose(skip);
        return Future.value(true);
      },
      child: DialogWidget(
        noBackground: true,
        canClose: false,
        constraints: BoxConstraints.tight(Size(
          adSize.width,
          adSize.height + 56.0,
        )),
        children: [
          Container(
            constraints: BoxConstraints.tight(adSize),
            child: Carousel(
              boxFit: BoxFit.fill,
              images: widget.ads
                  .map((ad) => Container(
                        margin: const EdgeInsets.only(bottom: 24.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: networkImageBuilder(
                            ad.picMobile,
                            fit: BoxFit.fill,
                            roundCorner: true,
                            roundParam: 16.0,
                          ),
                        ),
                      ))
                  .toList(),
              showIndicator: true,
              dotPosition: DotPosition.bottomCenter,
              dotSize: 8.0,
              dotIncreaseSize: 1.1,
              dotSpacing: 16.0,
              indicatorBgPadding: 4.0,
              dotColor: Colors.white54,
              dotIncreasedColor: Colors.white,
              dotBgColor: Colors.transparent,
              borderRadius: false,
              animationDuration: Duration(milliseconds: 1000),
              autoplayDuration: Duration(seconds: 5),
              onImageTap: (index) {},
            ),
          ),
          Positioned(
            top: adSize.width - 24,
            child: CheckboxWidget(
              key: _skipKey,
              label: localeStr.btnStopShowing,
              labelColor: Colors.white,
              widgetPadding: EdgeInsets.zero,
              initValue: false,
              onChecked: (value) {
                skip = value;
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: adSize.width / 2 - 22,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  constraints: BoxConstraints.tight(Size(40.0, 40.0)),
                  margin: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.0),
                  ),
                  child: IconButton(
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 36.0,
                    ),
                    onPressed: () {
                      if (widget.onClose != null) widget.onClose(skip);
                      Navigator.of(context).pop();
                    },
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
