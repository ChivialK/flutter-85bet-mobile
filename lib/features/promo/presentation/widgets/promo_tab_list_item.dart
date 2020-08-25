import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/cached_network_image.dart';

import '../../data/models/promo_freezed.dart' show PromoEntity;

/// View for [PromoEntity]
/// [promo] = view's data
class PromoTabListItem extends StatelessWidget {
  final PromoEntity promo;
  final Function onShowDetail;

  PromoTabListItem(this.promo, this.onShowDetail);

  @override
  Widget build(BuildContext context) {
    double screenScale = (Global.device.width / 360).ceilToDouble();
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 8.0, color: Themes.defaultCardColor),
        borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
        color: Themes.defaultCardColor,
      ),
      margin: const EdgeInsets.all(6.0),
      child: Container(
        color: Color(0xfff1f1f1),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            /* Promo Image */
            networkImageBuilder(
              promo.bannerMobile,
              fit: BoxFit.fill,
              imgScale: 0.9 / screenScale,
              roundCorner: true,
            ),
            /* Promo Text*/
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      promo.name,
                      style: TextStyle(
                        fontSize: FontSize.SUBTITLE.value,
                        color: Themes.dialogTitleColor,
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
                        debugPrint('clicked promo: ${promo.name}');
                        onShowDetail(promo);
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
