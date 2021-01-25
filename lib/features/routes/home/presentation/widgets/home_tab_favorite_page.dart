import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/loading_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/warning_display.dart';
import 'package:flutter_85bet_mobile/features/routes/home/data/entity/game_entity.dart';

import '../state/home_store.dart';
import 'grid_addon_favorite.dart';
import 'home_display_provider.dart';
import 'home_tab_game_item.dart';
import 'tabs/tab_page_empty.dart';

class HomeTabFavoritePage extends StatefulWidget {
  HomeTabFavoritePage({Key key}) : super(key: key);

  @override
  _HomeTabFavoritePageState createState() => _HomeTabFavoritePageState();
}

class _HomeTabFavoritePageState extends State<HomeTabFavoritePage>
    with AutomaticKeepAliveClientMixin<HomeTabFavoritePage>, AfterLayoutMixin {
  HomeStore _store;

  List<GameEntity> _games;
  SliverGrid _sliver;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    _store ??= Provider.of<HomeDisplayProvider>(context).store;
    if (_store == null) {
      return Center(
        child: WarningDisplay(message: localeStr.messageErrorInternal),
      );
    }
    _games ??= _store.favorites;
    super.build(context);
    return Selector<HomeDisplayProvider, bool>(
      selector: (_, provider) => provider.hasUser,
      shouldRebuild: (previous, next) => previous != next,
      builder: (_, hasUser, child) {
        /// View when no user
        if (!hasUser) {
          return FlatButton(
            onPressed: () => RouterNavigate.navigateToPage(
              RoutePage.login,
              arg: LoginRouteArguments(returnHomeAfterLogin: true),
            ),
            child: RichText(
              maxLines: 3,
              textAlign: TextAlign.center,
              text: TextSpan(
                text: localeStr.messageLoginHint,
                style: TextStyle(
                  color: themeColor.hintHyperLink,
                  fontSize: FontSize.MESSAGE.value,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          );
        }

        return Observer(
          builder: (_) {
            if (_store.favorites != _games) {
              _games = _store.favorites;
              _sliver = (_games == null || _games.isEmpty)
                  ? null
                  : _buildGrid(_games, hasUser);
            }

            /// View when no data
            if (_games == null) return LoadingWidget();
            if (_games.isEmpty) return child;

            /// View for games
            _sliver ??= (_games == null || _games.isEmpty)
                ? null
                : _buildGrid(_games, hasUser);
            return CustomScrollView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              slivers: [_sliver],
            );
          },
        );
      },
      child: TabPageEmpty(onTap: () => _store.getFavorites()),
    );
  }

  SliverGrid _buildGrid(List<GameEntity> games, bool hasUser) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 160.0,
        crossAxisSpacing: 4.0,
        childAspectRatio: 0.6,
      ),
      delegate: SliverChildBuilderDelegate(
        (_, index) {
          return Stack(
            children: [
              HomeTabGameItem(
                game: games[index],
                onTap: (_) => (_store.waitForGameUrl)
                    ? callToast(localeStr.messageWarnLoadingGame)
                    : _store.getGameUrl(_.gameUrl),
              ),
              Positioned(
                top: 6,
                left: 6,
                child: GridAddonFavorite(
                    initValue: games[index].favorite == 1,
                    onTap: (favor) => _store.postFavorite(
                          entity: games[index],
                          favorite: favor,
                        )),
              )
            ],
          );
        },
        childCount: games.length,
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    if (_store != null && _store.favorites == null) {
      _store.getFavorites();
    }
  }
}
