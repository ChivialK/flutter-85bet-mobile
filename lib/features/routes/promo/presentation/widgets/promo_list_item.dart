import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/cached_network_image.dart';

import '../../data/models/promo_freezed.dart' show PromoEntity;
import 'promo_detail.dart';

/// View for [PromoEntity]
/// [promo] = view's data
class PromoListItem extends StatefulWidget {
  final PromoEntity promo;

  PromoListItem(this.promo);

  @override
  _PromoListItemState createState() => _PromoListItemState();
}

class _PromoListItemState extends State<PromoListItem>
    with AutomaticKeepAliveClientMixin {
  /// Need to use stateful widget to keep image future state, so
  /// it will behave properly when scroll up.
  Future<Widget> imageFuture;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    double screenScale = (Global.device.width / 360).ceilToDouble();
    imageFuture ??= networkImageWidget(
      widget.promo.bannerMobile,
      fit: BoxFit.fill,
      imgScale: 0.9 / screenScale,
    );
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 8.0, color: themeColor.defaultCardColor),
        borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
        color: themeColor.defaultCardColor,
      ),
      margin: const EdgeInsets.all(6.0),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            /* Promo Image */
            FutureBuilder(
              future: imageFuture,
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    !snapshot.hasError) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: snapshot.data,
                  );
                } else if (snapshot.hasError) {
                  MyLogger.warn(
                      msg: 'network image builder error: ${snapshot.error}',
                      error: snapshot.error);
                  return Icon(Icons.broken_image,
                      color: themeColor.iconSubColor1);
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
            /* Promo Text*/
            Padding(
              padding: const EdgeInsets.only(top: 6.0, bottom: 2.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      widget.promo.name,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  GestureDetector(
                    child: Text(localeStr.promoDetailText),
                    onTap: () {
                      debugPrint('clicked promo: ${widget.promo.name}');
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => new PromoDetail(widget.promo));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
