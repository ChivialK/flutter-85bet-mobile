import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/themes/font_size.dart';
import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/dialog_widget.dart';

class NetworkChangedDialog extends StatelessWidget {
  final Function onRefreshClick;
  final Function onClose;

  NetworkChangedDialog({this.onRefreshClick, this.onClose});

  @override
  Widget build(BuildContext context) {
    return DialogWidget(
      heightFactor: 0.3,
      minHeight: 150,
      maxHeight: 156,
      onClose: () => onClose,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 36.0, 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      localeStr.networkChangedHint,
                      style: TextStyle(
                          height: 1.4, fontSize: FontSize.SUBTITLE.value),
                      maxLines: 4,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18.0, bottom: 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: RaisedButton(
                      child: Text(localeStr.btnRefresh),
                      onPressed: () {
                        onRefreshClick();
                        Future.delayed(Duration(milliseconds: 100), () {
                          Navigator.of(context).pop();
                          onClose();
                        });
                      },
                    ),
                  ),
                  RaisedButton(
                      child: Text(localeStr.btnClose),
                      onPressed: () {
                        Future.delayed(Duration(milliseconds: 100), () {
                          Navigator.of(context).pop();
                          onClose();
                        });
                      }),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
