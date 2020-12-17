//import 'package:flushbar/flushbar.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_85bet_mobile/features/themes/font_size.dart';
//import 'package:flutter_85bet_mobile/core/internal/global.dart';
//
//class FlushBarWidget extends StatelessWidget {
//  final String message;
//
//  FlushBarWidget(this.message);
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: createFloatingFlushBar(context: context, msg: message),
//    );
//  }
//}
//
//Flushbar createFloatingFlushBar({@required BuildContext context, @required String msg}) {
//  return new Flushbar(
//    flushbarStyle: FlushbarStyle.FLOATING,
//    flushbarPosition: FlushbarPosition.TOP,
//    borderRadius: 4,
//    margin: EdgeInsets.only(left: 8, right: 8, top: Global.device.height / 14),
//    messageText: Text(
//      msg,
//      style:
//          TextStyle(fontSize: FontSize.MESSAGE.value, color: Colors.grey[200]),
//    ),
//    icon: Icon(
//      Icons.info_outline,
//      size: 28.0,
//      color: Colors.orangeAccent,
//    ),
//    duration: Duration(seconds: 3),
//  )..show(context);
//}
