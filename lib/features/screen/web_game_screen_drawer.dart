import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/screen/screen_drawer_item.dart';
import 'package:flutter_85bet_mobile/features/screen/web_game_screen_store.dart';

part 'web_game_screen_drawer_tile.dart';

final double _gameDrawerMaxWidth = 160;
final double _gameDrawerMinWidth = 64;
final double _gameDrawerItemTitleShowOnWidth = 134;

class WebGameScreenDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final WebGameScreenStore store;

  WebGameScreenDrawer({
    @required this.scaffoldKey,
    @required this.store,
  });

  @override
  _WebGameScreenDrawerState createState() => _WebGameScreenDrawerState();
}

class _WebGameScreenDrawerState extends State<WebGameScreenDrawer>
    with SingleTickerProviderStateMixin {
  final List<ScreenDrawerItem> itemList = [
    ScreenDrawerItem.backHome,
    ScreenDrawerItem.rotate,
    ScreenDrawerItem.rotateLock,
  ];

  AnimationController _animationController;
  Animation<double> _widthAnimation;
  bool isCollapsed = true;

  String username = '';
  int userLevel = 0;

  @override
  void initState() {
    userLevel = getAppGlobalStreams.userLevel;
    username = getAppGlobalStreams.userName;
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _widthAnimation =
        Tween<double>(begin: _gameDrawerMinWidth, end: _gameDrawerMaxWidth)
            .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, _) => Material(
        elevation: 8.0,
        child: Container(
          width: _widthAnimation.value,
          height: Global.device.height,
          color: Colors.black54,
          child: Column(
            children: [
              if (widget.store.isScreenPortrait)
                SizedBox(
                  height: (isCollapsed) ? 100 : 144,
                  child: DrawerHeader(
                    decoration:
                        BoxDecoration(color: themeColor.defaultBackgroundColor),
                    margin: const EdgeInsets.only(bottom: 4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/images/vip/user_vip_$userLevel.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        if (!isCollapsed)
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: Text(
                                username,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (_, index) {
//                  return Divider(height: 12.0);
                    return SizedBox(height: 4.0);
                  },
                  itemCount: itemList.length,
                  itemBuilder: (_, index) {
                    RouteListItem item = itemList[index].value;
                    return WebGameScreenDrawerTile(
                      item: item,
                      animationController: _animationController,
                      onTap: () {
                        switch (index) {
                          case 0: // [ScreenDrawerItem.backHome]
                            ScreenNavigate.switchScreen(
                              force: true,
                              screen: ScreenEnum.Feature,
                            );
                            break;
                          case 1: // [ScreenDrawerItem.rotate]
                            widget.store.rotateScreenLeft();
                            break;

                          case 2: // [ScreenDrawerItem.rotateLock]
                            bool isLock = widget.store.isLockRotate;
                            String value =
                                (isLock) ? localeStr.btnOff : localeStr.btnOn;
                            widget.store.lockRotate = !isLock;
                            callToast('${localeStr.sideBtnLockRotate}($value)');
                            break;
                          default:
                            break;
                        }
                        if (widget.scaffoldKey.currentState.isDrawerOpen)
                          Navigator.of(context).pop();
                      },
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isCollapsed = !isCollapsed;
                    isCollapsed
                        ? _animationController.reverse()
                        : _animationController.forward();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: AnimatedIcon(
                    icon: AnimatedIcons.view_list,
                    color: themeColor.iconSubColor1,
                    progress: _animationController,
                    size: 30.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
