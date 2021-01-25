import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/routes/home/data/entity/game_entity.dart';
import 'package:flutter_85bet_mobile/features/themes/theme_interface.dart';

typedef OnGameItemTap = void Function(GameEntity game);

class HomeTabGameItem extends StatelessWidget {
  final GameEntity game;
  final OnGameItemTap onTap;

  const HomeTabGameItem({
    Key key,
    @required this.game,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Color(0x80B1C7E6),
        border: Border.all(color: Colors.black54),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(4.0),
            child: networkImageBuilder(
              game.imageUrl,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Container(
              constraints: BoxConstraints(
                maxHeight: FontSize.SUBTITLE.value * 4,
              ),
              padding: const EdgeInsets.fromLTRB(8.0, 4.0, 4.0, 4.0),
              alignment: Alignment.center,
              child: AutoSizeText.rich(
                TextSpan(
                    text: game.cname.trim(),
                    style: TextStyle(
                      fontSize: FontSize.NORMAL.value,
                      fontWeight: FontWeight.w500,
                    )),
                maxLines: 3,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                minFontSize: FontSize.SMALL.value,
                maxFontSize: FontSize.SUBTITLE.value,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: RaisedButton(
              onPressed: () => onTap(game),
              visualDensity: VisualDensity(vertical: -2),
              child: Text(localeStr.btnOpenGame),
            ),
          ),
        ],
      ),
    );
  }
}
