import 'package:flutter/material.dart';

part 'test_anim_drawer_tile.dart';

class TestAnimDrawer extends StatefulWidget {
  @override
  TestAnimDrawerState createState() {
    return new TestAnimDrawerState();
  }
}

class TestAnimDrawerState extends State<TestAnimDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 210;
  double minWidth = 70;
  bool isCollapsed = true;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  int currentSelectedIndex = 0;

  List<TestAnimDrawerTileData> tileList = [
    TestAnimDrawerTileData(title: "Dashboard", icon: Icons.insert_chart),
    TestAnimDrawerTileData(title: "Errors", icon: Icons.error),
    TestAnimDrawerTileData(title: "Search", icon: Icons.search),
    TestAnimDrawerTileData(title: "Notifications", icon: Icons.notifications),
    TestAnimDrawerTileData(title: "Settings", icon: Icons.settings),
  ];

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: minWidth, end: maxWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => getWidget(context, widget),
    );
  }

  Widget getWidget(context, widget) {
    return Material(
      elevation: 80.0,
      child: Container(
        width: widthAnimation.value,
        color: Colors.black54,
        child: Column(
          children: <Widget>[
            TestAnimDrawerTile(
              tileData: TestAnimDrawerTileData(
                title: 'Techie',
                icon: Icons.person,
              ),
              animationController: _animationController,
            ),
            Divider(
              color: Colors.grey,
              height: 40.0,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, counter) {
                  return Divider(height: 12.0);
                },
                itemBuilder: (context, counter) {
                  return TestAnimDrawerTile(
                    onTap: () {
                      setState(() {
                        currentSelectedIndex = counter;
                      });
                    },
                    isSelected: currentSelectedIndex == counter,
                    tileData: tileList[counter],
                    animationController: _animationController,
                  );
                },
                itemCount: tileList.length,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isCollapsed = !isCollapsed;
                  isCollapsed
                      ? _animationController.reverse()
                      : _animationController.forward();
                });
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: _animationController,
                color: _selectedColor,
                size: 50.0,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
