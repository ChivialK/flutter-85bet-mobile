import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/general/enum/toast_duration.dart';

void callToastInfo(
  String message, {
  IconData icon,
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
        toastBuilder: (_) => _InfoWidget(message: message, icon: icon));
  });
}

/// Show info toast as child widget
///@author H.C.CHIANG
///@version 2020/7/29
class ToastInfoWidget extends StatelessWidget {
  final String message;
  final IconData icon;
  final ToastDuration duration;

  ToastInfoWidget({
    @required this.message,
    this.icon,
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
          toastBuilder: (_) => _InfoWidget(message: message, icon: icon));
    });
    return SizedBox.shrink();
  }
}

class _InfoWidget extends StatelessWidget {
  final String message;
  final IconData icon;

  const _InfoWidget({@required this.message, this.icon});

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
            Icon(icon ?? Icons.info_outline, color: Colors.white, size: 52.0),
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Text(
                message,
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
