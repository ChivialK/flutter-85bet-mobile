import 'package:flutter/material.dart';

///
///@author H.C.CHIANG
///@version 2020/2/12
class LoadingWidget extends StatelessWidget {
  final double heightFactor;

  /// Widget's container height is screen height divided by [heightFactor]
  /// [heightFactor]'s default value is 2
  const LoadingWidget({Key key, this.heightFactor = 2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / heightFactor,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
