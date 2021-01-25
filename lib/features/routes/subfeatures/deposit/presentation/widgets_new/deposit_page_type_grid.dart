import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/deposit/data/model/payment_type.dart';
import 'package:flutter_85bet_mobile/features/themes/theme_settings.dart';

typedef OnSelectPaymentType = void Function(PaymentType);

class DepositPageTypeGrid extends StatelessWidget {
  final List<PaymentType> types;
  final OnSelectPaymentType onSelect;

  const DepositPageTypeGrid({
    @required this.types,
    @required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (Global.device.widthScale < 1)
              ? Global.device.widthScale
              : (Global.device.widthScale < 1.3)
                  ? 1.15 * Global.device.widthScale
                  : 1.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: types.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () => onSelect(types[index]),
            child: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    themeColor.homeTabBgColor,
                    themeColor.homeTabLinearColor2,
                    themeColor.homeTabBgColor,
                  ],
                  stops: [0.1, 0.5, 1.0],
                  tileMode: TileMode.clamp,
                ),
                boxShadow: ThemeInterface.layerShadow,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Container(
                          margin: const EdgeInsets.all(4.0),
                          padding: const EdgeInsets.all(16.0),
                          decoration: ThemeInterface.pageIconContainerDecor,
                          child: FittedBox(
                            child: Icon(types[index].icon),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: SizedBox(
                        height: FontSize.NORMAL.value * 2.75,
                        child: Text(
                          types[index].label,
                          style: TextStyle(
                            fontSize: FontSize.NORMAL.value,
                            color: themeColor.defaultTextColor,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
