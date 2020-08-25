import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/member/presentation/data/member_grid_item.dart';

import '../../data/models/bankcard_model.dart';

class BankcardDisplayCard extends StatelessWidget {
  final BankcardModel bankcard;

  BankcardDisplayCard({@required this.bankcard});

  final String tag = 'BankcardDisplayCard';
  final MemberGridItem pageItem = MemberGridItem.bankcard;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Global.device.width - 24.0,
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
                  SizedBox(height: 36.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildRow(localeStr.bankcardViewTitleOwner,
                            bankcard.firstName),
                        _buildRow(localeStr.bankcardViewTitleBankName,
                            bankcard.bankName),
                        _buildRow(localeStr.bankcardViewTitleCardNumber,
                            bankcard.bankAccountNo),
                        _buildRow(localeStr.bankcardViewTitleBankBranch,
                            bankcard.bankAddress),
                        _buildRow(localeStr.bankcardViewTitleBankProvince,
                            bankcard.bankProvince),
                      ],
                    ),
                  ),
                  SizedBox(height: 36.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              flex: 3,
              child: Text(
                '$title:',
                style: TextStyle(fontSize: FontSize.TITLE.value),
              )),
          Expanded(
            flex: 5,
            child: Text(
              '\r\r$content',
              style: TextStyle(fontSize: FontSize.TITLE.value),
            ),
          ),
        ],
      ),
    );
  }
}
