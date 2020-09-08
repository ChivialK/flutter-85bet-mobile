import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';

///
/// Image player with arrow indicator
///
/// Widget origin from lib: carousel_pro
/// https://pub.dev/packages/carousel_pro
///
/// Transition animation from:
/// https://dotblogs.com.tw/pou/2019/10/05/162115
/// (Replace scroll animation to fade effect)
/// add offset change listener and use [PageView.builder]
///
class CustomizeCarousel extends StatefulWidget {
  //All the images on this Carousel.
  final List images;

  //All the images on this Carousel.
  final defaultImage;

  //The transition animation timing curve. Default is [Curves.ease]
  final Curve animationCurve;

  //The transition animation duration. Default is 300ms.
  final Duration animationDuration;

  // Enable or Disable the indicator (dots). Default is true
  final bool showIndicator;

  // The base size of the dots. Default is 8.0
  final double indicatorSize;

  // The Color of Arrow Indicator
  final Color indicatorColor;

  //Move the Indicator Vertically relative to the widget
  final EdgeInsetsGeometry indicatorPadding;

  //How to show the images in the box. Default is cover
  final BoxFit boxFit;

  //Enable/Disable radius Border for the images. Default is false
  final bool borderRadius;

  //Border Radius of the images. Default is [Radius.circular(8.0)]
  final Radius radius;

  //Enable/Disable Image Overlay Shadow. Default false
  final bool overlayShadow;

  //Choose the color of the overlay Shadow color. Default Colors.grey[800]
  final Color overlayShadowColors;

  //Choose the size of the Overlay Shadow, from 0.0 to 1.0. Default 0.5
  final double overlayShadowSize;

  //Enable/Disable the auto play of the slider. Default true
  final bool autoplay;

  //Duration of the Auto play slider by seconds. Default 3 seconds
  final Duration autoplayDuration;

  //On image tap event, passes current image index as an argument
  final void Function(int) onImageTap;

  //On image change event, passes previous image index and current image index as arguments
  final void Function(int, int) onImageChange;

  //Jump to first page instead of animate, default is false
  final bool jumpOnEndPage;

  CustomizeCarousel({
    this.images,
    this.animationCurve = Curves.ease,
    this.animationDuration = const Duration(milliseconds: 300),
    this.showIndicator = true,
    this.indicatorSize = 24.0,
    this.indicatorColor = Colors.white,
    this.indicatorPadding = EdgeInsets.zero,
    this.boxFit = BoxFit.cover,
    this.borderRadius = false,
    this.radius,
    this.overlayShadow = false,
    this.overlayShadowColors,
    this.overlayShadowSize = 0.5,
    this.autoplay = true,
    this.autoplayDuration = const Duration(seconds: 3),
    this.onImageTap,
    this.onImageChange,
    this.defaultImage,
    this.jumpOnEndPage = false,
  });

  @override
  State createState() => CustomizeCarouselState();
}

