import 'dart:math' show pi;

import 'package:flutter/widgets.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/cached_network_image.dart';

import '../../data/models/roller_prize_model.dart';

typedef _ComputePrizeAngle = double Function(int);

class RollerDisplayWheelView extends StatelessWidget {
  final Size rawPrizeSize = Size(80, 120);
  final double wheelSize;
  final double wheelScale;
  final List<RollerPrizeModel> prizes;
  final _ComputePrizeAngle computeFunc;

  RollerDisplayWheelView({
    @required this.wheelSize,
    @required this.wheelScale,
    @required this.prizes,
    @required this.computeFunc,
  });

  @override
  Widget build(BuildContext context) {
    Size prizeSize = (Global.device.widthScale > 1.0)
        ? rawPrizeSize * wheelScale / Global.device.widthScale
        : rawPrizeSize * wheelScale;
    debugPrint('prize image size: $prizeSize');
    return Stack(
      children: List.generate(
        prizes.length,
        (index) => _buildImage(prizeSize, index, prizes[index]),
      ),
    );
  }

  Widget _buildImage(Size size, int index, RollerPrizeModel prize) {
    // angle = 0~6.28 (2*pi)
    final double _rotate = computeFunc(index);
    final double degree = _rotate / (2 * pi / 360);
    debugPrint(
        'create prize ${prize.id} with angle: $_rotate (degree: $degree');
    return Transform.rotate(
      angle: _rotate,
      child: Container(
//        constraints: BoxConstraints.tight(size * (1.5 / wheelScale) * 1.5)),
        constraints: (Global.device.widthScale > 1.0)
            ? BoxConstraints.tight(Size(
                wheelSize * 0.765 / Global.device.widthScale,
                wheelSize * 0.765 / Global.device.widthScale,
              ))
            : BoxConstraints.tight(Size(
                wheelSize * 0.765,
                wheelSize * 0.765,
              )),
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints.tight(size),
          child: networkImageBuilder(prize.imgUrl),
        ),
      ),
    );
  }
}
