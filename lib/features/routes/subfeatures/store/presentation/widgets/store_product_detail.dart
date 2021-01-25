import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';

import '../../data/models/store_product_model.dart';

class StoreProductDetail extends StatelessWidget {
  final StoreProductModel product;
  final bool canExchange;
  final double maxWidth;
  final double imageSize;
  final Function onExchange;

  StoreProductDetail({
    @required this.product,
    @required this.canExchange,
    @required this.maxWidth,
    @required this.imageSize,
    @required this.onExchange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
            constraints: BoxConstraints.tight(
                Size(imageSize + 24, Global.device.comfortButtonHeight + 8.0)),
            decoration: BoxDecoration(
              border:
                  Border.all(width: 1.0, color: themeColor.defaultDividerColor),
              borderRadius: const BorderRadius.all(const Radius.circular(36.0)),
            ),
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: localeStr.storeProductWindowTextRemain + '   ',
                    style: TextStyle(
                      color: themeColor.storeDialogSpanText,
                      fontSize: FontSize.SUBTITLE.value,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '${product.remain}',
                    style: TextStyle(
                      color: themeColor.storeHighlightTextColor,
                      fontSize: FontSize.SUBTITLE.value,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Divider(
            height: 1.0,
            color: themeColor.defaultDividerColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Text(
            localeStr.storeTextItemHint,
            style: TextStyle(
              fontSize: FontSize.SUBTITLE.value,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: localeStr.storeProductWindowHint2,
                    style: TextStyle(
                      fontSize: FontSize.SUBTITLE.value,
                      color: themeColor.storeDialogSpanText,
                    ),
                  ),
                  TextSpan(
                    text: '${product.point}',
                    style: TextStyle(
                      color: themeColor.storeHighlightTextColor,
                      fontSize: FontSize.SUBTITLE.value,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: localeStr.storeProductWindowHint3,
                    style: TextStyle(
                      color: themeColor.storeDialogSpanText,
                      fontSize: FontSize.SUBTITLE.value,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
          child: FlatButton(
            visualDensity: const VisualDensity(horizontal: 3.0, vertical: -2.0),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: themeColor.storeButtonColor, width: 2.0),
              borderRadius: new BorderRadius.circular(6.0),
            ),
            disabledColor: themeColor.defaultHintColor,
            child: RichText(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text: (canExchange)
                    ? localeStr.storeTextItemButton
                    : localeStr.storeTextItemButtonDisabled,
                style: TextStyle(
                    fontSize: FontSize.SUBTITLE.value,
                    color: themeColor.storeButtonColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            onPressed: (!canExchange) ? null : () => onExchange(),
          ),
        ),
      ],
    );
  }
}
