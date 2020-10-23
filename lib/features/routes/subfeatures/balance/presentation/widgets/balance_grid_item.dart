import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/utils/value_util.dart';

import '../enum/balance_grid_action.dart';
import 'balance_action_dialog.dart';

class BalanceGridItem extends StatefulWidget {
  final String platform;
  final BalanceGridCall onTapAction;

  BalanceGridItem(
    Key key,
    this.platform, {
    this.onTapAction,
  }) : super(key: key);

  @override
  BalanceGridItemState createState() => BalanceGridItemState();
}

class BalanceGridItemState extends State<BalanceGridItem>
    with TickerProviderStateMixin {
  bool _verticalActionLayout;
  String _btn1Text;
  String _btn2Text;
  String _maintenanceText;

  AnimationController _controller;
  TickerFuture tickerFuture;

  String _credit = '---';
  bool isMaintaining = false;
  bool canTransferOut = true;
  bool canTransferIn = true;
  bool canRefresh = true;

  set setCredit(String credit) {
    stopAnim();
    if (_credit == credit) return;
    debugPrint('${widget.platform} balance credit: $credit');
    _credit = credit;
    isMaintaining = credit == '$creditSymbol-1.00' ||
        credit == 'maintenance' ||
        credit == 'InMaintenance';
    if (isMaintaining || _credit == '---') {
      canTransferIn = false;
      canTransferOut = false;
    } else {
      var dCredit = _credit.strToDouble;
      canTransferOut = dCredit > 0.0;
      if (credit == 'x' || dCredit < 0) canTransferIn = false;
    }
    setState(() {});
    debugPrint('${widget.platform} credit updated: $_credit');
  }

  void startAnim() {
    canRefresh = false;
    tickerFuture = _controller.repeat();
    tickerFuture.timeout(Duration(seconds: 5), onTimeout: () {
      stopAnim();
    });
  }

  void stopAnim() {
    if (_controller.isAnimating) {
      debugPrint('stop anim');
      _controller.forward(from: 0);
      _controller.stop(canceled: true);
    }
    setState(() {
      canRefresh = true;
    });
  }

  void updateVariables(bool state) {
    _verticalActionLayout = Global.lang != 'zh';
    _btn1Text = localeStr.balanceTransferOutText;
    _btn2Text = localeStr.balanceTransferInText;
    _maintenanceText = localeStr.balanceStatusMaintenance;
    if (state) {
      setState(() {});
    }
  }

  @override
  void initState() {
    updateVariables(false);
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
//    _controller.addListener(() {
//      setState(() {
//        if (_controller.status == AnimationStatus.completed)
//          _controller.repeat();
//      });
//    });
    _controller.addListener(() => setState(() {}));
  }

  @override
  void didUpdateWidget(BalanceGridItem oldWidget) {
    debugPrint('update balance grid item: ${widget.platform}');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6.0),
      child: Container(
        decoration: BoxDecoration(
          color: Themes.balanceCardBackground,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        margin: const EdgeInsets.only(bottom: 3.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.platform.toUpperCase(),
                style: TextStyle(
                  color: Themes.balanceCardTitleColor,
                  fontWeight: FontWeight.bold,
                  fontSize: FontSize.HEADER.value,
                ),
              ),
              (_verticalActionLayout)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _transferOutWidget(),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            _actionSeparator(),
                            _transferInWidget(),
                          ],
                        ),
                      ],
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        _transferOutWidget(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: _actionSeparator(),
                        ),
                        _transferInWidget(),
                      ],
                    ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      (isMaintaining) ? _maintenanceText : 'VDK $_credit',
                      style: TextStyle(
                        color: Themes.balanceCardTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: FontSize.TITLE.value,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: RotationTransition(
                      turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                      child: Icon(
                        Icons.refresh,
                        color: (canRefresh)
                            ? Themes.defaultHintColor
                            : Themes.defaultHintSubColor,
                        size: 20,
                      ),
                    ),
                    onTap: () {
                      if (widget.onTapAction != null && canRefresh) {
                        startAnim();
                        widget.onTapAction(
                          BalanceGridAction.refresh,
                          widget.platform,
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _transferOutWidget() {
    return GestureDetector(
      child: Text(
        _btn1Text,
        style: TextStyle(
          color: (canTransferOut)
              ? Themes.balanceAction2TextColor
              : Themes.balanceActionDisableTextColor,
          fontWeight: FontWeight.bold,
          fontSize: FontSize.SUBTITLE.value,
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => new BalanceActionDialog(
            targetPlatform: widget.platform,
            isTransferIn: false,
            onConfirm: () {
              if (widget.onTapAction != null)
                widget.onTapAction(
                  BalanceGridAction.transferOut,
                  widget.platform,
                );
            },
          ),
        );
      },
    );
  }

  Widget _transferInWidget() {
    return GestureDetector(
      child: Text(
        _btn2Text,
        style: TextStyle(
          color: (canTransferIn)
              ? Themes.balanceActionTextColor
              : Themes.balanceActionDisableTextColor,
          fontWeight: FontWeight.bold,
          fontSize: FontSize.SUBTITLE.value,
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => new BalanceActionDialog(
            targetPlatform: widget.platform,
            isTransferIn: true,
            onConfirm: () {
              if (widget.onTapAction != null)
                widget.onTapAction(
                  BalanceGridAction.transferIn,
                  widget.platform,
                );
            },
          ),
        );
      },
    );
  }

  Widget _actionSeparator() {
    return Text(
      ' / ',
      style: TextStyle(
        color: (canTransferOut || canTransferIn)
            ? Themes.balanceActionTextColor
            : Themes.balanceActionDisableTextColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
