import 'dart:math' show Random, pi;

import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/res.dart';

import '../state/roller_store.dart';
import 'roller_display_wheel_view.dart';
import 'roller_prize_dialog.dart';

class RollerDisplayWheel extends StatefulWidget {
  final RollerStore store;
  final double containerWidth;

  const RollerDisplayWheel({
    @required this.store,
    @required this.containerWidth,
  });

  @override
  _RollerDisplayWheelState createState() => _RollerDisplayWheelState();
}

class _RollerDisplayWheelState extends State<RollerDisplayWheel>
    with SingleTickerProviderStateMixin {
  final double rawWheelSize = 500;
  final Size rawWheelBtnSize = Size(170, 211);

  List<ReactionDisposer> _disposers;
  CancelFunc toastDismiss;
  double wheelScale;
  double wheelSize;

  AnimationController _controller;
  Animation _animation;
  bool hasListener = false;
  double _angle = 0;

  int totalPrize = 0;
  int prizeIndex = -1;
  bool waitForReturnPrize = false;
  bool showPrizeResult = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposers ??= [
      /* Reaction on wait prize result */
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => widget.store.waitForPrize,
        // Run some logic with the content of the observed field
        (bool wait) {
          if (wait) {
            // show toast if server has no response after 500ms
            Future.delayed(Duration(milliseconds: 500), () {
              if (widget.store.waitForPrize) toastDismiss = callToastLoading();
            });
          } else if (toastDismiss != null) {
            toastDismiss();
            toastDismiss = null;
          }
        },
      ),
      /* Reaction on received prize result */
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => widget.store.prizeId,
        // Run some logic with the content of the observed field
        (int id) {
          if (waitForReturnPrize && id != null) {
            debugPrint('received prize id: $id, starting animation...');
            prizeIndex = widget.store.getPrizeIndex(id);
            Future.delayed(Duration(milliseconds: 200), () {
              if (mounted) _startAnimation();
            });
          }
        },
      ),
    ];
  }

  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  void initState() {
    totalPrize = widget.store.rollerData?.prizes?.length ?? 0;
    wheelSize = widget.containerWidth;
    if (wheelSize > rawWheelSize) wheelSize = rawWheelSize;
    debugPrint('wheel size: $wheelSize');
    wheelScale = wheelSize / rawWheelSize;
    debugPrint('wheel scale: $wheelScale');
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!hasListener) {
      hasListener = true;
      _controller.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          String prizeUrl = widget.store.getPrizeAlertImgUrl;
          debugPrint('prize url: $prizeUrl');

          if (prizeUrl.isNotEmpty)
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (_) => new RollerPrizeDialog(prizeUrl),
            );
          else
            callToastError(localeStr.wheelMessageErrorPrizeUrl);

          widget.store.clearPrize();
          waitForReturnPrize = false;
          prizeIndex = -1;
        }
      });
    }
    return ConstrainedBox(
      constraints: BoxConstraints.tight(Size(wheelSize, wheelSize)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (_, child) {
              // changes from 0~1 on start~stop
              final _value = _animation.value;
              // stop at desired angle
              final _angle = _value * this._angle;
              return Transform.rotate(
                angle: _angle,
                child: child,
              );
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(Res.roller_wheel8),
                RollerDisplayWheelView(
                  wheelSize: wheelSize,
                  wheelScale: wheelScale,
                  prizes: widget.store.rollerData?.prizes ?? [],
                  computeFunc: _computeAngle,
                ),
              ],
            ),
          ),
          Container(
            constraints:
                BoxConstraints.tight(rawWheelBtnSize * wheelScale / 1.65),
            child: GestureDetector(
              onTap: () {
                if (waitForReturnPrize ||
                    getAppGlobalStreams.hasUser == false) {
                  return;
                }
                if (widget.store.canRoll == false) {
                  callToast(localeStr.wheelApplyTableTextCount + ' 0');
                  return;
                }
                waitForReturnPrize = true;
                widget.store.getPrize();
              },
              child: Image.asset(Res.roller_go),
            ),
          ),
        ],
      ),
    );
  }

  // start angle = pi / prizes.length
  double _computeAngle(int prizeIndex) =>
      (pi / totalPrize) + (prizeIndex / totalPrize) * 2 * pi;

  void _startAnimation() {
    if (prizeIndex < 0 || prizeIndex >= totalPrize) return;
    if (!_controller.isAnimating) {
      var _random = Random().nextDouble();

      // angle range between each prize
//      var _base = 2 * pi / widget.prizes.length;
//      debugPrint('base = $_base');
      // random pointer shift on specific prize
      var _shift = pi / totalPrize * 0.85;
      debugPrint('shift = $_shift');

      // (-) => shift clockwise, (+) => shift counterclockwise
      var _round = 10;
      if (_random >= 0.5)
        _angle = (2 * pi * _round) - _computeAngle(prizeIndex) + _shift;
      else
        _angle = (2 * pi * _round) - _computeAngle(prizeIndex) - _shift;

      // start animation
      _controller.forward(from: 0.0);
    }
  }
}
