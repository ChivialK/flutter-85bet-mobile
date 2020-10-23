import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_carousel.dart';

import '../../data/entity/banner_entity.dart';

typedef OnBannerClicked = void Function(bool, String);

///
/// Create a [Carousel] widget to display banner images
/// @author H.C.CHIANG
/// @version 2020/6/18
///
class HomeDisplayBanner extends StatelessWidget {
  final List<BannerEntity> banners;
  final OnBannerClicked onBannerClicked;

  HomeDisplayBanner({this.banners, this.onBannerClicked});

  @override
  Widget build(BuildContext context) {
    if (banners != null && banners.isNotEmpty) {
      return _buildCarousel();
    } else {
      return Container(
        color: Themes.defaultBackgroundColor,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(bottom: 34.0),
        child: WarningDisplay(
          message: localeStr.messageErrorNoServerConnection,
          widthFactor: 1,
          largerText: true,
          highlight: true,
        ),
      );
    }
  }

  Widget _buildCarousel() {
    List<String> bannerUrls = _listBannerUrls();
    return CustomizeCarousel(
      boxFit: BoxFit.fill,
      images: banners
          .map((banner) => networkImageBuilder(
                banner.pic,
                fit: BoxFit.fill,
              ))
          .toList(),
      showIndicator: true,
      indicatorSize: 48.0,
      indicatorColor: Themes.defaultMarqueeBarColor,
      indicatorPadding: const EdgeInsets.only(bottom: 12.0),
      animationDuration: Duration(milliseconds: 1000),
      autoplayDuration: Duration(seconds: 6),
      jumpOnEndPage: true,
      onImageTap: (index) {
        var url = bannerUrls[index];
        debugPrint('clicked image $index, url: $url');
        if (onBannerClicked != null)
          onBannerClicked(
              url.contains('/api/open/'), url.replaceAll('/api/open/', ''));
      },
    );
  }

  List<String> _listBannerUrls() {
    try {
      return banners.map((data) {
        return data.promoUrl;
      }).toList();
    } on Exception catch (e) {
      MyLogger.error(
        msg: 'map banners jump url has exception: $e',
        tag: 'HomeBannerDisplay',
      );
      return [];
    }
  }
}
