import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/cached_network_image.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/gradient_button.dart';

final RegExp _uriImageRegex = RegExp("data:image\/?(jpeg|jpg|png);base64");

final RegExp _urlImageRegex =
    RegExp("^(?:(http(s):\/\/).*\/images\/).*(?:(jpg|jpeg|png|gif))");

class PageQrDepositCode extends StatelessWidget {
  final String qrCode;
  final Function onNextStep;

  const PageQrDepositCode({
    @required this.qrCode,
    @required this.onNextStep,
  });

  @override
  Widget build(BuildContext context) {
    List<String> uriParts = qrCode.split(',');
    bool isImageUri = _uriImageRegex.hasMatch(uriParts.first);

    bool isImageUrl = _urlImageRegex.hasMatch(qrCode);
    debugPrint('uri: $isImageUri, url: $isImageUrl');

    Uint8List _bytes;
    if (isImageUri) {
      String uri = uriParts.reduce((a, b) => a.length > b.length ? a : b);
      _bytes = base64.decode(uri);
    }
    // debugPrint('uri image bytes: $_bytes');

    if (!isImageUri && !isImageUrl) {
      return Container(
        height: 100,
        child: Center(
          child: Icon(
            Icons.broken_image,
            color: themeColor.defaultTextColor,
          ),
        ),
      );
    }
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8.0),
          child:
              (isImageUri) ? Image.memory(_bytes) : networkImageBuilder(qrCode),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: GradientButton(
            expand: true,
            cornerRadius: 0,
            height: Global.device.comfortButtonHeight * 0.85,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    localeStr.btnNextStep,
                    style: TextStyle(
                      fontSize: FontSize.SUBTITLE.value,
                      color: themeColor.defaultTextColor,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_right_sharp,
                  color: themeColor.defaultTextColor,
                ),
              ],
            ),
            onPressed: onNextStep,
          ),
        ),
      ],
    );
  }
}
