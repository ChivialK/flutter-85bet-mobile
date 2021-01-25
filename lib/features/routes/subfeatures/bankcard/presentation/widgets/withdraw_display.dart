import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';

import '../../data/models/bankcard_model.dart';
import '../../data/models/withdraw_model.dart';
import '../state/withdraw_store.dart';
import 'withdraw_display_view.dart';

class WithdrawDisplay extends StatefulWidget {
  final BankcardModel bankcard;

  WithdrawDisplay({@required this.bankcard});

  @override
  _WithdrawDisplayState createState() => _WithdrawDisplayState();
}

class _WithdrawDisplayState extends State<WithdrawDisplay> {
  WithdrawStore _store;
  CancelFunc toastDismiss;
  List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _store ??= sl.get<WithdrawStore>();
    super.initState();
    _store.getWalletCredit();
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
        (String msg) {
          if (msg != null && msg.isNotEmpty) callToastError(msg);
        },
      ),
      /* Reaction on withdraw action */
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _store.waitForWithdrawResult,
        // Run some logic with the content of the observed field
        (bool wait) {
          debugPrint('reaction on wait withdraw: $wait');
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
        (_) => _store.withdrawResult,
        // Run some logic with the content of the observed field
        (WithdrawModel result) {
          debugPrint('reaction on withdraw result: $result');
          if (result == null) return;
          if (result.code == 0) {
            callToastInfo(
                MessageMap.getSuccessMessage(result.msg, RouteEnum.WITHDRAW),
                icon: Icons.check_circle_outline);
          } else {
            callToastError(
                MessageMap.getErrorMessage(result.msg, RouteEnum.WITHDRAW));
          }
        },
      ),
      /* Reaction on wallet credit changed */
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _store.walletCredit,
        // Run some logic with the content of the observed field
        (credit) {
          debugPrint('reaction on withdraw credit: $credit');
          if (credit.isEmpty) {
            toastDismiss = callToastLoading();
          } else if (toastDismiss != null) {
            toastDismiss();
            toastDismiss = null;
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
    return WithdrawDisplayView(
      store: _store,
      bankcard: widget.bankcard,
    );
  }
}
