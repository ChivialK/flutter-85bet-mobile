import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/cached_network_image.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/marquee_span_widget.dart';
import 'package:flutter_85bet_mobile/utils/regex_util.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/entity/marquee_entity.dart';

typedef OnMarqueeClicked = void Function(String);

class HomeDisplayMarquee extends StatelessWidget {
  final List<MarqueeEntity> marquees;
  final OnMarqueeClicked onMarqueeClicked;

  HomeDisplayMarquee({this.marquees, this.onMarqueeClicked});

  @override
  Widget build(BuildContext context) {
    if (marquees == null || marquees.isEmpty) return SizedBox.shrink();
    return Container(
      constraints: BoxConstraints.tight(
        Size(Global.device.width - 20.0, 30),
      ),
      color: themeColor.defaultMarqueeBarColor,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      padding: const EdgeInsets.fromLTRB(6.0, 3.0, 6.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: networkImageBuilder('images/marquee_Color1.png'),
          ),
          Expanded(
            child: MarqueeSpan(
              texts: marquees
                  .map((e) => e.content.replaceAll('\n', '\t'))
                  .toList(),
              spaceBetweenTexts: 60,
              style: TextStyle(
                fontSize: FontSize.NORMAL.value,
                color: themeColor.defaultMarqueeTextColor,
              ),
              startAfter: Duration(milliseconds: 1500),
              callback: (index) {
                // debugPrint('tapped marquee index: $index, data: ${marquees[index]}');
                if (marquees[index].url.isUrl && onMarqueeClicked != null) {
                  String url = marquees[index].url;
                  debugPrint('clicked marquee $index, url: $url');
                  if (url.contains(Global.DOMAIN_NAME) || !url.isUrl) {
                    if (onMarqueeClicked != null) {
                      onMarqueeClicked(url);
                    }
                  } else if (url.isUrl) {
                    launch(url);
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
