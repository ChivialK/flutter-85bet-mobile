import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_carousel.dart';
import 'package:flutter_85bet_mobile/utils/regex_util.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/entity/banner_entity.dart';

typedef OnBannerClicked = void Function(String);

///
/// Create a [Carousel] widget to display banner images
/// @author H.C.CHIANG
/// @version 2020/6/18
///
class HomeDisplayBanner extends StatelessWidget {
  final List<BannerEntity> banners;
  final OnBannerClicked onBannerClicked;

  HomeDisplayBanner({this.banners, @required this.onBannerClicked});

  @override
  Widget build(BuildContext context) {
    if (banners != null && banners.isNotEmpty) {
      return _buildCarousel();
    } else {
      return Container(
        color: themeColor.defaultBackgroundColor,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(bottom: 34.0),
        child: WarningDisplay(
          message:
              (banners == null) ? localeStr.messageErrorNoServerConnection : '',
          widthFactor: 1,
          largerText: true,
          highlight: banners == null,
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
      showIndicator: false,
//      dotSize: 3.0,
//      dotSpacing: 16.0,
//      dotColor: themeColor.defaultAccentColor,
//      indicatorBgPadding: 4.0,
//      dotBgColor: Colors.white12,
      borderRadius: false,
      animationDuration: Duration(milliseconds: 2000),
      autoplayDuration: Duration(seconds: 10),
      jumpOnEndPage: true,
      onImageTap: (index) {
        String url = bannerUrls[index];
        debugPrint('clicked image $index, url: $url');
        if (url.contains(Global.DOMAIN_NAME) || !url.isUrl) {
          if (onBannerClicked != null) {
            onBannerClicked(url);
          }
        } else if (url.isUrl) {
          launch(url);
        }
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
