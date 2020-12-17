import 'dart:async';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/mobx_store_export.dart';

typedef MarqueeSpanOnTap = void Function(int);

///
/// Customize Marquee Widget
/// Origin from [Marquee] in /test/widget/fast_marquee_widget.dart
///
class MarqueeSpan extends StatefulWidget {
  MarqueeSpan({
    Key key,
    @required this.texts,
    this.style = const TextStyle(color: Colors.green),
    this.callback,
    this.spaceBetweenTexts,
    this.velocity = 50,
    this.startPadding = 0,
    this.reverse = false,
    this.bounce = false,
    this.startAfter = Duration.zero,
    this.pauseAfterRound = Duration.zero,
    this.numberOfRounds,
    this.showFadingOnlyWhenScrolling = true,
    this.fadingEdgeStartFraction = 0,
    this.fadingEdgeEndFraction = 0,
    final Curve curve = Curves.linear,
  })  : _curveTween = CurveTween(curve: curve),
        _fadeGradient =
            fadingEdgeStartFraction == 0 && fadingEdgeEndFraction == 0
                ? null
                : LinearGradient(
                    colors: const [
                      Colors.transparent,
                      Colors.black,
                      Colors.black,
                      Colors.transparent,
                    ],
                    stops: [
                      0,
                      fadingEdgeStartFraction,
                      1 - fadingEdgeEndFraction,
                      1,
                    ],
                  ),
        assert(
            texts != null,
            'The text cannot be null. If you don\'t want to display something, '
            'consider passing an empty string instead.'),
        assert(
            spaceBetweenTexts > 0, 'space between texts cannot be negative.'),
        assert(velocity != null),
        assert(velocity != 0.0, 'The velocity cannot be zero.'),
        assert(!velocity.isNaN),
        assert(velocity != 0.0, 'The velocity cannot be zero.'),
        assert(velocity > 0,
            'The velocity cannot be negative. Set reverse to true instead.'),
        assert(velocity.isFinite),
        assert(
            startAfter != null,
            'The startAfter cannot be null. If you want to start immediately, '
            'consider setting it to Duration.zero instead.'),
        assert(
            pauseAfterRound != null,
            'The pauseAfterRound cannot be null. If you don\'t want to pause, '
            'consider setting it to Duration.zero instead.'),
        assert(
            pauseAfterRound >= Duration.zero,
            'The pauseAfterRound cannot be negative as time travel isn\'t '
            'invented yet.'),
        assert(fadingEdgeStartFraction >= 0 && fadingEdgeStartFraction <= 0.5,
            'The fadingEdgeGradientFractionOnStart value should be between 0 and 0.5, inclusive'),
        assert(fadingEdgeEndFraction >= 0 && fadingEdgeEndFraction <= 0.5,
            'The fadingEdgeGradientFractionOnEnd value should be between 0 and 0.5, inclusive'),
        assert(
            startPadding != null,
            'The start padding cannot be null. If you don\'t want any '
            'startPadding, consider setting it to zero.'),
        assert(numberOfRounds == null || numberOfRounds > 0),
        assert(curve != null,
            'Curve cannot be null. If you don\'t want to use one, consider using Curves.linear.'),
        super(key: key);

  /// The texts to be displayed.
  final List<String> texts;

  /// The space between each text
  final double spaceBetweenTexts;

  /// The style of the text to be displayed.
  final TextStyle style;

  /// The scrolling velocity in logical pixels per second.
  /// The velocity must not be negative. [reverse] may be set
  /// to change the direction instead.
  final double velocity;

  /// Set as true to reverse the scroll direction.
  final bool reverse;

  /// Bounce the text back and fourth instead of scrolling it infinitely.
  final bool bounce;

  /// Start scrolling after this duration after the widget is first displayed.
  final Duration startAfter;

  /// After each round, a pause of this duration occurs.
  final Duration pauseAfterRound;

  /// When the text scrolled around [numberOfRounds] times, it will stop scrolling
  /// `null` indicates there is no limit
  final int numberOfRounds;

  /// Whether the fading edge should only appear while the text is
  /// scrolling.
  final bool showFadingOnlyWhenScrolling;

  /// The fraction of the [MarqueeSpan] that will be faded on the left or top.
  /// By default, there won't be any fading.
  final double fadingEdgeStartFraction;

  /// The fraction of the [MarqueeSpan] that will be faded on the right or down.
  /// By default, there won't be any fading.
  final double fadingEdgeEndFraction;

  /// A padding for the resting position.
  ///
  /// In between rounds, the marquee stops at this position. This parameter is
  /// especially useful if the marquee pauses after rounds and some other
  /// widgets are stacked on top of the marquee and block the sides, like
  /// fading gradients.
  final double startPadding;

