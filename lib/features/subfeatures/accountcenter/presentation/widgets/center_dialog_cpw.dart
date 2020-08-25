import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/dialog_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../state/center_store.dart';

class CenterDialogCpw extends StatelessWidget {
  final CenterStore store;

  CenterDialogCpw({this.store});

  static final GlobalKey<DialogWidgetState> _dialogKey =
      new GlobalKey(debugLabel: 'cpw');

  final String appUrl = (Global.device.isIos)
      ? 'https://www.gamewallet.asia/version.php?latest&fn=gp_a&dev=iphone'
      : 'https://www.gamewallet.asia/version.php?latest&fn=gp_a&dev=android';

  @override
  Widget build(BuildContext context) {
    print('CPW urls: ${store?.cpwUrl}');
    bool hasUrl =
        store != null && store.cpwUrl != null && store.cpwUrl.isNotEmpty;
    bool hasQr = hasUrl && store.cpwUrl.length >= 2;
    if (hasQr) print('qr code: ${store.cpwUrl[1].split('base64,')[1]}');
    return DialogWidget(
      key: _dialogKey,
      heightFactor: 0.35,
      minHeight: (Global.device.width > 360) ? 275 : 300,
      maxHeight: (Global.device.width > 360) ? 300 : 325,
      onClose: () => store.getAccount(),
//      debug: true,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 18.0, 32.0, 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      localeStr.centerDialogCpwLeftTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: (Global.device.width > 360)
                          ? const EdgeInsets.only(top: 16.0)
                          : const EdgeInsets.only(top: 36.0),
                      child: Container(
                        height: 120,
                        width: 120,
                        color: Colors.white,
                        child: QrImage(
                          data: appUrl,
                          version: QrVersions.auto,
                          size: 120.0,
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  localeStr.centerDialogCpwLeftHint,
                                  style: TextStyle(
                                    fontSize: FontSize.SMALL.value,
                                    color: Themes.defaultHintSubColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: SizedBox(
                            width: 128,
                            child: RaisedButton(
                              child: Text(localeStr.btnDownload),
                              onPressed: () async {
                                if (await canLaunch(appUrl)) {
                                  await launch(appUrl);
                                } else {
                                  callToast(localeStr.messageErrorLink(appUrl));
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: (hasQr)
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              localeStr.centerDialogCpwRightTitle,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                  child: Text(
                                localeStr.centerDialogCpwRightHint,
                                style: TextStyle(
                                  fontSize: FontSize.SMALL.value,
                                  color: Themes.hintHighlightDarkRed,
                                ),
                                textAlign: TextAlign.center,
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (hasQr)
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          height: 120,
                          width: 120,
                          color: Colors.white,
                          child: QrImage(
                            data: store.cpwUrl[1].split('base64,')[1],
                            version: QrVersions.auto,
                            size: 120.0,
                          ),
                        ),
                      ),
                    Padding(
                      padding: (hasQr)
                          ? const EdgeInsets.all(5.5)
                          : const EdgeInsets.fromLTRB(5.5, 2.0, 5.5, 5.5),
                      child: SizedBox(
                        width: 128,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: SizedBox(
                                height: 2,
                                child: ColoredBox(
                                  color: Themes.defaultWidgetColor,
                                ),
                              ),
                            ),
                            Text(localeStr.centerDialogCpwRightHint2),
                            Expanded(
                              child: SizedBox(
                                height: 2,
                                child: ColoredBox(
                                  color: Themes.defaultWidgetColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: SizedBox(
                        width: 128,
                        height: 36,
                        child: RaisedButton(
                          child: Text(localeStr.btnBind),
                          onPressed: () {
                            if (hasUrl) {
//                              RouterNavigate.navigateToPage(
//                                RoutePage.centerWeb,
//                                arg: WebRouteArguments(
//                                  startUrl: store.cpwUrl[0],
//                                ),
//                              );
                              callToastInfo(localeStr.workInProgress);
                            } else {
                              callToastError(
                                  localeStr.centerDialogCpwRightLinkError);
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
