import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/dialog_widget.dart';

class BalanceActionDialog extends StatelessWidget {
  final bool isTransferIn;
  final String targetPlatform;
  final Function onConfirm;

  BalanceActionDialog({
    @required this.targetPlatform,
    @required this.isTransferIn,
    this.onConfirm,
  })  : assert(isTransferIn != null),
        assert(targetPlatform != null && targetPlatform.isNotEmpty);

  @override
  Widget build(BuildContext context) {
    String actionText = (isTransferIn)
        ? localeStr.balanceTransferInText
        : localeStr.balanceTransferOutText;
    return DialogWidget(
      heightFactor: 0.175,
      minHeight: 120,
      maxHeight: 180,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      localeStr.balanceTransferAlertTitle,
                      style: TextStyle(
                        fontSize: FontSize.MESSAGE.value,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      localeStr.balanceTransferAlertMsg(
                        actionText.toLowerCase(),
                        targetPlatform.toUpperCase(),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    child: Text(localeStr.btnCancel),
                    color: themeColor.pagerButtonColor,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(width: 12),
                  RaisedButton(
                    child: Text(actionText),
                    onPressed: () {
                      if (onConfirm != null) {
                        onConfirm();
                        Navigator.of(context).pop();
                      }
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
