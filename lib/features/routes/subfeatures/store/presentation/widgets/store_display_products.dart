import 'package:after_layout/after_layout.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/res.dart';

import '../../data/models/store_product_model.dart';
import '../state/point_store.dart';
import 'point_store_inherit_widget.dart';
import 'store_product_dialog.dart';

class StoreDisplayProducts extends StatefulWidget {
  @override
  _StoreDisplayProductsState createState() => _StoreDisplayProductsState();
}

class _StoreDisplayProductsState extends State<StoreDisplayProducts>
    with AfterLayoutMixin {
  PointStore _store;
  List<StoreProductModel> products;
  Widget _pointWidget;

  final double _itemExtent = 240;
  final double _itemSpace = 12.0;
  final double _gridRatio = 0.5;

  @override
  Widget build(BuildContext context) {
    _store ??= PointStoreInheritedWidget.of(context).store;
    _pointWidget ??= PointStoreInheritedWidget.of(context).pointWidget;
    if (_store == null) {
      return Center(
        child: WarningDisplay(
          message:
              Failure.internal(FailureCode(type: FailureType.STORE)).message,
        ),
      );
    }

    products ??= _store.products;
    if (products == null || products.isEmpty) return SizedBox.shrink();

    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          child: _pointWidget,
        ),
        Divider(
            height: 4.0,
            thickness: 2.0,
            color: themeColor.defaultWidgetBgColor),
        Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: _itemExtent,
              crossAxisSpacing: _itemSpace,
              mainAxisSpacing: _itemSpace,
              childAspectRatio: _gridRatio,
            ),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (_, index) {
              StoreProductModel product = products[index];
              return Container(
                decoration: BoxDecoration(
                    border: Border.all(color: themeColor.storeProductBgColor)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: networkImageBuilder(
                              product.picUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
                          if (product.isNewProduct)
                            Image.asset(
                              Res.new_product,
                              alignment: Alignment.topLeft,
                              fit: BoxFit.none,
                            ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        child: Text(
                          product.productName,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: FontSize.TITLE.value),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2.0, top: 8.0),
                        child: Text(
                          localeStr.storeTextItemHint,
                          style: TextStyle(color: themeColor.defaultHintColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          localeStr.storeTextItemPoint(
                              '${formatAsCreditNum(product.point)} '),
                          style: TextStyle(
                              color: themeColor.storeHighlightTextColor,
                              fontSize: FontSize.MESSAGE.value,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 6.0),
                        child: FlatButton(
                          visualDensity:
                              VisualDensity(horizontal: 3.0, vertical: -2.0),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: themeColor.storeButtonColor, width: 2.0),
                            borderRadius: new BorderRadius.circular(6.0),
                          ),
                          onPressed: () => showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) => new StoreProductDialog(
                              store: _store,
                              product: product,
                              memberPoints: _store.memberPoints,
                            ),
                          ),
                          child: AutoSizeText.rich(
                            TextSpan(
                              text: localeStr.storeTextItemButton,
                            ),
                            style: TextStyle(
                              color: themeColor.storeButtonColor,
                              fontWeight: FontWeight.bold,
                              fontSize: FontSize.SUBTITLE.value,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            minFontSize: FontSize.SMALLER.value,
                            maxFontSize: FontSize.MESSAGE.value,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    if (_store != null && _store.navProductId != null) {
      final product = products.singleWhere(
          (item) => item.productId == _store.navProductId,
          orElse: () => null);
      if (product != null) {
        _store.navProductId = null;
        Future.delayed(Duration(milliseconds: 500), () {
          if (mounted) {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) => new StoreProductDialog(
                store: _store,
                product: product,
                memberPoints: _store.memberPoints,
              ),
            );
          }
        });
      }
    }
  }
}
