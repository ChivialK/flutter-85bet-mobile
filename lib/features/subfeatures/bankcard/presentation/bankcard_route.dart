import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/network/handler/request_code_model.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';

import 'state/bankcard_store.dart';
import 'widgets/bankcard_display.dart';
import 'widgets/bankcard_display_card.dart';
import 'widgets/withdraw_display.dart';

class BankcardRoute extends StatefulWidget {
  final bool withdraw;

  BankcardRoute({this.withdraw = false});

  @override
  _BankcardRouteState createState() => _BankcardRouteState();
}

class _BankcardRouteState extends State<BankcardRoute> {
  final Key observerKey = new Key('observer');
  BankcardStore _store;
  List<ReactionDisposer> _disposers;
  CancelFunc toastDismiss;

  @override
  void initState() {
    _store ??= sl.get<BankcardStore>();
    _store.getBankcard();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposers ??= [
      /* Reaction on error message changed */
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _store.errorMessage,
        // Run some logic with the content of the observed field
        (String msg) {
          if (msg != null && msg.isNotEmpty) {
            callToastError(msg);
          }
        },
      ),
      /* Reaction on new bankcard action */
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _store.waitForNewCardResult,
        // Run some logic with the content of the observed field
        (bool wait) {
          print('reaction on wait bankcard: $wait');
          if (wait) {
            toastDismiss = callToastLoading();
          } else if (toastDismiss != null) {
            toastDismiss();
            toastDismiss = null;
          }
        },
      ),
      /* Reaction on deposit result changed */
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _store.newCardResult,
        // Run some logic with the content of the observed field
        (RequestCodeModel result) {
          print('new bankcard result: $result');
          if (result == null) return;
          if (result.isSuccess) {
            callToastInfo(
                (result.msg.isNotEmpty && result.msg.hasChinese)
                    ? result.msg
                    : localeStr.messageSuccess,
                icon: Icons.check_circle_outline);
            _store.getBankcard();
          } else {
            callToastError((result.msg.isNotEmpty && result.msg.hasChinese)
                ? result.msg
                : localeStr
                    .messageTaskFailed(localeStr.messageErrorBindBankcard));
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
    return WillPopScope(
      onWillPop: () {
        print('pop bankcard/withdraw route');
        Future.delayed(
            Duration(milliseconds: 100), () => RouterNavigate.navigateBack());
        return Future(() => true);
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(12.0),
          child: Observer(
            key: observerKey,
            builder: (_) {
              switch (_store.state) {
                case BankcardStoreState.loading:
                  return LoadingWidget();
                case BankcardStoreState.loaded:
                  bool validCard =
                      _store.bankcard != null && _store.bankcard.hasCard;
                  if (!validCard && widget.withdraw) {
                    Future.delayed(Duration(milliseconds: 300), () {
                      callToast(localeStr.messageErrorBindBankcard);
                    });
                  }
                  if (validCard && widget.withdraw) {
                    return WithdrawDisplay(bankcard: _store.bankcard);
                  } else if (validCard) {
                    return BankcardDisplayCard(bankcard: _store.bankcard);
                  } else {
                    return BankcardDisplay(
                      store: _store,
                      bankcard: _store.bankcard,
                    );
                  }
                  break;
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
