import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/cached_network_image.dart';

import '../../data/models/promo_freezed.dart' show PromoEntity;

/// View for [PromoEntity]
/// [promo] = view's data
class PromoTabListItem extends StatefulWidget {
  final PromoEntity promo;
  final Function onShowDetail;

  PromoTabListItem(this.promo, this.onShowDetail);

  @override
  _PromoTabListItemState createState() => _PromoTabListItemState();
}

class _PromoTabListItemState extends State<PromoTabListItem>
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
      color: themeColor.defaultCardColor,
      margin: const EdgeInsets.all(6.0),
      child: Container(
        color: Color(0xffeaeaea),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            /* Promo Image */
            FutureBuilder(
              future: imageFuture,
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    !snapshot.hasError) {
                  return snapshot.data;
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
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      widget.promo.name,
                      style: TextStyle(
                        fontSize: FontSize.SUBTITLE.value,
                        color: themeColor.defaultTextColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: RaisedButton(
                      child: Text(localeStr.promoDetailText),
                      visualDensity: VisualDensity(horizontal: 3.0),
                      onPressed: () {
                        debugPrint('clicked promo: ${widget.promo.name}');
                        widget.onShowDetail(widget.promo);
                      },
                    ),
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
