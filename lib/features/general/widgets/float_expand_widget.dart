import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';

int _sharedIndex;

///
/// Customized open source widget
/// @author: Emile Pavie-Olivier
/// github: https://github.com/PavieOlivier/AdvFab
/// ref: https://www.emilecode.com/flutter-more-than-just-a-floating-action-button/
///
class FloatExpandController {
  ///Will return true if the AdvFab is collapsed and false otherwise
  bool isCollapsed = true;

  ///Use this to expand The floating action button
  Function expandFAB;

  ///Use this to collapse the floating action button
  Function collapseFAB;

  ///Use this to expand container height
  double _heightToExpandTo;

  Widget _expandedWidget;
  MainAxisAlignment _expendedContainerMainAxisAlignment;
  CrossAxisAlignment _expendedContainerCrossAxisAlignment;
  Color _expendedColor;

  ///Use this to set the widget that will appear one the AdvFab is expended.
  ///If a widget was previously set, the previous/old widget will get overridden
  ///in favor of the new one
  ///
  /// [IMPORTANT:] The value of the heightToExpend must be given
  /// in the range [15...70] (percentage of the screen in the vertical );
  /// crossing these value might result in unexpected behavior.
  ///
  /// [NOTE:] By default AdvFab will not allow you to set customHeight outside the given range;
  /// to set set custom height set the property 'forceCustomHeight' to `true`.
  void setExpandedWidgetConfiguration({
    MainAxisAlignment expendedContainerMainAxisAlignment =
        MainAxisAlignment.start,
    CrossAxisAlignment expendedContainerCrossAxisAlignment =
        CrossAxisAlignment.center,
    Color expendedBackgroundColor,
    @required Widget withChild,
    double heightToExpandTo,
    bool showLogs = false,
    bool forceCustomHeight = false,
  }) {
    //set the main and cross axis alignment
    _expendedContainerMainAxisAlignment = expendedContainerMainAxisAlignment;
    _expendedContainerCrossAxisAlignment = expendedContainerCrossAxisAlignment;
    //set the color when expanded
    if (expendedBackgroundColor == null) {
      if (showLogs == true) {
        debugPrint(
            'AdvFab: A custom background color was not set for expanded widget' +
                '\n using the collapsed background color instead ');
      }
    } else {
      _expendedColor = expendedBackgroundColor;
    }

    // we actually remove the widget once we decide to configure it again
    if (forceCustomHeight == false) {
      if (heightToExpandTo < 15 || heightToExpandTo > 70) {
        debugPrint(
            '\n!==[AdvFab WARNING]==!\n[== The height percentage your provided is not withing the acceptable range [15...80], this might cause unexpected behaviour ==]\n[== Setting up default value of 15% to the screen height  ==]\n!==[NOTE]==!\n[== Set "forceCustomHeight" to true if you really want to use values outside the range ==]');
        _heightToExpandTo = 15;
      } else {
        _heightToExpandTo = heightToExpandTo;
      }
    } else {
      _heightToExpandTo = heightToExpandTo;
    }
    if (_expandedWidget != null) {
      _expandedWidget = null;
      _expandedWidget = withChild;
    } else {
      _expandedWidget = withChild;
    }
  }
}

///Welcome
class FloatExpandWidget extends StatefulWidget {
  ///Is set to `false` by default, make sure that [useAsFloatingActionButton = false] and
  ///[useNavigationBar = false] if you want to use it
  ///
  ///[IMPORTANT:] Scaffold -> FLoatingActionButton -> AdvFab
  final bool useAsFloatingSpaceBar;

  ///Is set to `true` by default, make sure that [useNavigationBar = false] and
  ///[useFloatingSpaceBar = false] if you want to use it
  final bool useAsFloatingActionButton;

  //for the Space Bar
  ///The widget to display inside the space bar while animate
  final Widget spaceBarWidget;

  ///The width the spacebar will occupy on the screen ( in percentage )
  final double floatingSpaceBarContainerWidth;

  //==for the floating action button==\\
  ///The width the floating Action Button will occupy on the screen ( in percentage )
  final double floatingActionButtonContainerWidth;

  ///The height the floating Action Button will occupy on the screen ( in percentage )
  final double floatingActionButtonContainerHeight;

  ///The width the floating Action Button will occupy on the screen once expended
  ///to rectangular form ( in percentage )
  final double floatingActionButtonExpendedWidth;

  ///Defines the action to be performed once the floating Action Button is pressed
  final Function onFloatingActionButtonTapped;

  ///The icon to display inside the floating action button
  final IconData floatingActionButtonIcon;

  ///The icon scale to resize the icon inside the floating action button
  final double floatingActionButtonIconScale;

