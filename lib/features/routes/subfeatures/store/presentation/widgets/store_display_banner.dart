import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/cached_network_image.dart';
import '../../data/models/store_banner_model.dart';
import 'package:meta/meta.dart' show required;

/// Create a [Carousel] widget to display banner images
/// @author H.C.CHIANG
/// @version 2020/6/3
class StoreDisplayBanner extends StatefulWidget {
  final List<StoreBannerModel> images;

  StoreDisplayBanner({
    Key key,
    @required this.images,
  }) : super(key: key);

  @override
  _StoreDisplayBannerState createState() => _StoreDisplayBannerState();
}

class _StoreDisplayBannerState extends State<StoreDisplayBanner> {
  List<Widget> imageWidgets;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _createImageWidgets(),
        initialData: [],
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              imageWidgets.length > 0)
            return Carousel(
              boxFit: BoxFit.fill,
              images: imageWidgets,
              showIndicator: false,
//              dotSize: (imageWidgets.length > 1) ? 5.0 : 0.0,
//              dotSpacing: 16.0,
//              dotVerticalPadding: 4.0,
//              dotColor: themeColor.defaultWidgetColor,
//              dotIncreasedColor: themeColor.defaultAccentColor,
//              indicatorBgPadding: 4.0,
//              dotBgColor: Colors.transparent,
              borderRadius: false,
              autoplay: imageWidgets.length > 1,
              animationDuration: Duration(milliseconds: 1000),
              autoplayDuration: Duration(seconds: 8),
            );
          return SizedBox.shrink();
        });
  }

  Future<void> _createImageWidgets() async {
    imageWidgets = new List();
    await Future.forEach(
      widget.images,
      (banner) async => await networkImageWidget(banner.pic, fit: BoxFit.fill)
          .then((widget) => imageWidgets.add(widget)),
    ).whenComplete(() => print('store banner count: ${imageWidgets.length}'));
  }
}
