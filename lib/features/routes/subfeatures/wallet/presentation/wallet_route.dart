import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/warning_display.dart';

import 'state/wallet_store.dart';
import 'widgets/wallet_display.dart';

class WalletRoute extends StatefulWidget {
  @override
  _WalletRouteState createState() => _WalletRouteState();
}

class _WalletRouteState extends State<WalletRoute> {
  WalletStore _store;
  List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _store ??= sl.get<WalletStore>();
    super.initState();
    // execute action on init
    _store.getWallet();
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
          if (msg != null && msg.isNotEmpty) {
            callToastError(msg);
          }
        },
      ),
      /* Reaction on wallet type change result changed */
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _store.changeSuccess,
        // Run some logic with the content of the observed field
        (bool result) {
          debugPrint('reaction on change result: $result');
          if (result == null) return;
          if (result) {
            callToastInfo(
              localeStr.messageTaskSuccess(localeStr.walletViewMessageSetting),
              icon: Icons.check_circle_outline,
            );
          } else {
            callToastError(localeStr
                .messageTaskFailed(localeStr.walletViewMessageSetting));
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
        debugPrint('pop wallet route');
        Future.delayed(
            Duration(milliseconds: 100), () => RouterNavigate.navigateBack());
        return Future(() => true);
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: Observer(
            // Observe using specific widget
            builder: (_) {
              switch (_store.state) {
                case WalletStoreState.initial:
                  return SizedBox.shrink();
                case WalletStoreState.loading:
                  return LoadingWidget();
                case WalletStoreState.loaded:
                  if (_store.wallet != null)
                    return WalletDisplay(store: _store);
                  else
                    return WarningDisplay(message: _store.errorMessage);
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
