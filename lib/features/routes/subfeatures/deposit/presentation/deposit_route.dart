import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/warning_display.dart';

import 'state/deposit_store.dart';
import 'widgets_new/deposit_page_display.dart';
import 'widgets_new/deposit_page_storage.dart';
import 'widgets_new/deposit_pages_inherited_widget.dart';

/// Main View of [FeatureRouter.promoRoute]
///@author H.C.CHIANG
///@version 2020/3/12
class DepositRoute extends StatefulWidget {
  @override
  _DepositRouteState createState() => _DepositRouteState();
}

class _DepositRouteState extends State<DepositRoute> {
  final Key _inheritKey = new UniqueKey();
  final Key _displayKey = new UniqueKey();

  DepositStore _store;
  DepositPageStorage _storage;
  List<ReactionDisposer> _disposers;

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
  void initState() {
    _store ??= sl.get<DepositStore>();
    _storage ??= new DepositPageStorage();
    super.initState();
    _store.getInitializeData();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        debugPrint('pop deposit route');
        Future.delayed(
            Duration(milliseconds: 100), () => RouterNavigate.navigateBack());
        return Future(() => true);
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 4.0),
          child: Observer(
            builder: (_) {
              switch (_store.state) {
                case DepositStoreState.loading:
                  return LoadingWidget();
                case DepositStoreState.loaded:
                  return DepositPagesInheritedWidget(
                    key: _inheritKey,
                    store: _store,
                    storage: _storage,
                    child: DepositPageDisplay(key: _displayKey),
                  );
                case DepositStoreState.error:
                  return Center(
                      child: WarningDisplay(
                    message: Failure.internal(FailureCode(
                      type: FailureType.DEPOSIT,
                      code: 10,
                    )).message,
                  ));
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
