import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

const cornerColor = Color(0xffd3b284);

class CornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
//    path.lineTo(0.0, size.height);
//    path.lineTo(size.width, 0.0);
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
