import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/roller/data/models/roller_prize_winner_model.dart';
import 'package:flutter_85bet_mobile/res.dart';

class RollerDisplayWinners extends StatefulWidget {
  final Stream winnersStream;
  final double containerWidth;
  final double scale;

  const RollerDisplayWinners({
    @required this.winnersStream,
    @required this.containerWidth,
    @required this.scale,
  });

  @override
  _RollerDisplayWinnersState createState() => _RollerDisplayWinnersState();
}

class _RollerDisplayWinnersState extends State<RollerDisplayWinners> {
  ScrollController _scrollController;
  List<RollerPrizeWinnerModel> _currentData;
  Widget contentWidget;

  Timer _scrollAnim;

  void _startScrollAnim() {
    try {
      _scrollAnim?.cancel();
      _scrollAnim = null;
      _scrollAnim = Timer(Duration(milliseconds: 500), () {
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 10000), curve: Curves.linear);
      });
    } on Exception {}
  }

  void _resetScrollAnim() {
    try {
      _scrollAnim?.cancel();
      _scrollAnim = null;
      _scrollController.jumpTo(0);
    } on Exception {}
  }

  @override
  void initState() {
    _scrollController = new ScrollController();
    _scrollController.addListener(() {
      // debugPrint('offset: ${_scrollController.offset}');
      // debugPrint('position: ${_scrollController.position}');
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        _resetScrollAnim();
        _startScrollAnim();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollAnim?.cancel();
    _scrollAnim = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.containerWidth,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(Res.roller_awarded, fit: BoxFit.fitWidth),
          Positioned(
            top: 80,
            child: Container(
              width: widget.containerWidth - 120,
              child: Column(
                children: [
                  _createWinnerRow(
                    winner: 'Winner',
                    prize: 'Prize',
                    date: 'Date',
                    isTitle: true,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 80 + FontSize.SUBTITLE.value + 14,
            child: Container(
              width: widget.containerWidth - 120,
              height: widget.containerWidth,
              child: StreamBuilder<List<RollerPrizeWinnerModel>>(
                stream: widget.winnersStream,
                initialData: _currentData ?? List.empty(),
                builder: (context, snapshot) {
                  if (snapshot?.hasData == true &&
                      _currentData != snapshot.data) {
                    _currentData = snapshot.data;
                    contentWidget = _buildWinnerList();
                  }
                  contentWidget ??= Center(
                    child: CircularProgressIndicator(),
                  );
                  return contentWidget;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWinnerList() {
    if (_currentData != null && _currentData.isNotEmpty) {
      _startScrollAnim();
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _scrollController,
        shrinkWrap: true,
        itemCount: _currentData.length + 1,
        itemBuilder: (context, index) {
          if (index == _currentData.length) {
            return SizedBox(height: FontSize.NORMAL.value * 2);
          } else {
            var winner = _currentData[index];
            return _createWinnerRow(
              winner: winner.accCode,
              prize: winner.title,
              date: winner.cdate,
              addDivider: index != _currentData.length - 1,
            );
          }
        },
      );
    } else {
      _scrollAnim?.cancel();
      _scrollAnim = null;
      return SizedBox.shrink();
    }
  }

  Widget _createWinnerRow({
    @required String winner,
    @required String prize,
    @required String date,
    bool isTitle = false,
    bool addDivider = true,
  }) {
    var textStyle = (isTitle)
        ? TextStyle(
            fontSize: FontSize.SUBTITLE.value,
            color: themeColor.rollerRuleTextColor,
          )
        : TextStyle(
            color: themeColor.rollerRuleHighlightColor,
          );
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child:
                  Text(winner, style: textStyle, textAlign: TextAlign.center),
            ),
            Expanded(
              flex: 3,
              child: Text(prize, style: textStyle, textAlign: TextAlign.center),
            ),
            Expanded(
              flex: 2,
              child: Text(date, style: textStyle, textAlign: TextAlign.center),
            ),
          ],
        ),
        Divider(color: themeColor.rollerRuleHighlightColor),
      ],
    );
  }
}
