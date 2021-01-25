import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/data/error/error_message_map.dart';
import 'package:flutter_85bet_mobile/features/router/app_navigate.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/deposit/data/model/deposit_result.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/deposit/data/model/payment_type.dart';

import '../state/deposit_store.dart';
import 'deposit_page_content.dart';
import 'deposit_page_type_grid.dart';
import 'deposit_pages_inherited_widget.dart';

class DepositPageDisplay extends StatefulWidget {
  DepositPageDisplay({Key key}) : super(key: key);

  @override
  _DepositPageDisplayState createState() => _DepositPageDisplayState();
}

class _DepositPageDisplayState extends State<DepositPageDisplay> {
  final MemberGridItem pageItem = MemberGridItem.deposit;

  DepositStore _store;
  List<ReactionDisposer> _disposers;
  CancelFunc toastDismiss;

  int _selectTypeKey;
  PaymentType _selectType;

  void initDisposer() {
    _disposers ??= [
      /* Reaction on deposit action */
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _store.waitForDepositResult,
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
        (_) => _store.depositResult,
        // Run some logic with the content of the observed field
        (DepositResult result) {
          debugPrint('deposit display result: $result');
          if (result == null) return;

          /// show the ledger index toast
          if (result.code == 0 && result.ledger >= 0) {
            callToastInfo(
              localeStr.depositMessageSuccessLocal(result.ledger),
              icon: Icons.check_circle_outline,
            );

            // reset the view to show payment grid
            Future.delayed(
              Duration(milliseconds: 500),
              () => setState(() => _selectType = null),
            );

            /// open the web page if url is returned
          } else if (result.code == 0 && result.url != null) {
            debugPrint('deposit display url: ${result.url}');
            RouterNavigate.navigateToPage(
              RoutePage.depositWeb,
              arg: WebRouteArguments(startUrl: result.url),
            );

            // reset the view to show payment grid
            Future.delayed(
              Duration(milliseconds: 500),
              () => _selectType = null,
            );

            /// show error message if failed
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
    _store ??= DepositPagesInheritedWidget.of(context).store;
    if (_store == null) {
      return Center(
        child: WarningDisplay(
          message: Failure.internal(
            FailureCode(type: FailureType.INHERIT),
          ).message,
        ),
      );
    }
    if (_disposers == null) initDisposer();
    if (_selectType == null) {
      DepositPagesInheritedWidget.of(context).storage.clearStorage();
    }
    return WillPopScope(
      onWillPop: () async {
        debugPrint('pop deposit page');
        if (_selectType != null) {}
        Future.delayed(
            Duration(milliseconds: 100), () => RouterNavigate.navigateBack());
        return Future(() => true);
      },
      child: Container(
        child: Column(
          children: <Widget>[
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
                        color: themeColor.defaultTitleColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            if (_store.paymentTypes != null && _selectType == null)
              Expanded(
                child: DepositPageTypeGrid(
                  types: _store.paymentTypes,
                  onSelect: (selected) {
                    // debugPrint('selected payment: $selected');
                    Future.delayed(Duration(milliseconds: 100), () {
                      if (mounted && _selectType != selected) {
                        setState(() {
                          _selectTypeKey = selected.key;
                          _selectType = selected;
                        });
                      }
                    });
                  },
                ),
              ),
            if (_selectType != null)
              Expanded(
                child: DepositPageContent(
                  paymentKey: _selectTypeKey,
                  payment: _selectType,
                  onReturn: () => setState(() => _selectType = null),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
