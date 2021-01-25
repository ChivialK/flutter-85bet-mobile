import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/service/presentation/widgets/service_display.dart';
import 'package:flutter_85bet_mobile/injection_container.dart';
import 'package:mobx/mobx.dart';

import 'state/service_store.dart';

class ServiceRoute extends StatefulWidget {
  @override
  _ServiceRouteState createState() => _ServiceRouteState();
}

class _ServiceRouteState extends State<ServiceRoute> {
  ServiceStore _store;
  List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _store ??= sl.get<ServiceStore>();
    super.initState();
    // execute action on init
    if (_store.data == null) _store.getWebsiteList();
  }

  @override
  void didChangeDependencies() {
    debugPrint('didChangeDependencies');
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
        debugPrint('pop service route');
        Future.delayed(
            Duration(milliseconds: 100), () => RouterNavigate.navigateBack());
        return Future(() => true);
      },
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Observer(
            // Observe using specific widget
            builder: (_) {
              switch (_store.state) {
                case ServiceStoreState.initial:
                case ServiceStoreState.loading:
                  return LoadingWidget();
                case ServiceStoreState.loaded:
                  return ServiceDisplay(_store.data);
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
