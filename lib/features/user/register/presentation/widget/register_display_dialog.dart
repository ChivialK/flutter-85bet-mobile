import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/routes/member/presentation/data/member_grid_item.dart';

import 'register_form_widget.dart';

class RegisterDisplayDialog extends StatelessWidget {
  final MemberGridItem pageItem = MemberGridItem.register;
  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: true,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SizedBox(
            width: Global.device.width,
            height: FontSize.XLARGE.value * 2.5,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Center(
                  child: Text(
                    pageItem.value.label,
                    style: TextStyle(fontSize: FontSize.HEADER.value),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: FontSize.HEADER.value / 2),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.chevron_left,
                      size: FontSize.XLARGE.value * 2,
                      color: Themes.defaultTextColor,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Divider(height: 8.0),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 16.0),
          child: RegisterFormWidget(32.0, true, isDialog: true),
        ),
      ],
    );
  }
}
