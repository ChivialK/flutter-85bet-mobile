import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/member/presentation/data/member_grid_item.dart';
import 'package:flutter_85bet_mobile/features/subfeatures/register/presentation/widget/register_form_widget.dart';

class RegisterDisplay extends StatelessWidget {
  final MemberGridItem pageItem = MemberGridItem.register;
  @override
  Widget build(BuildContext context) {
    return ListView(
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
            child: RegisterFormWidget(32.0, false),
          ),
        ),
      ],
    );
  }
}
