part of 'web_game_screen_drawer.dart';

class WebGameScreenDrawerTile extends StatefulWidget {
  final AnimationController animationController;
  final RouteListItem item;
  final Function onTap;

  WebGameScreenDrawerTile({
    @required this.animationController,
    @required this.item,
    this.onTap,
  });

  @override
  _WebGameScreenDrawerTileState createState() =>
      _WebGameScreenDrawerTileState();
}

class _WebGameScreenDrawerTileState extends State<WebGameScreenDrawerTile> {
  Animation<double> widthAnimation, sizedBoxAnimation;
  TextStyle listTitleDefaultTextStyle = TextStyle(
    color: Themes.defaultTextColor,
    fontSize: FontSize.SUBTITLE.value,
    fontWeight: FontWeight.w600,
  );

  @override
  void initState() {
    super.initState();
    widthAnimation =
        Tween<double>(begin: _gameDrawerMinWidth, end: _gameDrawerMaxWidth)
            .animate(widget.animationController);
    sizedBoxAnimation =
        Tween<double>(begin: 0, end: 10).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        color: Colors.transparent,
      ),
      width: widthAnimation.value,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: GestureDetector(
        onTap: () => widget.onTap(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                widget.item.iconData,
                color: Themes.iconSubColor1,
                size: 24.0,
              ),
            ),
            SizedBox(width: sizedBoxAnimation.value),
            (widthAnimation.value >= _gameDrawerItemTitleShowOnWidth)
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: Text(
                      widget.item.title ?? widget.item.route?.pageTitle ?? '?',
                      style: listTitleDefaultTextStyle,
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
