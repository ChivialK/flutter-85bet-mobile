import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/general/enum/toast_duration.dart';

void callToast(
  String message, {
  ToastDuration duration = ToastDuration.DEFAULT,
  int delayedMilli = 100,
  bool darkBg = true,
}) {
  Future.delayed(Duration(milliseconds: delayedMilli), () {
    BotToast.showText(
      text: message,
      textStyle: TextStyle(color: (darkBg) ? Colors.white : Colors.black87),
      contentColor: (darkBg) ? Colors.black87 : Color(0xDDFFFFFF),
      align: Alignment.lerp(Alignment.center, Alignment.bottomCenter, 0.95),
      clickClose: true,
      backButtonBehavior: BackButtonBehavior.none,
      duration: duration.value,
    );
  });
}
