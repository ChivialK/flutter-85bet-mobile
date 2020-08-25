import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';

CancelFunc callToastLoading({
  String message,
  Duration maxDuration = const Duration(seconds: 15),
}) {
  return BotToast.showCustomLoading(
      clickClose: true,
      ignoreContentClick: true,
      backButtonBehavior: BackButtonBehavior.none,
      duration: maxDuration,
      backgroundColor: Colors.transparent,
      align: Alignment.center,
      toastBuilder: (cancel) =>
          _LoadingWidget(message: message, cancelFunc: cancel));
}

/// Show Loading toast as child widget
///@author H.C.CHIANG
///@version 2020/7/29
class ToastLoadingWidget extends StatelessWidget {
  final String message;
  final Duration maxDuration;

  ToastLoadingWidget({
    this.message,
    this.maxDuration = const Duration(seconds: 15),
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 100), () {
      BotToast.showCustomLoading(
          clickClose: false,
          ignoreContentClick: true,
          backButtonBehavior: BackButtonBehavior.ignore,
          duration: maxDuration,
          backgroundColor: Colors.transparent,
          align: Alignment.center,
          toastBuilder: (cancel) =>
              _LoadingWidget(message: message, cancelFunc: cancel));
    });
    return SizedBox.shrink();
  }
}

class _LoadingWidget extends StatefulWidget {
  final String message;
  final CancelFunc cancelFunc;

  const _LoadingWidget({
    this.message,
    @required this.cancelFunc,
  });

  @override
  __LoadingWidgetState createState() => __LoadingWidgetState();
}

class __LoadingWidgetState extends State<_LoadingWidget> {
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
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: CircularProgressIndicator(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                widget.message ?? localeStr.messageLoading,
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
