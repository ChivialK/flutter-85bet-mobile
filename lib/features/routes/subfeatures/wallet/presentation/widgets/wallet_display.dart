import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';

import '../enum/wallet_type.dart';
import '../state/wallet_store.dart';
import 'wallet_dialog.dart';

class WalletDisplay extends StatefulWidget {
  final WalletStore store;

  WalletDisplay({@required this.store});

  @override
  _WalletDisplayState createState() => _WalletDisplayState();
}

class _WalletDisplayState extends State<WalletDisplay> {
  final MemberGridItem pageItem = MemberGridItem.wallet;
  final GlobalKey _optionListKey = new GlobalKey(debugLabel: 'options');
  final GlobalKey _creditBoxKey = new GlobalKey(debugLabel: 'box');

  List<ReactionDisposer> _disposers;
  ScrollController _scrollController;
  String _credit;
  WalletType _selected;
  WalletType _walletType;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposers ??= [
      /* Reaction on transfer action */
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => widget.store.waitForTransfer,
        // Run some logic with the content of the observed field
        (bool wait) {
          debugPrint('reaction on wait wallet transfer: $wait');
          if (wait == null) return;
          if (wait && widget.store.showingDialog != true) {
            widget.store.showingDialog = true;
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => new WalletDialog(store: widget.store),
            );
          }
        },
      ),
      /* Reaction on wallet data change */
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => widget.store.wallet,
        // Run some logic with the content of the observed field
        (wallet) {
          debugPrint('reaction on wallet changed: $wallet');
          if (wallet == null) return;
          String newCredit = widget.store.wallet.credit;
          WalletType newWalletType =
              (widget.store.wallet.auto == WalletType.SINGLE.value)
                  ? WalletType.SINGLE
                  : WalletType.MULTI;
          debugPrint('new wallet type: $newWalletType, current: $_walletType');
          if (newWalletType != _walletType)
            _optionListKey.currentState.setState(() {
              _walletType = newWalletType;
            });
          if (newCredit != _credit)
            _creditBoxKey.currentState.setState(() {
              _credit = newCredit;
            });
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
    _credit = widget.store.wallet.credit;
    _walletType = (widget.store.wallet.auto == WalletType.SINGLE.value)
        ? WalletType.SINGLE
        : WalletType.MULTI;
    _selected = _walletType;
    super.initState();

    _scrollController = new ScrollController();
  }

  @override
  void didUpdateWidget(WalletDisplay oldWidget) {
    _credit = widget.store.wallet.credit;
    _walletType = (widget.store.wallet.auto == WalletType.SINGLE.value)
        ? WalletType.SINGLE
        : WalletType.MULTI;
    _selected = _walletType;
    super.didUpdateWidget(oldWidget);
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
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Themes.memberIconColor,
                      boxShadow: Themes.roundIconShadow,
                    ),
                    child: Icon(
                      pageItem.value.iconData,
                      size: 32 * Global.device.widthScale,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      pageItem.value.label,
                      style: TextStyle(fontSize: FontSize.HEADER.value),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 20.0, 4.0, 16.0),
              child: Container(
                decoration: Themes.layerShadowDecorRound,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 16.0),

                    ///
                    /// Wallet Box
                    ///
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 3.0,
                          color: Themes.walletBoxBorderColor,
                        ),
                      ),
                      margin: const EdgeInsets.all(30.0),
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          color: Themes.walletBoxBackgroundColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                localeStr.walletViewTitleMy,
                                style:
                                    TextStyle(fontSize: FontSize.LARGE.value),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Text(
                                localeStr.walletViewTitleRemain,
                                style: TextStyle(
                                  fontSize: FontSize.TITLE.value,
                                  color: Themes.walletCreditTitleColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Center(
                                child: FlatButton(
                                  onPressed: () => widget.store.updateCredit(),
                                  child: Text(
                                    _credit,
                                    style: TextStyle(
                                      fontSize: FontSize.LARGE.value * 1.5,
                                      fontWeight: FontWeight.w700,
                                      color: Themes.walletCreditTitleColor,
                                    ),
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                              ),
                            ),

                            ///
                            /// Transfer Button
                            ///
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RaisedButton(
                                  visualDensity: VisualDensity(horizontal: 2.0),
                                  color: Themes.walletBoxButtonColor,
                                  child: FittedBox(
                                    child: Text(
                                      localeStr.walletViewButtonOneClick,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (widget.store.waitForTransfer != true)
                                      widget.store.postWalletTransfer();
                                  },
                                ),
                              ],
                            ),

                            /// Transfer Hint
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 24.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      localeStr.walletViewHintOneClick,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    ///
                    /// Wallet Type Options
                    ///
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: _buildOptions(),
                    ),

                    ///
                    /// Confirm Button
                    ///
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 24.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: RaisedButton(
                              visualDensity:
                                  VisualDensity.adaptivePlatformDensity,
                              child: Text(localeStr.btnConfirm),
                              onPressed: () {
                                if (widget.store.waitForTypeChange) {
                                  callToast(localeStr.messageWait);
                                } else if (_walletType != _selected) {
                                  if (_selected == WalletType.SINGLE)
                                    widget.store.postWalletType(true);
                                  else
                                    widget.store.postWalletType(false);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  /// Build Radio options and hints
  ///
  Widget _buildOptions() {
    return ListView.builder(
      key: _optionListKey,
      controller: _scrollController,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (_, index) {
        switch (index) {
          case 0:
          case 2:
            String radioLabel = (index == 0)
                ? localeStr.walletViewTitleWalletSingle
                : localeStr.walletViewTitleWalletMulti;
            WalletType radioValue =
                (index == 0) ? WalletType.SINGLE : WalletType.MULTI;
            return Row(
              /// Radio Options
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Radio(
                  visualDensity: VisualDensity.compact,
                  value: radioValue,
                  groupValue: _selected,
                  onChanged: (value) {
                    setState(() {
                      _selected = value;
                    });
                    debugPrint('selected: $_selected');
                  },
                ),
                Text(
                  radioLabel,
                  style: TextStyle(
                    fontSize: FontSize.TITLE.value,
                    color: (_selected == radioValue)
                        ? Themes.defaultAccentColor
                        : Themes.walletRadioColor,
                  ),
                ),
                if (_walletType == radioValue)
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0, left: 2.0),
                    child: Icon(
                      Icons.check_circle,
                      color: Themes.defaultSelectableWidgetColor,
                      size: 14,
                    ),
                  )
              ],
            );
            break;
          case 1:
          case 3:
            String radioHint = (index == 1)
                ? localeStr.walletViewHintWalletSingle
                : localeStr.walletViewHintWalletMulti;
            return Padding(
              /// Radio Hints
              padding: const EdgeInsets.only(
                bottom: 16.0,
                left: 36.0,
                right: 6.0,
              ),
              child: Text(
                radioHint,
                style: TextStyle(
                  color: Themes.defaultHintSubColor,
                ),
              ),
            );
            break;
          default:
            return SizedBox.shrink();
            break;
        }
      },
    );
  }
}
