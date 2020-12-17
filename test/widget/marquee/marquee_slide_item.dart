import 'package:flutter/material.dart';
import 'marquee_slide_direction.dart';

// ignore: must_be_immutable
class MarqueeSlideItem extends StatefulWidget {
  ///這是text的具體內容
  final String text;

  ///文字的顏色
  Color textColor;

  ///文字的大小
  final double textSize;

  ///如果沒有文字，也可以自定義內容
  final Widget child;

  ///這個是爲了監聽值變化來重新整理頁面的，否則頁面的state只會初始化一遍
  ///必須指定，否則不會執行動畫，或者動畫只執行一次
  final ValueNotifier<bool> modeListener;

  ///按鈕事件
  final VoidCallback onPress;

  ///動畫的方向
  final MarqueeSlideDirection animationDirection;

  ///移動的距離
  double animateDistance;

  /// 跑馬燈的切換時長 預設是500毫秒
  final int itemDuration;

  ///是否單行顯示，預設是多行的
  final bool singleLine;

  bool get mode => this.modeListener.value;

  set mode(bool mode) => this.modeListener.value = mode;

  MarqueeSlideItem(
      {Key key, //必須傳key，否則動畫只會走一次
      this.text,
      Color textColor,
      double textSize,
      ValueNotifier<bool> modeListener,
      MarqueeSlideDirection animationDirection,
      this.onPress,
      this.animateDistance,
      int itemDuration,
      this.child,
      bool singleLine})
      :
        // assert(modeListener != null),
        this.modeListener = modeListener ?? ValueNotifier(false),
        this.textColor = textColor ?? Colors.black,
        this.textSize = textSize ?? 14.0,
        this.animationDirection =
            animationDirection ?? MarqueeSlideDirection.b2t,
        this.itemDuration = itemDuration ?? 500,
        this.singleLine = !singleLine ?? true,
        super(key: key);

  @override
  WalkthroughState createState() => WalkthroughState();
}

class WalkthroughState extends State<MarqueeSlideItem>
    with SingleTickerProviderStateMixin {
  Animation animation;
  Animation transformAnimation;
  AnimationController animationController;

  Function _updateListener;
  Tween inTween;
  Tween outTween;

  ///是否是x軸移動
  bool isXAnim = false;

  void _updateAnim() {
    switch (widget.animationDirection) {
      case MarqueeSlideDirection.t2b:
        inTween = Tween(begin: -widget.animateDistance, end: 0.0);
        outTween = Tween(begin: 0.0, end: widget.animateDistance);
        isXAnim = false;
        break;
      case MarqueeSlideDirection.b2t:
        inTween = Tween(begin: widget.animateDistance, end: 0.0);
        outTween = Tween(begin: 0.0, end: -widget.animateDistance);
        isXAnim = false;
        break;
      case MarqueeSlideDirection.l2r:
        inTween = Tween(begin: -widget.animateDistance, end: 0.0);
        outTween = Tween(begin: 0.0, end: widget.animateDistance);
        isXAnim = true;
        break;

      case MarqueeSlideDirection.r2l:
        inTween = Tween(begin: widget.animateDistance, end: 0.0);
        outTween = Tween(begin: 0.0, end: -widget.animateDistance);
        isXAnim = true;
        break;
      default:
        inTween = Tween(begin: widget.animateDistance, end: 0.0);
        outTween = Tween(begin: 0.0, end: -widget.animateDistance);
        isXAnim = false;
        break;
    }
    _updateAnimController();
  }

  void _updateAnimController() {
    _updateListener = () {
      setState(() {
        if (widget.modeListener.value) {
          transformAnimation = outTween.animate(CurvedAnimation(
              parent: animationController, curve: Curves.easeInOut));

          animationController.reset();
          animationController.forward();
        }
      });
    };
    widget.modeListener.addListener(_updateListener);

    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.itemDuration))
      ..addListener(() {});

    transformAnimation = inTween.animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut))
      ..addListener(() => setState(() {}));

    animationController.forward();
  }

  @override
  void initState() {
    super.initState();
    _updateAnim();
  }

  @override
  void dispose() {
    widget.modeListener.removeListener(_updateListener);
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget current;
    Matrix4 transform = isXAnim
        ? new Matrix4.translationValues(transformAnimation.value, 0, 0)
        : new Matrix4.translationValues(0, transformAnimation.value, 0);

    // ..scale(Vector3(
    //     animation.value, animation.value, animation.value)),
    ///也可以用下面的矩陣的用法，可以參考我的文章：
    /// https://www.jianshu.com/p/cc2f9a088fc9
    /// https://juejin.im/post/5be2fd9e6fb9a04a0e2cace0
    //  Matrix4(animation.value, 0, 0, 0, 0, animation.value, 0,
    //     0, 0, 0, 1, 0, 0, transformAnimation.value, 0, 1)
    if (widget.child != null) {
      if (widget.onPress != null) {
        current = GestureDetector(
            onTap: widget.onPress,
            child: Container(child: widget.child, transform: transform));
      } else {
        current = Container(child: widget.child, transform: transform);
      }
    } else {
      current = GestureDetector(
          onTap: widget.onPress,
          child: Container(
            child: Text(
              widget.text,
              softWrap: widget.singleLine,
              style:
                  TextStyle(fontSize: widget.textSize, color: widget.textColor),
            ),
            transform: transform,
          ));
    }
    return current;
  }
}
