import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/general/enum/toast_duration.dart';

/// Show error toast as child widget
///@author H.C.CHIANG
///@version 2020/7/29
void callToastError(
  String message, {
  ToastDuration duration = ToastDuration.DEFAULT,
  int delayedMilli = 100,
}) {
  Future.delayed(Duration(milliseconds: delayedMilli), () {
    BotToast.showCustomText(
        clickClose: true,
        ignoreContentClick: true,
        backButtonBehavior: BackButtonBehavior.none,
        duration: duration.value,
        backgroundColor: Colors.transparent,
        align: Alignment.center,
        toastBuilder: (_) => _ErrorWidget(message: message));
  });
}

class ToastErrorWidget extends StatelessWidget {
  final String message;
  final ToastDuration duration;

  ToastErrorWidget({
    @required this.message,
    this.duration = ToastDuration.DEFAULT,
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 100), () {
      BotToast.showCustomText(
          clickClose: true,
          ignoreContentClick: true,
          backButtonBehavior: BackButtonBehavior.none,
          duration: duration.value,
          backgroundColor: Colors.transparent,
          align: Alignment.center,
          toastBuilder: (_) => _ErrorWidget(message: message));
    });
    return SizedBox.shrink();
  }
}

class _ErrorWidget extends StatelessWidget {
  final String message;

  const _ErrorWidget({@required this.message});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black54,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                constraints: BoxConstraints.tight(Size(48.0, 48.0)),
                margin: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.0),
                ),
                child: Icon(Icons.close, color: Colors.white, size: 42.0)),
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Text(message,
                  style: TextStyle(fontSize: 16.0, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
