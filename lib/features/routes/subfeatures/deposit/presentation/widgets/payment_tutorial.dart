import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/entity/payment_enum_data.dart';

class PaymentTutorial extends StatelessWidget {
  final List tutorialData;

  PaymentTutorial({this.tutorialData});

  final double dialogHeight = Global.device.height * 0.85;
  // screen width - dialog padding
  final double dialogWidth = Global.device.width - 32;
  // screen width - dialog padding - stack padding - text padding
  final double contentWidth = Global.device.width - 32 - 20 - 8;

  @override
  Widget build(BuildContext context) {
    Duration insetAnimationDuration = const Duration(milliseconds: 100);
    Curve insetAnimationCurve = Curves.decelerate;

    String title = tutorialData[0] ?? localeStr.depositPaymentTitleTutorial;
    List<PaymentTutorialItem> tutorialItems = tutorialData[1];
    debugPrint('tutorial items: ${tutorialItems.length}');

    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets +
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      duration: insetAnimationDuration,
      curve: insetAnimationCurve,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Center(
          child: Material(
            // round corner view
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
            ),
            color: themeColor.dialogBgColor,
            child: Container(
              constraints: BoxConstraints(
                minWidth: dialogWidth,
                maxWidth: dialogWidth,
                minHeight: dialogHeight / 4,
                maxHeight: dialogHeight,
              ),
              child: IntrinsicHeight(
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 10.0, 12.0, 8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                                Text(
                                  title,
                                  style: TextStyle(
                                    fontSize: FontSize.TITLE.value,
                                    color: themeColor.dialogTitleColor,
                                  ),
                                ),
                                SizedBox(height: 6.0),
                              ] +
                              _buildTutorial(context, tutorialItems),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 2.0,
                      child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTutorial(
    BuildContext context,
    List<PaymentTutorialItem> tutorialItems,
  ) {
    List<Widget> list = new List();
    tutorialItems.forEach((item) {
      switch (item.type) {
        case TutorialItemType.Desc:
          list.add(Padding(
            padding: const EdgeInsets.fromLTRB(4.0, 20.0, 4.0, 12.0),
            child: Text(
              item.value,
              maxLines: 5,
              overflow: TextOverflow.visible,
            ),
          ));
          break;
        case TutorialItemType.Image:
          list.add(Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
            child: networkImageBuilder(item.value, fit: BoxFit.fill),
          ));
          break;
        case TutorialItemType.Button:
          list.add(Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: SizedBox(
              height: Global.device.comfortButtonHeight,
              child: RaisedButton(
                child: Text(item.value),
                visualDensity: VisualDensity.standard,
                onPressed: () async {
                  switch (item.sortId) {
                    case 81:
                      await launch(
                          'https://www.gamewallet.asia/version.php?fn=gp_a&latest');
//                RouterNavigate.navigateToPage(
//                  RoutePage.depositWeb,
//                  arg: 'https://www.gamewallet.asia/version.php?fn=gp_a&latest',
//                );
//                Navigator.of(context).pop();
                      break;
                    case 82:
                      await launch('https://www.vip66729.com/pdf/cpw.pdf');
                      break;
                  }
                },
              ),
            ),
          ));
          break;
      }
    });
    return list;
  }
}
