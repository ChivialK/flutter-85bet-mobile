import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:flutter_85bet_mobile/core/internal/themes.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/cached_network_image.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/dialog_widget.dart';
import 'package:flutter_85bet_mobile/features/user/data/models/event_model.dart';
import 'package:flutter_85bet_mobile/res.dart';

class EventDialogSigned extends StatelessWidget {
  final EventData event;
  final int signCount;
  final Function onDialogClose;

  EventDialogSigned({this.event, this.signCount, this.onDialogClose});

  @override
  Widget build(BuildContext context) {
    double dialogWidth =
        (Global.device.width >= 320) ? 228 : Global.device.width - 92;
    return DialogWidget(
      noBackground: true,
      canClose: false,
      constraints: BoxConstraints(
        maxHeight: 316,
        maxWidth: dialogWidth + 60,
      ),
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          margin: const EdgeInsets.only(bottom: 64.0, left: 30.0, right: 30.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: networkImageBuilder(event.pic),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: HexColor.fromHex('#6dc854'),
                          size: 28.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            localeStr.eventButtonSignUpSuccess,
                            style: TextStyle(
                              color: HexColor.fromHex('#6dc854'),
                              fontSize: FontSize.HEADER.value,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 12.0),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: localeStr.eventSignUpHint1,
                            style: TextStyle(
                              color: Themes.secondaryTextColor2,
                              fontSize: FontSize.SUBTITLE.value,
                            ),
                          ),
                          TextSpan(
                            text: ' $signCount ',
                            style: TextStyle(
                              color: HexColor.fromHex('#ff7eb8'),
                              fontSize: FontSize.MESSAGE.value,
                            ),
                          ),
                          TextSpan(
                            text: localeStr.eventSignUpHint2,
                            style: TextStyle(
                              color: Themes.secondaryTextColor2,
                              fontSize: FontSize.SUBTITLE.value,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, bottom: 6.0),
          child: Image.asset(
            Res.eventMoneyForeground,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          bottom: 0,
          left: (dialogWidth + 60) / 2 - 25,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints.tight(Size(50.0, 50.0)),
                margin: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.0),
                ),
                child: IconButton(
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 48.0,
                  ),
                  onPressed: () {
                    onDialogClose();
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
