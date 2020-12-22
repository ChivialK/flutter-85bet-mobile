import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/dialog_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart' show Observer;

import '../state/wallet_store.dart';

class WalletDialog extends StatefulWidget {
  final WalletStore store;

  WalletDialog({this.store});

  @override
  _WalletDialogState createState() => _WalletDialogState();
}

class _WalletDialogState extends State<WalletDialog> {
  static final GlobalKey<DialogWidgetState> _dialogKey =
      new GlobalKey(debugLabel: 'dialog');

  final double _titleWidth = Global.device.width * 0.65;

  bool isSuccess;

  @override
  void dispose() {
    widget.store.closeStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DialogWidget(
      key: _dialogKey,
      maxHeight: 186.0,
      widthShrink: 64.0,
      transparentBg: themeColor.isDarkTheme,
      onClose: () {
        widget.store.showingDialog = false;
        widget.store.cancelWalletTransfer();
        widget.store.closeStream();
      },
      children: <Widget>[
        Observer(
          builder: (_) {
            if (widget.store.transferSuccess == null) {
              /// Waiting Dialog
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 18.0),
                    width: _titleWidth,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            localeStr.walletViewHintOneClickWait,
                            style: TextStyle(
                              fontSize: FontSize.TITLE.value,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      '${widget.store.transferProgress}',
                      style: TextStyle(
                        fontSize: FontSize.SUBTITLE.value,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            } else if (widget.store.transferSuccess) {
              /// Success Dialog
              Future.delayed(Duration(seconds: 3), () {
                // close dialog automatically
                try {
                  if (widget.store.showingDialog) {
                    widget.store.showingDialog = false;
                    widget.store.cancelWalletTransfer();
                    widget.store.closeStream();
                    Navigator.of(context).pop();
                  }
                } catch (e) {}
              });
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 18.0),
                    width: _titleWidth,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            localeStr.messageTaskSuccess(
                                localeStr.walletViewButtonOneClick),
                            style: TextStyle(
                              fontSize: FontSize.TITLE.value,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Icon(
                          Icons.check,
                          size: 64,
                          color: themeColor.defaultAccentColor,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              /// Failed Dialog
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
                    width: _titleWidth,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            localeStr.messagePartFailed,
                            style: TextStyle(
                              fontSize: FontSize.TITLE.value,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Icon(
                          Icons.error,
                          size: 64,
                          color: themeColor.defaultErrorColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Text(
                            '${widget.store.transferErrorList}',
                            style: TextStyle(fontSize: FontSize.SUBTITLE.value),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }
}
