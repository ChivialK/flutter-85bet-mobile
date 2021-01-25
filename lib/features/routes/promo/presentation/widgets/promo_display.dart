import 'package:after_layout/after_layout.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/tabs_page_control_widget.dart';

import '../../data/models/promo_category.dart';
import '../../data/models/promo_freezed.dart';
import 'promo_detail.dart';
import 'promo_list_view.dart';

/// Display promo category and items
/// [promos] = data from repository
/// [showPromoId] = promo's id when home page banner was clicked
class PromoDisplay extends StatefulWidget {
  final List<PromoEntity> promos;
  final int showPromoId;

  const PromoDisplay(this.promos, {this.showPromoId = -1});

  @override
  _PromoDisplayState createState() => _PromoDisplayState();
}

class _PromoDisplayState extends State<PromoDisplay>
    with SingleTickerProviderStateMixin, AfterLayoutMixin {
  TabController _tabController;
  PageController _pageController;

  List<PromoCategoryEnum> categories = [
    PromoCategoryEnum.fish,
    PromoCategoryEnum.slot,
    PromoCategoryEnum.live,
    PromoCategoryEnum.sport,
    PromoCategoryEnum.lottery,
    PromoCategoryEnum.other
  ];

  double tabItemWidth;

  PromoCategoryEnum _current;
  Widget contentWidget;
  int target = -1;

  /// Set [_current] to change tab bar item color
  void _setActiveTabIndex() {
    // set state to change tab's image color
    _current = categories[_tabController.index];
    setState(() {});
  }

  @override
  void initState() {
    categories.removeWhere((element) =>
        widget.promos
            .any((promo) => promo.postCategoryId == element.value.id) ==
        false);
    categories.insert(0, PromoCategoryEnum.all);
    _current = PromoCategoryEnum.all;
//    debugPrint('promo categories map: $categories');
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
    _pageController = PageController();
    _tabController.addListener(_setActiveTabIndex);
//    _pageController.addListener(() {
//      if (_pageController.page % 1.0 == 0) {
//        debugPrint('page anim complete');
//        _setActiveTabIndex();
//      }
//    });
  }

  @override
  void dispose() {
    try {
      if (_tabController != null) _tabController.dispose();
    } catch (e) {
      MyLogger.warn(msg: '${e.runtimeType}', tag: "PromoDisplay", error: e);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    tabItemWidth ??=
        (Global.device.width - 8 * categories.length - 11 - 32) / 5;
    return Column(
      children: <Widget>[
        /* Category Tab Bar */
        Container(
          padding: const EdgeInsets.only(right: 6.0, left: 5.0),
          child: TabBar(
            unselectedLabelColor: themeColor.promoTabTextColor,
            labelColor: themeColor.promoTabSelectedTextColor,
            labelStyle: TextStyle(fontSize: FontSize.SUBTITLE.value),
            labelPadding: const EdgeInsets.only(top: 4.0),
            indicatorColor: Colors.transparent,
//            indicatorWeight: 3.0,
//            indicatorSize: TabBarIndicatorSize.label,
//            indicatorPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            controller: _tabController,
            isScrollable: true,
            /* Category Tabs */
            tabs: categories.map((c) {
              return Container(
                width: tabItemWidth,
                height: (tabItemWidth < 72) ? tabItemWidth * 1.14 : 72,
                decoration: BoxDecoration(
                  color: c == _current
                      ? themeColor.promoTabSelectedBgColor
                      : themeColor.promoTabBgColor,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: <Widget>[
                    FittedBox(
                      child: Center(
                        child: Tab(
                          icon: ExtendedImage.network(
                            '${Global.CURRENT_BASE}${c.value.iconUrl}',
                            scale: (c.value.id == 0 || c.value.id == 6)
                                ? 6.0
                                : 3.0,
                            color: c == _current
                                ? themeColor.promoTabSelectedIconColor
                                : themeColor.promoTabIconColor,
                            loadStateChanged: (ExtendedImageState state) {
                              switch (state.extendedImageLoadState) {
                                case LoadState.completed:
                                  return state.completedWidget;
                                case LoadState.failed:
                                  return Icon(
                                    Icons.broken_image,
                                    color: themeColor.promoTabIconColor,
                                  );
                                default:
                                  return null;
                              }
                            },
                          ),
                          iconMargin: EdgeInsets.only(top: 2.0, bottom: 2.0),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: Text(
                              c.label,
                              style: TextStyle(fontSize: FontSize.NORMAL.value),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: SizedBox(
                        height: 2,
                        width: tabItemWidth,
                        child: ColoredBox(
                          color: themeColor.defaultAccentColor,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            onTap: (index) {
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.linearToEaseOut,
              );
            },
          ),
        ),
        /* Promo List Content */
        if (contentWidget != null)
          Expanded(
            child: contentWidget,
          ),
      ],
    );
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    debugPrint('open promo id: ${widget.showPromoId}');
    if (contentWidget == null) {
      contentWidget = new TabsPageControlWidget(
        pageController: _pageController,
        tabController: _tabController,
        children: categories.map(
          (c) {
            return PromoListView(
              category: c,
              list: (c.value.id == 0)
                  ? widget.promos
                  : widget.promos
                      .where((element) => element.postCategoryId == c.value.id)
                      .toList(),
            );
          },
        ).toList(),
      );
      setState(() {});
    }

    // show Promo Detail if id is specified
    if (widget.showPromoId != -1) {
      Future.delayed(Duration(milliseconds: 500), () {
        var promo = widget.promos
            .firstWhere((element) => element.id == widget.showPromoId);
        debugPrint('debug show promo on home image click: $promo');
        if (promo != null) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => new PromoDetail(promo));
        }
      });
    }
  }
}