class CustomizeCarouselState extends State<CustomizeCarousel>
    with AfterLayoutMixin {
  bool _validAuto = false;
  Timer _autoTimer;
  Timer _continueTimer;

  PageController _controller = PageController();
  double _screenWidth = 0.0;
  double _pageOffset = 0.0;
  int _currentImageIndex = 0;

  void _offsetChanged() {
    // 每次的移動都重新計算對應的偏移值與特效
    setState(() {
      _pageOffset = _controller.offset / _screenWidth;
    });
  }

  void _preImage() {
    if (_controller.hasClients) {
      if (_controller.page.floor() == 0) {
        _controller.animateToPage(
          widget.images.length - 1,
          duration: widget.animationDuration,
          curve: widget.animationCurve,
        );
      } else {
        _controller.previousPage(
            duration: widget.animationDuration, curve: widget.animationCurve);
      }
    }
  }

  void _nextImage() {
    if (_controller.hasClients) {
      if (_controller.page.ceil() == widget.images.length - 1) {
        if (widget.jumpOnEndPage) {
          _controller.jumpToPage(0);
        } else {
          _controller.animateToPage(
            0,
            duration: widget.animationDuration,
            curve: widget.animationCurve,
          );
        }
      } else {
        _controller.nextPage(
            duration: widget.animationDuration, curve: widget.animationCurve);
      }
    }
  }

  void _startAutoPlay() {
    if (_validAuto) {
      _continueTimer?.cancel();
      _continueTimer = null;
      _autoTimer = Timer.periodic(widget.autoplayDuration, (_) => _nextImage());
    }
  }

  void _pauseAutoPlay() {
    _continueTimer?.cancel();
    if (_autoTimer != null && _autoTimer.isActive) {
      _autoTimer.cancel();
      _autoTimer = null;
    }
    if (_validAuto) {
      _continueTimer = Timer(Duration(seconds: 3), () {
        _nextImage();
        _startAutoPlay();
      });
    }
  }

  @override
  void initState() {
    _screenWidth = Global.device.width;
    _validAuto =
        widget.images != null && widget.images.length > 1 && widget.autoplay;
    super.initState();
    _controller.addListener(_offsetChanged);
  }

  @override
  void didUpdateWidget(CustomizeCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    _validAuto =
        widget.images != null && widget.images.length > 1 && widget.autoplay;
    if (_validAuto && (_autoTimer == null || _autoTimer.isActive == false))
      _startAutoPlay();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller = null;
    _autoTimer?.cancel();
    _autoTimer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> listImages =
        (widget.images != null && widget.images.isNotEmpty)
            ? widget.images.map<Widget>(
                (netImage) {
                  if (netImage is ImageProvider) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: widget.borderRadius
                            ? BorderRadius.all(widget.radius != null
                                ? widget.radius
                                : Radius.circular(8.0))
                            : null,
                        image: DecorationImage(
                          //colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                          image: netImage,
                          fit: widget.boxFit,
                        ),
                      ),
                      child: widget.overlayShadow
                          ? Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.center,
                                  stops: [0.0, widget.overlayShadowSize],
                                  colors: [
                                    widget.overlayShadowColors != null
                                        ? widget.overlayShadowColors
                                            .withOpacity(1.0)
                                        : Colors.grey[800].withOpacity(1.0),
                                    widget.overlayShadowColors != null
                                        ? widget.overlayShadowColors
                                            .withOpacity(0.0)
                                        : Colors.grey[800].withOpacity(0.0)
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                    );
                  } else {
                    return netImage;
                  }
                },
              ).toList()
            : [
                widget.defaultImage is ImageProvider
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: widget.borderRadius
                              ? BorderRadius.all(widget.radius != null
                                  ? widget.radius
                                  : Radius.circular(8.0))
                              : null,
                          image: DecorationImage(
                            //colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                            image: widget.defaultImage,
                            fit: widget.boxFit,
                          ),
                        ),
                        child: widget.overlayShadow
                            ? Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.center,
                                    stops: [0.0, widget.overlayShadowSize],
                                    colors: [
                                      widget.overlayShadowColors != null
                                          ? widget.overlayShadowColors
                                              .withOpacity(1.0)
                                          : Colors.grey[800].withOpacity(1.0),
                                      widget.overlayShadowColors != null
                                          ? widget.overlayShadowColors
                                              .withOpacity(0.0)
                                          : Colors.grey[800].withOpacity(0.0)
                                    ],
                                  ),
                                ),
                              )
                            : Container(),
                      )
                    : widget.defaultImage,
              ];

    return Stack(
      children: [
        Container(
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              // 計算每次異動時左邊的 Page 是哪個 index
              var currentLeftPageIndex = _pageOffset.floor();
              // 計算現在畫面 Offset 佔的比例
              var currentPageOffsetPercent = _pageOffset - currentLeftPageIndex;
              // 加入移動的特效
              return Transform.translate(
                // 因爲是水平滑動，所以設定 offset 的 X 值，因爲 Page 固定不動
                // 所以要先用 pageOffset 減去 index 得到 負數
                // 如果是垂直滑動，請設定 offset 的 Y 值
                offset: Offset((_pageOffset - index) * _screenWidth, 0),
                // 加入調整透明度效果
                child: Opacity(
                  // 如果現在左邊的 index 等於正要建立的 index，則讓它透明度變淡，因爲它要退出畫面了
                  // 相反地是要顯示，則使用原本的 currentPageOffsetPercent
                  opacity: currentLeftPageIndex == index
                      ? 1 - currentPageOffsetPercent
                      : currentPageOffsetPercent,
                  child: GestureDetector(
                    onTap: () => widget.onImageTap(index),
                    child: listImages[index],
                  ),
                ),
              );
            },
            onPageChanged: (currentPage) {
              if (widget.onImageChange != null) {
                widget.onImageChange(_currentImageIndex, currentPage);
              }
              _currentImageIndex = currentPage;
            },
          ),
        ),
        if (widget.showIndicator && listImages.length > 1)
          Padding(
            padding: widget.indicatorPadding,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_left),
                  iconSize: widget.indicatorSize,
                  color: widget.indicatorColor,
                  onPressed: () {
                    _pauseAutoPlay();
                    _preImage();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_right),
                  iconSize: widget.indicatorSize,
                  color: widget.indicatorColor,
                  onPressed: () {
                    _pauseAutoPlay();
                    _nextImage();
                  },
                )
              ],
            ),
          ),
      ],
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    _startAutoPlay();
  }
}
