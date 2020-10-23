import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/base/data_operator.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/core/internal/themes.dart';

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
    this.round = false,
  }) : super(key: key);

  @override
  _TypesGridWidgetState createState() => _TypesGridWidgetState();
}

class _TypesGridWidgetState extends State<TypesGridWidget> {
  int _clicked = 0;
  double _gridRatio;

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
          child: Material(
            color: Colors.transparent,
            elevation: 8.0,
            child: Container(
              decoration: BoxDecoration(
                color: (_clicked == index)
                    ? Themes.buttonTextPrimaryColor
                    : Themes.walletBoxButtonColor,
                borderRadius: (widget.round)
                    ? BorderRadius.circular(6.0)
                    : BorderRadius.vertical(top: Radius.circular(6.0)),
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  type[widget.titleKey],
                  style: TextStyle(
                    color: (_clicked == index)
                        ? Themes.walletBoxButtonColor
                        : Themes.buttonTextPrimaryColor,
                    fontSize: FontSize.SUBTITLE.value,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
