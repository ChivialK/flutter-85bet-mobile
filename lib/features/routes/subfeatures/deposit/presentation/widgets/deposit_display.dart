import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/data/error/error_message_map.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/types_grid_widget.dart';
import 'package:flutter_85bet_mobile/features/router/app_navigate.dart';

import '../../data/model/deposit_result.dart';
import '../../data/model/payment_type.dart';
import '../state/deposit_store.dart';
import 'payment_content.dart';

class DepositDisplay extends StatefulWidget {
  final DepositStore store;

  DepositDisplay({this.store});

  @override
  _DepositDisplayState createState() => _DepositDisplayState();
}

class _DepositDisplayState extends State<DepositDisplay> with AfterLayoutMixin {
  final MemberGridItem pageItem = MemberGridItem.deposit;

  final GlobalKey<PaymentContentState> _contentKey = new GlobalKey();

  List<ReactionDisposer> _disposers;
  CancelFunc toastDismiss;

  void updateContent(PaymentType type) {
    debugPrint('switching deposit type...${type.label}');
    if (!mounted) return;
    setState(() {
      _contentKey.currentState?.update(type);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposers ??= [
      /* Reaction on deposit action */
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => widget.store.waitForDepositResult,
        // Run some logic with the content of the observed field
        (bool wait) {
          debugPrint('deposit display wait result: $wait');
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
        (_) => widget.store.depositResult,
        // Run some logic with the content of the observed field
        (DepositResult result) {
          debugPrint('deposit display result: $result');
          if (result == null) return;
          if (result.code == 0 && result.ledger >= 0) {
            callToastInfo(
              localeStr.depositMessageSuccessLocal(result.ledger),
              icon: Icons.check_circle_outline,
            );
          } else if (result.code == 0 && result.url != null) {
            debugPrint('deposit display url: ${result.url}');
            RouterNavigate.navigateToPage(
              RoutePage.depositWeb,
              arg: WebRouteArguments(startUrl: result.url),
            );
          } else {
            callToastError(MessageMap.getErrorMessage(
              result.msg,
              RouteEnum.DEPOSIT,
            ));
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
    return SizedBox(
      width: Global.device.width - 24.0,
      child: InkWell(
        // to dismiss the keyboard when the user tabs out of the TextField
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
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
                    decoration: ThemeInterface.pageIconContainerDecor,
                    child: Icon(
                      pageItem.value.iconData,
                      size: 32 * Global.device.widthScale,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      pageItem.value.label,
                      style: TextStyle(
                        fontSize: FontSize.HEADER.value,
                        color: themeColor.defaultTextColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 0.0),
              child: TypesGridWidget<PaymentType>(
                types: widget.store.paymentTypes,
                titleKey: 'label',
                onTypeGridTap: (_, type) => updateContent(type),
                itemSpace: 2.0,
                itemSpaceHorFactor: 2.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 8.0),
              child: PaymentContent(
                key: _contentKey,
                promos: widget.store.promoMap,
                infoList: widget.store.infoList,
                banks: widget.store.banks,
                rules: widget.store.depositRule,
                depositCall: widget.store.sendRequest,
                firstTypeKey: widget.store.paymentTypes.first.key,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    if (widget.store.paymentTypes.length > 0)
      _contentKey.currentState.update(widget.store.paymentTypes.first);
  }
}
