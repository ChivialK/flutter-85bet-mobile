import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/network/handler/request_code_model.dart';
import 'package:flutter_85bet_mobile/core/network/handler/request_status_model.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/dialog_widget.dart';

import '../../data/models/store_product_model.dart';
import '../state/point_store.dart';
import 'store_product_detail.dart';
import 'store_product_exchange.dart';

enum _ContentEnum { DETAIL, EXCHANGE, RESULT }

class StoreProductDialog extends StatefulWidget {
  final PointStore store;
  final StoreProductModel product;
  final int memberPoints;

  StoreProductDialog({
    @required this.store,
    @required this.product,
    @required this.memberPoints,
  });

  @override
  _StoreProductDialogState createState() => _StoreProductDialogState();
}

class _StoreProductDialogState extends State<StoreProductDialog> {
  List<ReactionDisposer> _disposers;
  CancelFunc toastDismiss;

  double dialogWidth;
  double dialogHeight;
  double imageSize;

  _ContentEnum _contentEnum;
  String dialogTitle;

  void updateView(_ContentEnum type) {
    if (type != null && _contentEnum != type)
      _contentEnum = type;
    else
      return;
    print('update to dialog type: $type');
    switch (_contentEnum) {
      case _ContentEnum.DETAIL:
        dialogHeight = 528;
        if (dialogHeight > Global.device.height * 0.85) {
          dialogHeight = (Global.device.height * 0.85).roundToDouble();
        }
        dialogTitle = localeStr.storeProductWindowTitle;
        break;
      case _ContentEnum.EXCHANGE:
        dialogHeight = (Global.device.height * 0.85).roundToDouble();
        dialogTitle = localeStr.storeRequestWindowTitle;
        break;
      case _ContentEnum.RESULT:
        dialogHeight = 240;
        dialogTitle = localeStr.storeExchangeResultWindowTitleSuccess;
        break;
    }
  }

  @override
  void initState() {
    dialogWidth = (Global.device.width > 400) ? 376 : Global.device.width - 24;
    imageSize = (dialogWidth - 96 > 216) ? 216 : dialogWidth - 96;
    updateView(_ContentEnum.DETAIL);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('store dialog changed');
    super.didChangeDependencies();
    _disposers ??= [
      /* Reaction on wait exchange change */
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => widget.store.waitForExchange,
        // Run some logic with the content of the observed field
        (bool wait) {
          if (wait) {
            toastDismiss = callToastLoading();
          } else if (toastDismiss != null) {
            toastDismiss();
            toastDismiss = null;
          }
        },
      ),
      /* Reaction on exchange result change */
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => widget.store.exchangeResult,
        // Run some logic with the content of the observed field
        (result) {
          print('store exchange result: $result');
          if (result == null) return;
          if (result is RequestStatusModel || result is RequestCodeModel) {
            if (result.isSuccess) {
              updateView(_ContentEnum.RESULT);
              setState(() {});
            } else {
              callToastError(localeStr.storeExchangeResultError);
            }
          } else {
            callToastError(localeStr.messageErrorInternal);
          }
        },
      ),
    ];
  }

  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DialogWidget(
      constraints: BoxConstraints(
        maxWidth: dialogWidth,
        maxHeight: dialogHeight,
      ),
      widthShrink: 24.0,
      roundParam: 8.0,
      customBg: themeColor.storeDialogBackground,
      children: <Widget>[
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 4.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    dialogTitle,
                    style: TextStyle(
                      fontSize: FontSize.MESSAGE.value,
                      fontWeight: FontWeight.bold,
                      color: themeColor.dialogTitleColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
              child: Divider(height: 2.0, thickness: 2.0),
            ),
            SizedBox(
              height: dialogHeight - 80.0,
              width: dialogWidth,
              child: ListView(
                primary: true,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  if (_contentEnum != _ContentEnum.RESULT)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 12.0),
                          constraints: BoxConstraints.tight(
                              Size(imageSize - 8.0, imageSize + 4.0)),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: themeColor.storeProductBorderColor,
                                  width: 5.0),
                            ),
                            child: Stack(
                              children: <Widget>[
                                Center(
                                  child: networkImageBuilder(
                                    widget.product.picUrl,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                // if (widget.product.isNewProduct)
                                //   Container(
                                //     margin: EdgeInsets.only(
                                //       left: 10.0,
                                //       top: 5.0,
                                //     ),
                                //     alignment: Alignment.topLeft,
                                //     child: Image.asset(
                                //       Res.storeProductNewIcon,
                                //       alignment: Alignment.topLeft,
                                //       fit: BoxFit.none,
                                //     ),
                                //   ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (_contentEnum != _ContentEnum.RESULT)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            widget.product.productName,
                            style: TextStyle(
                              fontSize: FontSize.TITLE.value,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                  /// Product Detail Content UI
                  if (_contentEnum == _ContentEnum.DETAIL)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StoreProductDetail(
                            product: widget.product,
                            canExchange:
                                widget.memberPoints >= widget.product.point,
                            maxWidth: dialogWidth,
                            imageSize: imageSize,
                            onExchange: () {
                              if (widget.store.waitForExchange) {
                                callToast(localeStr.messageWait);
                                return;
                              }
                              updateView(_ContentEnum.EXCHANGE);
                              setState(() {});
                            }),
                      ],
                    ),

                  /// Exchange Product Content UI
                  if (_contentEnum == _ContentEnum.EXCHANGE)
                    StoreProductExchange(
                      store: widget.store,
                      product: widget.product,
                      memberPoints: widget.memberPoints,
                      maxWidth: dialogWidth,
                    ),

                  /// Exchange Result Content UI
                  if (_contentEnum == _ContentEnum.RESULT)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            localeStr.storeExchangeResultWindowHint,
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
                                    text: localeStr
                                        .storeExchangeResultWindowHintItem1,
                                    style: TextStyle(
                                      color: themeColor.defaultTextColor,
                                      fontSize: FontSize.SUBTITLE.value,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '${widget.product.productName}',
                                    style: TextStyle(
                                      color: themeColor.storeHighlightTextColor,
                                      fontSize: FontSize.SUBTITLE.value,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: localeStr
                                        .storeExchangeResultWindowHintItem2,
                                    style: TextStyle(
                                      color: themeColor.defaultTextColor,
                                      fontSize: FontSize.SUBTITLE.value,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Expanded(
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(36.0),
                                  ),
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text(localeStr.btnConfirm),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
