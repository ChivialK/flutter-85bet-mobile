import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/pager_widget.dart';
import 'package:flutter_85bet_mobile/features/routes/member/presentation/data/member_grid_item.dart';

import 'state/flows_store.dart';
import 'widgets/flows_display_list.dart';
import 'widgets/flows_display_table.dart';

class FlowsRoute extends StatefulWidget {
  @override
  _FlowsRouteState createState() => _FlowsRouteState();
}

class _FlowsRouteState extends State<FlowsRoute> with AfterLayoutMixin {
  final MemberGridItem pageItem = MemberGridItem.flowRecord;
  FlowsStore _store;
  List<ReactionDisposer> _disposers;
  CancelFunc toastDismiss;

  final GlobalKey<FlowsDisplayTableState> contentKey =
      new GlobalKey(debugLabel: 'content');
  final GlobalKey<PagerWidgetState> pagerKey =
      new GlobalKey(debugLabel: 'pager');

  Widget _contentWidget;

  void getPageData(int page) {
    if (_store == null) return;
    _store.getRecord(page: page);
  }

  @override
  void initState() {
    _store ??= sl.get<FlowsStore>();
    super.initState();
  }

  @override
  void didUpdateWidget(FlowsRoute oldWidget) {
    _contentWidget = null;
    super.didUpdateWidget(oldWidget);
    _contentWidget = new FlowsDisplayList(_store.dataList);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposers ??= [
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _store.errorMessage,
        // Run some logic with the content of the observed field
        (String message) {
          if (message != null && message.isNotEmpty) {
            callToastError(message, delayedMilli: 200);
          }
        },
      ),
      /* Reaction on search action */
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _store.waitForPageData,
        // Run some logic with the content of the observed field
        (bool wait) {
          debugPrint('reaction on wait flows: $wait');
          if (wait) {
            toastDismiss = callToastLoading();
          } else if (toastDismiss != null) {
            toastDismiss();
            toastDismiss = null;
            if (_store.dataList != null) {
              debugPrint(
                  'updating flow record, length: ${_store.dataList.length}');
              try {
                if (mounted)
                  setState(() {
                    _contentWidget = FlowsDisplayList(_store.dataList);
                    pagerKey.currentState.updateTotalPage = 1;
                    pagerKey.currentState.updateCurrentPage = 1;
                  });
              } on Exception {
                callToastError(localeStr.messageActionFailed);
              }
            }
          }
        },
      ),
    ];
  }

  @override
  void dispose() {
    if (toastDismiss != null) {
      toastDismiss();
      toastDismiss = null;
    }
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _contentWidget ??= SizedBox.shrink();
    return WillPopScope(
      onWillPop: () {
        debugPrint('pop flows route');
        Future.delayed(
            Duration(milliseconds: 100), () => RouterNavigate.navigateBack());
        return Future(() => true);
      },
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(12.0),
          alignment: Alignment.topCenter,
          child: ListView(
            primary: true,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(4.0, 20.0, 4.0, 12.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Themes.memberIconColor,
                        boxShadow: Themes.roundIconShadow,
                      ),
                      child: Icon(
                        pageItem.value.iconData,
                        size: 32 * Global.device.widthScale,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        pageItem.value.label,
                        style: TextStyle(fontSize: FontSize.HEADER.value),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(4.0, 20.0, 4.0, 0.0),
                child: Container(
                  decoration: Themes.layerShadowDecorRound,
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: _contentWidget,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            PagerWidget(
                              pagerKey,
                              horizontalInset: 20.0,
                              onAction: (page) => getPageData(page),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    getPageData(1);
  }
}
