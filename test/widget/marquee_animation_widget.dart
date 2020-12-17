import 'package:flutter/widgets.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';

typedef OnMarqueeTap = void Function(int);

class MarqueeAnimation extends StatefulWidget {
  final Duration duration;
  final List<String> messages;
  final List<int> messageIds;
  final TextStyle textStyle;
  final OnMarqueeTap onMarqueeTap;

  const MarqueeAnimation({
    Key key,
    this.duration = const Duration(milliseconds: 5000),
    @required this.messages,
    this.messageIds,
    @required this.textStyle,
    this.onMarqueeTap,
  }) : super(key: key);

  @override
  _MarqueeAnimationState createState() => _MarqueeAnimationState();
}

class _MarqueeAnimationState extends State<MarqueeAnimation>
    with TickerProviderStateMixin {
  AnimationController _controller;

  int _nextMessage = 0;

  //透明度
  Animation<double> _opacityAni1, _opacityAni2;

  //位移
  Animation<Offset> _positionAni1, _positionAni2;

  @override
  Widget build(BuildContext context) {
    debugPrint('build message: ${widget.messages[_nextMessage]}');
    _startHorizontalAni();
    return SlideTransition(
      position: _positionAni2,
      child: FadeTransition(
        opacity: _opacityAni2,
        child: SlideTransition(
          position: _positionAni1,
          child: FadeTransition(
            opacity: _opacityAni1,
            child: Text(
              widget.messages[_nextMessage],
              style: widget.textStyle,
            ),
          ),
        ),
      ),
    );
  }

  //横向滚动
  void _startHorizontalAni() {
    _controller = AnimationController(duration: widget.duration, vsync: this);

    _opacityAni1 = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
          parent: _controller, curve: Interval(0.0, 0.0, curve: Curves.linear)),
    );

    _opacityAni2 = Tween<double>(begin: 1.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _controller, curve: Interval(0.0, 0.0, curve: Curves.linear)),
    );

    _positionAni1 = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
          parent: _controller, curve: Interval(0.0, 0.5, curve: Curves.linear)),
    );

    _positionAni2 = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(-1.0, 0.0),
    ).animate(
      CurvedAnimation(
          parent: _controller, curve: Interval(0.5, 1.0, curve: Curves.linear)),
    );

    _controller
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed && mounted) {
          setState(() {
            _nextMessage++;
            if (_nextMessage >= widget.messages.length) {
              _nextMessage = 0;
            }
          });
          _controller.reset();
          _controller.forward();
        }
        if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller = null;
    super.dispose();
  }
}
