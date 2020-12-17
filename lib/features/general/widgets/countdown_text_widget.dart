import 'dart:async' show Timer;

import 'package:flutter/widgets.dart';

class CountdownTextWidget extends StatefulWidget {
  final Duration duration;
  final bool formatAsHms;
  final bool autoStart;
  final Function callback;

  CountdownTextWidget(Key key,
      {this.duration = const Duration(seconds: 60),
      this.formatAsHms = false,
      this.autoStart = true,
      this.callback})
      : super(key: key);

  @override
  CountdownTextWidgetState createState() => CountdownTextWidgetState();
}

class CountdownTextWidgetState extends State<CountdownTextWidget> {
  Timer _timer;
  int _start;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
            if (widget.callback != null) widget.callback();
          } else if (_start > 0) {
            setState(() {
              _start = _start - 1;
            });
          }
        },
      ),
    );
  }

  @override
  void initState() {
    _start = widget.duration.inSeconds;
    super.initState();
  }

  @override
  void didUpdateWidget(CountdownTextWidget oldWidget) {
    _timer?.cancel();
    super.didUpdateWidget(oldWidget);
    _start = widget.duration.inSeconds;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.autoStart && _timer == null) {
      Future.delayed(Duration(milliseconds: 500), () => startTimer());
    }
    return (widget.formatAsHms)
        ? Text(Duration(seconds: _start).formatHms())
        : Text(Duration(seconds: _start).formatMs());
  }
}

extension FormatDuation on Duration {
  String formatHms() {
    return this.toString().split('.').first.padLeft(8, "0");
  }

  String formatMs() {
    return this.toString().substring(2, 7);
  }
}
