import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';

import 'state/notice_store.dart';
import 'widgets/notice_display.dart';

class NoticeRoute extends StatefulWidget {
  @override
  _NoticeRouteState createState() => _NoticeRouteState();
}

class _NoticeRouteState extends State<NoticeRoute> {
  NoticeStore _store;
  List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _store ??= sl.get<NoticeStore>();
    super.initState();
    // execute action on init
    _store.getData();
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
        debugPrint('pop notice route');
        Future.delayed(
            Duration(milliseconds: 100), () => RouterNavigate.navigateBack());
        return Future(() => true);
      },
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(12.0),
          child: Observer(
            // Observe using specific widget
            builder: (_) {
              switch (_store.state) {
                case NoticeStoreState.initial:
                  return SizedBox.shrink();
                case NoticeStoreState.loading:
                  return LoadingWidget();
                case NoticeStoreState.loaded:
                  return NoticeDisplay(_store);
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
