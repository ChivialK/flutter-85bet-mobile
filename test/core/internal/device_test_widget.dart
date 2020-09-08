import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/device.dart';

class DeviceTestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var device = Device(MediaQuery.of(context), Platform.isIOS);
    print('Device Size: $device');
    print('Device Ratio: ${device.ratio}');
    print('Device Ratio Hor: ${device.ratioHor}');
    print('Device Orientation: ${device.orientation}');
    return Container();
  }
}
