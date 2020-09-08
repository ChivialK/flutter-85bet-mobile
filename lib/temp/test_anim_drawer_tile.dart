part of 'test_anim_drawer.dart';

Color _selectedColor = Color(0xFF4AC8EA);

class TestAnimDrawerTileData {
  String title;
  IconData icon;

  TestAnimDrawerTileData({this.title, this.icon});
}

class TestAnimDrawerTile extends StatefulWidget {
  final TestAnimDrawerTileData tileData;
  final AnimationController animationController;
  final bool isSelected;
  final Function onTap;

  TestAnimDrawerTile({
    @required this.tileData,
    @required this.animationController,
    this.isSelected = false,
    this.onTap,
  });

  @override
  _TestAnimDrawerTileState createState() => _TestAnimDrawerTileState();
}

class _TestAnimDrawerTileState extends State<TestAnimDrawerTile> {
  Animation<double> widthAnimation, sizedBoxAnimation;
  TextStyle listTitleDefaultTextStyle = TextStyle(
      color: Colors.white70, fontSize: 20.0, fontWeight: FontWeight.w600);
  TextStyle listTitleSelectedTextStyle = TextStyle(
      color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w600);

  @override
  void initState() {
    super.initState();
    widthAnimation =
        Tween<double>(begin: 70, end: 200).animate(widget.animationController);
    sizedBoxAnimation =
        Tween<double>(begin: 0, end: 10).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          color: widget.isSelected
              ? Colors.transparent.withOpacity(0.3)
              : Colors.transparent,
        ),
        width: widthAnimation.value,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          children: <Widget>[
            Icon(
              widget.tileData.icon,
              color: widget.isSelected ? _selectedColor : Colors.white30,
              size: 38.0,
            ),
            SizedBox(width: sizedBoxAnimation.value),
            (widthAnimation.value >= 190)
                ? Text(widget.tileData.title,
                    style: widget.isSelected
                        ? listTitleSelectedTextStyle
                        : listTitleDefaultTextStyle)
                : Container()
          ],
        ),
      ),
    );
  }
}
