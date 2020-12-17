import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';
import 'package:flutter_85bet_mobile/features/themes/theme_interface.dart';

typedef PagerAction = void Function(int);

class PagerWidget extends StatefulWidget {
  final bool hasActionButton;
  final PagerAction onAction;
  final double horizontalInset;

  PagerWidget(Key key,
      {this.hasActionButton = true, this.onAction, this.horizontalInset = 12.0})
      : super(key: key);

  @override
  PagerWidgetState createState() => PagerWidgetState();
}

class PagerWidgetState extends State<PagerWidget> {
  int totalPage;
  int currentPage = 1;

  double maxListWidth;
  double maxScreenWidth;
  double btnSize = 30.0;

  set updateCurrentPage(int page) {
    if (currentPage != page)
      setState(() {
        currentPage = page;
      });
  }

  set updateTotalPage(int pages) {
    if (totalPage != pages) {
      totalPage = pages;
      if (totalPage <= 0) currentPage = 0;
      _updateWidgetWidth();
      setState(() {});
    }
  }

  void _updateWidgetWidth() {
    maxListWidth = (btnSize + 4) * totalPage;
    maxScreenWidth = Global.device.width -
        widget.horizontalInset -
        2 * (totalPage + 2) -
        (btnSize + 8);
//    debugPrint('pager max width: $maxListWidth, max screen width: $maxScreenWidth');
    if (maxListWidth > maxScreenWidth) maxListWidth = maxScreenWidth;
  }

  @override
  Widget build(BuildContext context) {
    if (totalPage == null || totalPage <= 0) return SizedBox.shrink();
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        /// Previous Page Button
        (widget.hasActionButton == false || currentPage == 1)
            ? SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 6.0),
                child: ButtonTheme(
                  minWidth: btnSize,
                  height: btnSize,
                  buttonColor: themeColor.pagerButtonColor,
                  disabledColor: themeColor.buttonDisabledColorDark,
                  child: RaisedButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: const EdgeInsets.all(6.0),
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(4.0),
                    ),
                    onPressed: (widget.onAction == null || currentPage == 1)
                        ? null
                        : () => widget.onAction(currentPage - 1),
                    child: Text('<<'),
                  ),
                ),
              ),

        /// Page Select Buttons
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: btnSize,
            maxWidth: maxListWidth,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: totalPage,
                  itemBuilder: (_, index) {
                    int page = index + 1;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: ButtonTheme(
                        minWidth: btnSize,
                        height: btnSize,
                        buttonColor: (currentPage == page)
                            ? themeColor.pagerButtonSelectedColor
                            : themeColor.pagerButtonColor,
                        child: RaisedButton(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          padding: const EdgeInsets.all(6.0),
                          elevation: 1.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(4.0),
                          ),
                          onPressed: (widget.onAction == null)
                              ? null
                              : () => widget.onAction(page),
                          child: Text(
                            '$page',
                            style: TextStyle(
                                color: (currentPage == page)
                                    ? themeColor.secondaryTextColor1
                                    : themeColor.defaultTextColor),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        /// Previous Page Button
        (widget.hasActionButton == false || currentPage == totalPage)
            ? SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.only(left: 6.0, right: 4.0),
                child: ButtonTheme(
                  minWidth: btnSize,
                  height: btnSize,
                  buttonColor: themeColor.pagerButtonColor,
                  disabledColor: themeColor.buttonDisabledColorDark,
                  child: RaisedButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: const EdgeInsets.all(6.0),
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(4.0),
                    ),
                    onPressed:
                        (widget.onAction == null || currentPage == totalPage)
                            ? null
                            : () => widget.onAction(currentPage + 1),
                    child: Text('>>'),
                  ),
                ),
              ),
      ],
    );
  }
}