  /// The animation curve.
  /// Use the [curve] constructor argument to set this.
  ///
  /// This curve defines the text's movement speed over one cycle.
  final CurveTween _curveTween;

  /// An internal gradient generated for use when fading the edges.
  /// See [showFadingOnlyWhenScrolling], [fadingEdgeStartFraction], and
  /// [fadingEdgeEndFraction] for fading configuration.
  final LinearGradient _fadeGradient;

  /// The fraction of the [MarqueeSpan] that will be faded on the right or down.
  /// By default, there won't be any fading.
  final MarqueeSpanOnTap callback;

  @override
  _MarqueeSpanState createState() => _MarqueeSpanState();

  bool equals(Object other) {
    return other is MarqueeSpan &&
        texts == other.texts &&
        style == other.style &&
        spaceBetweenTexts == other.spaceBetweenTexts &&
        velocity == other.velocity &&
        startPadding == other.startPadding &&
        pauseAfterRound == other.pauseAfterRound &&
        numberOfRounds == other.numberOfRounds;
  }
}

class _MarqueeSpanState extends State<MarqueeSpan>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _textAnimation;
  TextPainter _textPainter;
  Size _textSize;

  List<InlineSpan> spans = new List();
  List<double> textsWidth = new List();
  List<double> textStartPos = new List();

  bool _roundsComplete = false;

  bool _calcTextStartPositions() {
    textsWidth = new List();
    textStartPos = new List();
    if (widget.texts.isNotEmpty) {
      for (int i = 0; i < widget.texts.length; i++) {
        final painter = TextPainter(
          textDirection: TextDirection.ltr,
          text: TextSpan(text: widget.texts[i], style: widget.style),
        )..layout();
        textsWidth.add(painter.size.width);
        if (i == 0) {
          textStartPos.add(widget.startPadding);
        } else {
          textStartPos.add(
              textsWidth.take(i).fold(0, (prev, curr) => prev + curr) +
                  (widget.spaceBetweenTexts * i));
        }
      }
      // debugPrint('text size list: $textsWidth');
      // debugPrint('text start pos: $textStartPos');
      return true;
    }
    return false;
  }

  void _updateTextPaint() {
    bool hasPositions = _calcTextStartPositions();

    // add space between each text
    spans = new List();
    widget.texts.forEach((element) {
      spans.add(TextSpan(text: element));
      spans.add(WidgetSpan(
          child: SizedBox(width: widget.spaceBetweenTexts, height: 1)));
    });

    // Make the text painter, and record its size
    _textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        children: spans,
        style: widget.style,
      ),
    );

    // set placeholder size for spacing widgetspan
    _textPainter.setPlaceholderDimensions(List.generate(
        widget.texts.length,
        (index) => PlaceholderDimensions(
            size: Size(widget.spaceBetweenTexts, 1),
            alignment: PlaceholderAlignment.middle)));

    // layout the paint
    _textPainter.layout();
    debugPrint(
        'marquee painter w${_textPainter.width}*h${_textPainter.height}');

    _textSize = _textPainter.size;
    if (!hasPositions) {
      textsWidth.add(_textSize.width);
      textStartPos.add(0);
    }

    // Create the animation controller
    if (_controller == null) {
      _controller = AnimationController(
        vsync: this,
        duration: _MarqueeSpanPainter.getDurationFromVelocity(
            widget.velocity, _textSize.width, 0),
      );
    } else {
      _controller.duration = _MarqueeSpanPainter.getDurationFromVelocity(
          widget.velocity, _textSize.width, 0);
    }

    // Create a scaled, curved animation that has a value equal to the horizontal text position
    _textAnimation = (widget.reverse
            ? Tween<double>(end: _textSize.width, begin: 0)
            : Tween<double>(begin: _textSize.width, end: 0))
        .chain(widget._curveTween)
        .animate(_controller);
  }

  void _setup() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Wait for the duration passed in startAfter
      await Future.delayed(widget.startAfter);
      if (!mounted) return;

      // Restart or reverse the animation when required
      _controller.addStatusListener((status) async {
        // Set state so the widget rebuilds with/without a fade
        if (widget.showFadingOnlyWhenScrolling) setState(() {});

        // Wait for the pauseAfterRound time
        await Future.delayed(widget.pauseAfterRound);

        if (!mounted || _roundsComplete) return;
        if (widget.bounce && status == AnimationStatus.dismissed) {
          _controller.forward(from: 0);
        } else {
          if (status == AnimationStatus.completed) {
            if (widget.bounce) {
              _controller.reverse(from: 1);
            } else {
              _controller.forward(from: 0);
            }
          }
        }
      });

      // Start the animation
      _controller.forward();

      // Stop the animation after the time taken to complete the given
      // number of rounds has elapsed.
      if (widget.numberOfRounds != null) {
        Timer(
          Duration(
            microseconds: ((_controller.duration.inMicroseconds +
                    widget.pauseAfterRound.inMicroseconds) *
                widget.numberOfRounds),
          ),
          () {
            _roundsComplete = true;
          },
        );
      }
    });
  }

  @override
  void initState() {
    if (widget.reverse == false &&
        widget.bounce == false &&
        widget.callback != null) {
      MyLogger.warn(
          msg: 'marquee tap callback will not work on reversed text',
          tag: 'MarqueeSpan');
    }
    super.initState();
    _updateTextPaint();
    _setup();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Make the custom painter
    final scroller = GestureDetector(
      onTapUp: (widget.callback != null &&
              widget.reverse == false &&
              widget.bounce == false)
          ? (pos) {
              // debugPrint('remain anim: ${_textAnimation.value}');
              double animPos = (_textAnimation.value - _textSize.width).abs();
              // debugPrint('anim pos: $animPos');
              // debugPrint('tap pos global: ${pos.globalPosition}');
              // debugPrint('tap pos local: ${pos.localPosition}');
              double tapAnimPos = animPos + pos.localPosition.dx;
              // debugPrint('tap anim pos: $tapAnimPos');
              if (tapAnimPos > _textSize.width) {
                tapAnimPos = tapAnimPos - _textSize.width;
                // debugPrint('fixed tap anim pos: $tapAnimPos');
              }
              int index = textStartPos.indexOf(
                  textStartPos.lastWhere((element) => element <= tapAnimPos));
              // debugPrint('index should be: $index');
              widget.callback(index);
            }
          : (_) => {},
      child: AnimatedBuilder(
        animation: _textAnimation,
        builder: (context, _) {
          return CustomPaint(
            size: Size(double.infinity, _textSize.height),
            painter: _MarqueeSpanPainter(
              horizontalTextPosition: _textAnimation.value,
              textPainter: _textPainter,
              textSize: _textSize,
              startPadding: widget.startPadding,
            ),
          );
        },
      ),
    );

    // Flutter doesn't support the shader used on Web yet.
    if (kIsWeb) return scroller;

    // Don't draw a gradient shader if the gradient isn't assigned, or if
    // the widget isn't scrolling and it's set not to fade in that circumstance
    if ((widget._fadeGradient == null ||
        (widget.showFadingOnlyWhenScrolling && !_controller.isAnimating)))
      return scroller;

    return ShaderMask(
      child: scroller,
      shaderCallback: (rect) {
        final shaderRect = Rect.fromLTRB(0, 0, rect.width, rect.height);

        // Don't fade if the text won't scroll at all
        // and fading while not scrolling is off
        if (widget.showFadingOnlyWhenScrolling &&
            _textSize.width < rect.width) {
          return const LinearGradient(
            colors: const <Color>[Colors.black, Colors.black],
          ).createShader(shaderRect);
        }

        return widget._fadeGradient.createShader(shaderRect);
      },
    );
  }
}