  ///The icon size factor to adjust the size inside the floating action button
  final double floatingActionButtonIconSizeFactor;

  ///The color of the icon displayed inside of the floating action button
  final Color floatingActionButtonIconColor;

  ///The duration of the expanding animation in milliseconds
  final Duration animationDuration;

  ///The duration of the color change animetion.
  ///
  ///[Note]: Will not support hot reloading
  final Duration tweenColorAnimationDuration;

  ///The color of the AdvFab before expanding
  final Color collapsedColor;

  ///The animation curve when expanding
  final Curve expandingAnimationCurve;

  ///The animation curve when collapsing
  final Curve collapsingAnimationCurve;

  /// The controller of the class
  final FloatExpandController controller;

  /// use elevation only for floating action button
  final bool useElevation;

  /// Set to false by default; use it for Debuging,
  /// warnings and errors will always be debugPrinted
  final bool showLogs;

  const FloatExpandWidget({
    Key key,
    this.tweenColorAnimationDuration = const Duration(milliseconds: 250),
    this.collapsingAnimationCurve = Curves.fastLinearToSlowEaseIn,
    this.expandingAnimationCurve = Curves.fastLinearToSlowEaseIn,
    this.animationDuration = const Duration(milliseconds: 350),
    this.floatingActionButtonIconColor = Colors.black38,
    this.floatingActionButtonIcon = Icons.warning,
    this.floatingActionButtonIconScale = 1.0,
    this.floatingActionButtonIconSizeFactor = 10.0,
    this.floatingActionButtonContainerWidth = 16.65,
    this.floatingActionButtonContainerHeight = 7.5,
    this.floatingActionButtonExpendedWidth = 50,
    this.floatingSpaceBarContainerWidth = 92,
    this.useAsFloatingActionButton = true,
    this.collapsedColor = Colors.black12,
    this.useAsFloatingSpaceBar = false,
    this.onFloatingActionButtonTapped,
    this.useElevation = false,
    this.showLogs = false,
    this.spaceBarWidget,
    this.controller,
  }) : super(key: key);

  @override
  _FloatExpandWidgetState createState() => _FloatExpandWidgetState();
}

