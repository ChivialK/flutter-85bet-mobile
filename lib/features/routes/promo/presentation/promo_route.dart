import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';

import 'state/promo_store.dart';
import 'widgets/promo_tab_display.dart';

///
/// Main View of [FeatureRouter.promoRoute]
///@author H.C.CHIANG
///@version 2020/6/9
///
class PromoRoute extends StatefulWidget {
  final int openPromoId;

  PromoRoute({this.openPromoId = -1});

  @override
  _PromoRouteState createState() => _PromoRouteState();
}

class _PromoRouteState extends State<PromoRoute> {
  PromoStore _store;
  List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _store ??= sl.get<PromoStore>();
    super.initState();
    _store.getPromoList();
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
    ];
  }

  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        debugPrint('pop promo route');
        Future.delayed(
            Duration(milliseconds: 100), () => RouterNavigate.navigateBack());
        return Future(() => true);
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: Observer(
            builder: (_) {
              switch (_store.state) {
                case PromoStoreState.loading:
                  return LoadingWidget();
                case PromoStoreState.loaded:
                  return PromoTabDisplay(
                    _store.promos,
                    showPromoId: widget.openPromoId,
                  );
                default:
                  return SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