class _MarqueeSpanPainter extends CustomPainter {
  final double horizontalTextPosition;
  final TextPainter textPainter;
  final Size textSize;
  final double startPadding;

  const _MarqueeSpanPainter({
    @required this.horizontalTextPosition,
    @required this.textPainter,
    @required this.textSize,
    @required this.startPadding,
  });

  static Duration getDurationFromVelocity(
    double velocity,
    double textWidth,
    double blankSpace,
  ) {
    return Duration(
      microseconds: ((Duration.microsecondsPerSecond / velocity) *
              (textWidth + blankSpace))
          .toInt(),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    final old = (oldDelegate as _MarqueeSpanPainter);
    return (horizontalTextPosition != old.horizontalTextPosition ||
        textSize.width != old.textSize.width);
  }

  @override
  void paint(Canvas canvas, Size size) {
    // Calculate the vertical offset.
    final verticalPosition = (size.height - textPainter.height) / 2;

    // If the text all fits on screen, no need to scroll.
    if (textSize.width < size.width) {
      textPainter.paint(canvas, Offset(0, verticalPosition));
      return;
    }

    // Clip the canvas in order not to draw text out of bounds.
    canvas.clipRect(Rect.fromLTRB(0, 0, size.width, size.height));

    // Draw the text twice in succession, with relation to the calculated horizontal offset.
    // Drawn twice because there will only be a maximum of two texts visible at any point in time.
    textPainter.paint(
      canvas,
      Offset(startPadding + horizontalTextPosition, verticalPosition),
    );
    textPainter.paint(
      canvas,
      Offset(
        startPadding + horizontalTextPosition - textSize.width,
        verticalPosition,
      ),
    );
  }
}
