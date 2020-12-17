import 'package:auto_size_text/auto_size_text.dart';
import 'package:custom_rounded_rectangle_border/custom_rounded_rectangle_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/base/data_operator.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/features/themes/theme_interface.dart';

typedef OnTypeGridTap = void Function(int, dynamic);

/// Grid View for [PaymentEnum]
///@author H.C.CHIANG
///@version 2020/3/26
class TypesGridWidget<T extends DataOperator> extends StatefulWidget {
  final List<T> types;
  final String titleKey;
  final OnTypeGridTap onTypeGridTap;
  final int tabsPerRow;
  final double itemSpace;
  final double itemSpaceHorFactor;
  final double expectTabHeight;
  final double horizontalInset;
  final bool borderless;
  final bool round;

  TypesGridWidget({
    Key key,
    @required this.types,
    @required this.titleKey,
    @required this.onTypeGridTap,
    this.tabsPerRow = 2,
    this.itemSpace = 8.0,
    this.itemSpaceHorFactor = 2.0,
    this.expectTabHeight = 42.0,
    this.horizontalInset = 48.0,
    this.borderless = true,
    this.round = true,
  }) : super(key: key);

  @override
  _TypesGridWidgetState createState() => _TypesGridWidgetState();
}

class _TypesGridWidgetState extends State<TypesGridWidget>
    with AutomaticKeepAliveClientMixin<TypesGridWidget> {
  final BorderSide borderSide =
      BorderSide(color: themeColor.defaultBorderColor);
  final BorderSide borderSideTrans = BorderSide(color: Colors.transparent);

  int _clicked = 0;
  double _gridRatio;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // screen width - widget padding - cross space = available width
    double itemWidth = (Global.device.width -
            widget.horizontalInset -
            widget.itemSpace * (widget.tabsPerRow + 2)) /
        widget.tabsPerRow;
    _gridRatio = itemWidth / widget.expectTabHeight;
    debugPrint('grid item width: $itemWidth, gridRatio: $_gridRatio');
    if (_gridRatio > 4.16) _gridRatio = 4.16;
    super.initState();
  }

  @override
  void didUpdateWidget(TypesGridWidget oldWidget) {
    var selected = widget.types[_clicked];
    super.didUpdateWidget(oldWidget);
    setState(() {
      _clicked = widget.types.indexWhere((element) => element == selected);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.types == null || widget.types.isEmpty) return SizedBox.shrink();
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.tabsPerRow,
        crossAxisSpacing: widget.itemSpace,
        mainAxisSpacing: widget.itemSpace * widget.itemSpaceHorFactor,
        childAspectRatio: _gridRatio,
      ),
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.types.length,
      itemBuilder: (_, index) {
        final type = widget.types[index];
        return GestureDetector(
          onTap: () {
            if (_clicked == index) return;
            setState(() {
              _clicked = index;
            });
            widget.onTypeGridTap(index, type);
          },
          child: Container(
            decoration: ShapeDecoration(
                color: (_clicked == index)
                    ? themeColor.defaultTabSelectedColor
                    : themeColor.defaultTabUnselectedColor,
                shadows: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 1.15,
                    blurRadius: 2.0,
                    offset: Offset(2, 3), // changes position of shadow
                  ),
                ],
                shape: (widget.borderless)
                    ? RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: (widget.round)
                                ? Radius.circular(6.0)
                                : Radius.circular(0.0)),
                      )
                    : CustomRoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: (widget.round)
                                ? Radius.circular(6.0)
                                : Radius.circular(0.0)),
                        leftSide: borderSide,
                        topLeftCornerSide: borderSide,
                        bottomLeftCornerSide: borderSide,
                        rightSide: borderSide,
                        topRightCornerSide: borderSide,
                        bottomRightCornerSide: borderSide,
                        topSide: borderSide,
                        bottomSide: borderSideTrans,
                      )),
            margin: (index > 0 && (index + 1) % widget.tabsPerRow == 0)
                ? const EdgeInsets.only(right: 2.0)
                : EdgeInsets.zero,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      type[widget.titleKey],
                      style: TextStyle(
                        color: (_clicked == index)
                            ? themeColor.defaultTabSelectedTextColor
                            : themeColor.defaultTabSelectedColor,
                        fontSize: FontSize.SUBTITLE.value,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      minFontSize: FontSize.SMALL.value - 4.0,
                      maxFontSize: FontSize.SUBTITLE.value,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
