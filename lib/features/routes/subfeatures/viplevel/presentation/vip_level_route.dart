import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';

import 'state/vip_level_store.dart';
import 'widgets/vip_level_display.dart';

class VipLevelRoute extends StatefulWidget {
  @override
  _VipLevelRouteState createState() => _VipLevelRouteState();
}

class _VipLevelRouteState extends State<VipLevelRoute> {
  VipLevelStore _store;
  List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _store ??= sl.get<VipLevelStore>();
    super.initState();
    // execute action on init
    _store.getLevel();
  }

  @override
  void didUpdateWidget(VipLevelRoute oldWidget) {
    _store.clearData();
    super.didUpdateWidget(oldWidget);
    _store.getLevel();
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
      onWillPop: () async {
        debugPrint('pop vip-level route');
        Future.delayed(
            Duration(milliseconds: 100), () => RouterNavigate.navigateBack());
        return Future(() => true);
      },
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(12.0),
          child: Observer(
            // Observe using specific widget
            builder: (_) {
              switch (_store.state) {
                case VipLevelStoreState.loading:
                  return LoadingWidget();
                case VipLevelStoreState.loaded:
                  return VipLevelDisplay(_store.levelModel);
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
