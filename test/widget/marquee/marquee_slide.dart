import 'package:flutter/material.dart';
import 'dart:async'; //Timer
import 'marquee_slide_item.dart';
import 'marquee_slide_direction.dart';

typedef Widget WidgetMaker<T>(BuildContext context, T item);

class MarqueeSlide extends StatefulWidget {
  /// 跑馬燈的具體類容
  final List<Widget> children;

  ///  text 的具體內容
  final List<String> texts;

  /// 目前正在跑的文字的顏色
  /// 只在texts有值時生效
  final Color seletedTextColor;

  /// 正常的文字顏色
  /// 只在texts有值時生效
  final Color textColor;

  /// 跑馬燈的切換時長 預設是4秒
  final int duration;

  /// 跑馬燈的切換時長 預設是500毫秒
  final int itemDuration;

  ///是否自動開始
  final bool autoStart;

  ///動畫顯示的切換方式，預設是從上往下切換
  final MarqueeSlideDirection animationDirection;

  ///移動的距離
  ///如果沒有設定就是預設獲取元件寬高，橫向動畫就是組建的寬度，縱向的就是元件的高度
  final double animateDistance;

  ///是否是單行顯示
  final bool singleLine;

  ///點選事件回撥
  final ValueChanged<int> onChange;

  MarqueeSlide(
      {this.children,
      this.texts,
      Color selectedTextColor,
      Color textColor,
      int duration,
      double itemDuration,
      bool autoStart,
      MarqueeSlideDirection animationDirection,
      this.animateDistance,
      this.onChange,
      bool singleLine})
      : assert(children != null || texts != null),
        assert(onChange != null),
        this.duration = duration ?? 4,
        this.itemDuration = itemDuration ?? 500,
        this.autoStart = autoStart ?? true,
        this.singleLine = singleLine ?? true,
        this.textColor = textColor ?? Colors.black,
        this.seletedTextColor = selectedTextColor ?? Colors.black,
        this.animationDirection =
            animationDirection ?? MarqueeSlideDirection.b2t;

  @override
  State<StatefulWidget> createState() {
    return _MarqueeSlide();
  }
}

class _MarqueeSlide extends State<MarqueeSlide> {
  Timer _timer;
  int currentPage = 0;
  bool lastPage = false;
  double animateDistance;

  List<MarqueeSlideItem> items = <MarqueeSlideItem>[];
  Map<int, GlobalKey<WalkthroughState>> itemKeyMap;

  MarqueeSlideItem firstItem;
  MarqueeSlideItem secondItem;

  @override
  void initState() {
    itemKeyMap = new Map();
    super.initState();
    if (widget.texts != null) {
      for (var i = 0; i < widget.texts.length; i++) {
        GlobalKey key = new GlobalKey<WalkthroughState>(debugLabel: 'item$i');
        itemKeyMap[i] = key;
        items.add(new MarqueeSlideItem(
          key: key,
          child: Text(
            widget.texts[i],
          ),
          // text: widget.texts[i],
          onPress: () {
            widget.onChange(i);
          },
          singleLine: widget.singleLine,
          animationDirection: widget.animationDirection,
          animateDistance: widget.animateDistance,
          itemDuration: widget.itemDuration,
        ));
      }
    } else {
      for (var i = 0; i < widget.children.length; i++) {
        items.add(new MarqueeSlideItem(
          child: widget.children[i],
          // text: widget.texts[i],
          onPress: () {
            widget.onChange(i);
          },
          singleLine: widget.singleLine,
          animationDirection: widget.animationDirection,
          animateDistance: widget.animateDistance,
          itemDuration: widget.itemDuration,
        ));
      }
    }

    firstItem = items[0];

    // if (widget.datas != null && widget.datas.length == 1) {}
    // if (widget.datas != null && widget.datas.length == 1 ||
    // widget.texts.length == 1) {}
    if (widget.autoStart) {
      _timer = Timer.periodic(Duration(seconds: widget.duration), (timer) {
        this.setState(() {
          currentPage++;
          if (currentPage >= items.length) {
            //last item
            currentPage = 0;
            firstItem = items[items.length - 1]..modeListener.value = true;
            secondItem = items[currentPage]..modeListener.value = false;
          } else if (currentPage <= 0) {
            // first item
            currentPage = items.length - 1;
            firstItem = items[0]..modeListener.value = true;
            secondItem = items[currentPage]..modeListener.value = false;
          } else {
            firstItem = items[currentPage - 1]..modeListener.value = true;
            secondItem = items[currentPage]..modeListener.value = false;
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ///設定動畫的寬度或者高度
    if (widget.animateDistance == null) {
      if (widget.animationDirection == MarqueeSlideDirection.l2r ||
          widget.animationDirection == MarqueeSlideDirection.l2r) {
        double width = MediaQuery.of(context).size.width;
        firstItem.animateDistance = width;
        if (secondItem != null) {
          secondItem.animateDistance = width;
        }
      } else {
        double height = MediaQuery.of(context).size.height;
        firstItem.animateDistance = height;
        if (secondItem != null) {
          secondItem.animateDistance = height;
        }
      }
    }
    List<MarqueeSlideItem> items = secondItem == null
        ? <MarqueeSlideItem>[firstItem..textColor = widget.seletedTextColor]
        : <MarqueeSlideItem>[
            secondItem..textColor = widget.seletedTextColor,
            firstItem..textColor = widget.textColor
          ];

    return ClipRect(
        child: Center(
      child: Stack(
        children: items,
      ),
    ));
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
    }
    super.dispose();
  }
}
