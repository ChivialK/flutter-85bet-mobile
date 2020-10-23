import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import 'package:flutter/widgets.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/cached_network_image.dart';
import 'package:flutter_85bet_mobile/res.dart';

import '../../data/model/service_model.dart';

enum _ButtonType { OPEN, COPY }

class ServiceDisplay extends StatelessWidget {
  final ServiceModel data;

  ServiceDisplay(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: Global.device.featureContentHeight,
        maxWidth: Global.device.width,
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Res.wallpaper), fit: BoxFit.fill)),
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
      child: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 6.0),
                  child: Container(
                      height: 24.0,
                      width: 6.0,
                      color: Themes.defaultPrimaryColor)),
              Text(localeStr.serviceRouteHint,
                  style: TextStyle(
                      fontSize: FontSize.MESSAGE.value,
                      color: Themes.defaultTextColor)),
            ],
          ),
          _buildBox(
              iconData: const IconData(0xe968, fontFamily: 'IconMoon'),
              title: localeStr.serviceTitleCustomerService,
              content: localeStr.serviceDescCustomerService,
              data: data.cs,
              buttonType: _ButtonType.OPEN),
          _buildBox(
              iconData: const IconData(0xe969, fontFamily: 'IconMoon'),
              title: localeStr.serviceTitleEmail,
              content: data.mail,
              data: data.mail,
              buttonType: _ButtonType.COPY),
          _buildBox(
              iconData: const IconData(0xf075, fontFamily: 'FontAwesome'),
              title: localeStr.serviceTitleZalo,
              content: data.zalo,
              data: data.zalo,
              buttonType: _ButtonType.COPY),
          _buildBox(
              iconData: const IconData(0xf082, fontFamily: 'FontAwesome'),
              title: localeStr.serviceTitleFacebook,
              content: data.fb,
              data: data.fb,
              buttonType: _ButtonType.COPY),
          _buildBox(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text('Zalo QRCODE',
                          style: TextStyle(
                              fontSize: FontSize.MESSAGE.value,
                              color: Themes.defaultTextColor)),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: networkImageBuilder(data.zaloPic)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text('App QRCODE',
                          style: TextStyle(
                              fontSize: FontSize.MESSAGE.value,
                              color: Themes.defaultTextColor)),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: networkImageBuilder(data.appPic)),
                    ],
                  ),
                ),
              ],
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              child: Text(localeStr.serviceButtonContact,
                  style: TextStyle(fontSize: FontSize.MESSAGE.value)),
              onPressed: () {
                RouterNavigate.navigateToPage(RoutePage.serviceWeb,
                    arg: WebRouteArguments(startUrl: data.cs, hideBars: true));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBox(
      {IconData iconData,
      String title,
      String content,
      String data,
      _ButtonType buttonType,
      Widget child}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Themes.defaultLayerBackgroundColor,
            borderRadius: BorderRadius.circular(8.0)),
        padding: const EdgeInsets.all(12.0),
        child: child ??
            Row(
              children: [
                Icon(iconData, color: Themes.defaultBorderColor, size: 30),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                        height: 42.0,
                        width: 1.0,
                        color: Themes.navigationColorFocus)),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(title),
                      Text(content),
                    ],
                  ),
                ),
                RaisedButton(
                  color: Themes.defaultLayerBackgroundColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Themes.defaultMarqueeBarColor),
                    borderRadius: new BorderRadius.circular(4.0),
                  ),
                  child: RichText(
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: (buttonType == _ButtonType.OPEN)
                          ? localeStr.btnGo
                          : localeStr.btnCopy,
                      style: TextStyle(
                        fontSize: (Global.lang == 'vi')
                            ? FontSize.SUBTITLE.value
                            : FontSize.MESSAGE.value,
                        color: Themes.defaultMarqueeBarColor,
                      ),
                    ),
                  ),
                  onPressed: () {
                    debugPrint('button: $title, data: $data');
                    if (buttonType == _ButtonType.COPY) {
                      Clipboard.setData(new ClipboardData(text: data))
                          .whenComplete(() => callToast(localeStr.messageCopy));
                    } else {
                      RouterNavigate.navigateToPage(RoutePage.serviceWeb,
                          arg: WebRouteArguments(
                              startUrl: data, hideBars: true));
                    }
                  },
                )
              ],
            ),
      ),
    );
  }
}