class _FloatExpandWidgetState extends State<FloatExpandWidget>
    with SingleTickerProviderStateMixin {
  AnimationController tweenAnimationController;
  int selectedIconIndex;
  Animation<Color> animatedColor;
  ColorTween colorTween;
  List<Widget> iconConstructor = [];
  Widget expandedWidget;
  bool isExpanding = false, isExpanded = false;
  double expandedChildOpacityValue = 0, expandedIconOpacity = 1;

  @override
  void initState() {
    super.initState();
    selectedIconIndex = _sharedIndex;

    tweenAnimationController = AnimationController(
      vsync: this,
      duration: widget.tweenColorAnimationDuration,
    );
    colorTween = ColorTween(
      begin: widget.collapsedColor,
      end: widget.controller._expendedColor ?? widget.collapsedColor,
    );
    animatedColor = colorTween.animate(tweenAnimationController)
      ..addListener(() {
        setState(() {});
      });

    if (widget.controller != null) {
      widget.controller._expendedColor ??= widget.collapsedColor;
      widget.controller.expandFAB = expandFAB;
      widget.controller.collapseFAB = closeFAB;
    }
    verifyRequestedSetting();
  }

  @override
  void dispose() {
    tweenAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _Size.init();
    if (widget.controller != null &&
        widget.controller._expandedWidget == null) {}
    return GestureDetector(
      onTap: () {
        if (widget.useAsFloatingActionButton == true) {
          if (widget.onFloatingActionButtonTapped == null) {
            debugPrint(
                '\n==[WRONG CONFIGURATION ERROR]==\nThe parameter "onFloatingActionButtonTapped" was not defined by you; please initialize it on the constructor' +
                    '\n==[Indication]==\nWhen the parameter "useAsFloatingActionButton" is set to true, "onFloatingActionButtonTapped" must be defined and not be null');
          } else {
            if (widget.showLogs == true) {
              debugPrint('AdvFab: FloatingActionButton pressed');
              debugPrint(
                  'AdvFab: calling the method "onFloatingActionButtonTapped"');
            }
            if (widget.controller.isCollapsed == true) {
              widget.onFloatingActionButtonTapped();
            } else {
              if (widget.showLogs == true) {
                debugPrint(
                    'AdvFab: cannot perform tapped action\nReason: When the FAB is expanded no action gets performed until it gets collapsed');
              }
            }
          }
        }
      },
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0),
          child: AnimatedContainer(
            curve: widget.controller.isCollapsed
                ? widget.expandingAnimationCurve
                : widget.collapsingAnimationCurve,
            duration: widget.animationDuration,
            width: // check if we need to use circular shape , is true we also check if we are expanding
                widget.useAsFloatingActionButton
                    ? isExpanding
                        ? (_Size.width / 100) *
                            widget.floatingActionButtonExpendedWidth
                        : (_Size.width / 100) *
                            widget.floatingActionButtonContainerWidth
                    :
                    //if no, we check if the spacebar has to be used
                    widget.useAsFloatingSpaceBar
                        ? (_Size.width / 100) *
                            widget.floatingSpaceBarContainerWidth
                        : (_Size.width / 100) *
                            widget.floatingSpaceBarContainerWidth,
            height: isExpanding
                ? (_Size.height / 100) * widget.controller._heightToExpandTo
                : (_Size.height / 100) *
                    widget.floatingActionButtonContainerHeight,
            decoration: BoxDecoration(
                color: animatedColor.value,
                borderRadius: isExpanding
                    ? BorderRadius.circular(40)
                    : BorderRadius.circular(60),
                boxShadow: widget.useElevation
                    ? [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 3),
                            blurRadius: 4.5,
                            spreadRadius: 1.4)
                      ]
                    : null),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: isExpanded
                    ? widget.controller._expendedContainerMainAxisAlignment
                    : MainAxisAlignment.center,
                crossAxisAlignment: isExpanded
                    ? widget.controller._expendedContainerCrossAxisAlignment
                    : CrossAxisAlignment.center,
                children: <Widget>[
                  // 1st the Icons :)
                  isExpanded
                      ? SizedBox()
                      : AnimatedOpacity(
                          opacity: expandedIconOpacity,
                          duration: widget.animationDuration,
                          child: widget.useAsFloatingSpaceBar
                              ? widget.spaceBarWidget
                              : widget.useAsFloatingActionButton
                                  ? Center(
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Transform.scale(
                                          scale: widget
                                              .floatingActionButtonIconScale,
                                          child: Icon(
                                            widget.floatingActionButtonIcon,
                                            color: widget
                                                .floatingActionButtonIconColor,
                                            size: _Size.safeBlockHorizontal *
                                                widget
                                                    .floatingActionButtonIconSizeFactor,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Center(
                                      child: Icon(
                                        Icons.warning,
                                        color: Colors.red,
                                      ),
                                    ),
                        ),

                  // now if expanded
                  isExpanded
                      ? AnimatedOpacity(
                          opacity: expandedChildOpacityValue,
                          duration: Duration(milliseconds: 230),
                          child: widget.controller._expandedWidget,
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void expandFAB() async {
    if (widget.showLogs == true) {
      debugPrint('AdvFab: Checking initial expanded widget configuration ');
    }
    if (widget.controller._expendedContainerCrossAxisAlignment == null ||
        widget.controller._expendedContainerMainAxisAlignment == null) {
      debugPrint(
          '\n==[WRONG CONFIGURATION ERROR]==\n"setExpandedWidgetConfiguration" of "AdvFabController"has to be called at least once during the lifetime of your application' +
              '\n==[Indication]==\nCall AdvFabController.setExpandedWidgetConfiguration(<<configure widget here>>) to tell the AdvFab wich widget shall be displayed once it is expanded\n' +
              'Then call the method "expandFAB" again');

      return null;
    }
    if (widget.showLogs == true) {
      debugPrint('AdvFab: Trying to perfom expansion');
      debugPrint('AdvFab: Awaiting for a color change (if any)');
    }
    await changeTweenColor();
    if (widget.showLogs == true) {
      debugPrint('AdvFab: color change awaited successfully');
      debugPrint('AdvFab: performing expansion');
    }
    await startExpanding().then((value) {
      Future.delayed(widget.animationDuration, () {
        isExpanded = true;

        if (mounted) {
          setState(() {});
        }
        Future.delayed(Duration(milliseconds: 100), () {
          setState(() {
            expandedChildOpacityValue = 1;
          });
          widget.controller.isCollapsed = false;
        });
        if (mounted) {
          setState(() {});
        }
      });
    });
    if (widget.showLogs == true) {
      debugPrint('AdvFab: widget expanded successfully');
    }
  }

  void closeFAB() async {
    if (widget.showLogs == true) {
      debugPrint('AdvFab: Trying to perfom collapse ');
      debugPrint('AdvFab: Awaiting for a color change (if any)');
      debugPrint('AdvFab: Collapsing');
    }
    await collapseFAB().then((value) {
      Future.delayed(widget.animationDuration, () {
        isExpanding = false;
        isExpanded = false;
        tweenAnimationController.reverse().then((value) {
          if (mounted) {
            setState(() {});
          }
          Future.delayed(Duration(milliseconds: 200), () {
            setState(() {
              expandedChildOpacityValue = 0;
              expandedIconOpacity = 1;
              widget.controller.isCollapsed = true;
            });
          });
        });
      });
    });
    if (widget.showLogs == true) {
      debugPrint('AdvFab: Widget collapsed successfully');
    }
  }

  // to animate the color transition
  Future<ColorTween> changeTweenColor() async {
    colorTween = ColorTween(
      begin: widget.collapsedColor,
      end: widget.controller._expendedColor ?? widget.collapsedColor,
    );
    animatedColor = colorTween.animate(tweenAnimationController)
      ..addListener(() {
        setState(() {});
      });
    if (widget.showLogs == true) {
      debugPrint('AdvFab: background Color changed ');
    }
    return colorTween;
  }

  // this is to handle the animation collapse
  Future<bool> collapseFAB() async {
    if (widget.showLogs == true) {
      debugPrint(
          'AdvFab: Colors reversed (if no color was specified by you, then default value were applied)');
    }
    if (mounted) {
      setState(() {
        expandedChildOpacityValue = 0;
        // expandedIconOpacity = 1;
      });
    }
    //tweenAnimationConroller.reverse();
    return isExpanding;
  }

  //this is to handle the animation expansion
  Future<bool> startExpanding() async {
    isExpanding = true;
    expandedIconOpacity = 0;
    tweenAnimationController.forward();
    if (mounted) {
      setState(() {});
    }
    return isExpanding;
  }

  //this is to handle the navigation bar button
  int onNavigatorIconTapped(int index) {
    _sharedIndex = index;
    selectedIconIndex = _sharedIndex;

    if (mounted) setState(() {});
    return index;
  }

//Handle the verification of the right setting
  void verifyRequestedSetting() {
    if (widget.useAsFloatingActionButton == true &&
        widget.useAsFloatingSpaceBar == true) {
      debugPrint(
          '\n==[WRONG CONFIGURATION ERROR]==\nThe parameters "useAsFloatingActionButton", "useFloatingSpaceBar" and "useNavigationbar" are all set to true ' +
              '\n==[Indication]==\nSet only one of these paramaters to true and the rest to false');
    }
    if (widget.useAsFloatingActionButton == false &&
        widget.useAsFloatingSpaceBar == false) {}

    if (widget.useAsFloatingActionButton == true) {
      if (widget.onFloatingActionButtonTapped == null) {
        // the floating action button is selected but this argument is not specified
        // do ou need
        debugPrint(
            '\n==[WRONG CONFIGURATION ERROR]==\nThe parameter "onFloatingActionButtonTapped" was not defined by you; please initialize it on the constructor' +
                '\n==[Indication]==\nWhen the parameter "useAsFloatingActionButton " is set to true, "onFloatingActionButtonTapped " must be defined and not be null');
      }
      if (widget.floatingActionButtonIcon == null) {
        // you wanna use a floating action button but there is Icon on it
        debugPrint(
            '\n==[WRONG CONFIGURATION ERROR]==\nThe parameter "floatingActionButtonIcon" was not defined by you; please initialize it on the constructor' +
                '\n==[Indication]==\nWhen the parameter "useAsFloatingActionButton " is set to true, "floatingActionButtonIcon" must be defined and not be null');
      }
    }
    if (widget.useAsFloatingSpaceBar == true) {
      if (widget.spaceBarWidget == null) {
        // you did set a floating spacebar , without a widget inside of it
        debugPrint(
            '\n==[WRONG CONFIGURATION ERROR]==\nThe parameter "spacebarWidget" was not defined by you; please initialize it on the constructor' +
                '\n==[Indication]==\nWhen the parameter "useFloatingSpaceBar" is set to true, "spacebarWidget" must be defined and not be null ');
      }
    }
  }
}

///======= [The size config of the code]
///Another work in progress
///Originally adapted from the DevCam developper
/// but i made some changes to make it feel my needs better
class _Size {
  ///this is the width of the screen
  static double width;

  ///this is the height of the screen
  static double height;

  //for my internal use
  static double _safeAreaHorizontal;

  /// This is 1% of the screen on the horizontal by considering the safe Area
  static double safeBlockHorizontal;

  ///Use this Only once inside the build method, preferably on the 1st screen and never call it again during the life time of your app
  static void init() {
    width = Global.device.width;
    height = Global.device.height;
    _safeAreaHorizontal = Global.device.safeHorizontalPadding;
    safeBlockHorizontal = (width - _safeAreaHorizontal) / 100;
  }
}
