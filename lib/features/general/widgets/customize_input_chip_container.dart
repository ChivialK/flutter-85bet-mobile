import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/themes.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_titled_container.dart';

typedef ChipTapCall = void Function(dynamic);

class CustomizeInputChipContainer extends StatefulWidget {
  final double parentWidth;
  final EdgeInsetsGeometry padding;
  final double horizontalInset;
  final double heightFactor;
  final Color backgroundColor;
  final bool roundCorner;

  final String prefixTitle;
  final double prefixTextSize;
  final int prefixTextMaxLines;
  final IconData prefixIconData;
  final Color prefixItemColor;
  final Color prefixBgColor;
  final double titleLetterSpacing;
  final double titleWidthFactor;
  final double iconWidthFactor;

  final List<String> labels;
  final List values;
  final ChipTapCall chipTapCall;
  final double chipSpacing;
  final bool roundChip;

  CustomizeInputChipContainer({
    Key key,
    @required this.labels,
    @required this.values,
    this.chipTapCall,
    this.chipSpacing = 6.0,
    this.parentWidth,
    this.padding,
    this.horizontalInset = 32.0,
    this.heightFactor = 1,
    this.roundCorner = true,
    this.backgroundColor = Themes.fieldInputBgColor,
    this.prefixTitle,
    this.prefixTextSize,
    this.prefixTextMaxLines = 1,
    this.prefixIconData,
    this.prefixItemColor = Themes.fieldPrefixColor,
    this.prefixBgColor = Themes.defaultWidgetBgColor,
    this.titleWidthFactor = Themes.prefixTextWidthFactor,
    this.titleLetterSpacing = Themes.prefixTextSpacing,
    this.iconWidthFactor = Themes.prefixIconWidthFactor,
    this.roundChip = true,
  }) : super(key: key);

  @override
  _CustomizeInputChipContainerState createState() =>
      _CustomizeInputChipContainerState();
}

class _CustomizeInputChipContainerState
    extends State<CustomizeInputChipContainer> {
  List<Widget> chips;

  @override
  void didUpdateWidget(CustomizeInputChipContainer oldWidget) {
    chips = null;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (chips == null && widget.labels.isNotEmpty) {
      chips = new List();
      int index = 0;
      for (String label in widget.labels) {
        chips.add(_createChip(label, widget.values[index]));
        index++;
      }
    }

    return CustomizeTitledContainer(
      parentWidth: widget.parentWidth,
      padding: widget.padding,
      horizontalInset: widget.horizontalInset,
      heightFactor: widget.heightFactor,
      roundCorner: widget.roundCorner,
      backgroundColor: widget.backgroundColor,
      prefixText: widget.prefixTitle,
      prefixTextSize: widget.prefixTextSize,
      prefixTextMaxLines: widget.prefixTextMaxLines,
      prefixItemColor: widget.prefixItemColor,
      prefixBgColor: widget.prefixBgColor,
      prefixIconData: widget.prefixIconData,
      titleWidthFactor: widget.titleWidthFactor,
      titleLetterSpacing: widget.titleLetterSpacing,
      iconWidthFactor: widget.iconWidthFactor,
      child: Wrap(
        spacing: widget.chipSpacing,
        children: chips,
      ),
    );
  }

  Widget _createChip(String labelText, dynamic returnOnPress) {
    if (widget.roundChip == false)
      return InputChip(
        visualDensity: VisualDensity.compact,
        label: Text(labelText),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
          left: Radius.circular(4.0),
          right: Radius.circular(4.0),
        )),
        backgroundColor: Themes.fieldInputBgColor,
        onPressed: () => (widget.chipTapCall != null)
            ? widget.chipTapCall(returnOnPress)
            : {},
      );
    else
      return InputChip(
        visualDensity: VisualDensity.compact,
        label: Text(labelText),
        onPressed: () => (widget.chipTapCall != null)
            ? widget.chipTapCall(returnOnPress)
            : {},
      );
  }
}
