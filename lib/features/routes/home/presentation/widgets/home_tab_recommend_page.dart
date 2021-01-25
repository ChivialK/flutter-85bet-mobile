import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_route_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/warning_display.dart';
import 'package:flutter_85bet_mobile/features/routes/home/data/entity/game_entity.dart';

import '../state/home_store.dart';
import 'grid_addon_favorite.dart';
import 'home_display_provider.dart';
import 'home_tab_game_item.dart';
import 'tabs/tab_page_empty.dart';

class HomeTabRecommendPage extends StatefulWidget {
  HomeTabRecommendPage({Key key}) : super(key: key);

  @override
  _HomeTabRecommendPageState createState() => _HomeTabRecommendPageState();
}

class _HomeTabRecommendPageState extends State<HomeTabRecommendPage>
    with AutomaticKeepAliveClientMixin<HomeTabRecommendPage>, AfterLayoutMixin {
  HomeStore _store;
  List<GameEntity> _games;
  SliverGrid _sliver;

  List<ReactionDisposer> _disposers;
  List<GlobalKey<GridAddonFavoriteState>> _favorKeys;
  int _favorCount;

  void initDisposer() {
    _disposers ??= [
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _store.recommends,
        // Run some logic with the content of the observed field
        (list) {
          if (_store.recommends != _games && mounted) {
            Future.delayed(Duration(milliseconds: 200), () {
              if (_store.recommends != _games && mounted) {
                setState(() {
                  _games = _store.recommends;
                  _sliver = null;
                });
              }
            });
          } else {
            _games = _store.recommends;
          }
        },
      ),
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _store.favorites,
        // Run some logic with the content of the observed field
        (list) {
          if (_favorCount != list.length) {
            _favorCount = list.length;
            for (int i = 0; i < _games.length; i++) {
              if (list.any((item) => item.id == _games[i].id)) {
                if (_games[i].favorite != 1) {
                  _games[i] = _games[i].copyWith(favorite: 1);
                }
                _favorKeys[i]?.currentState?.setFavorite(favor: true);
              } else {
                if (_games[i].favorite != 0) {
                  _games[i] = _games[i].copyWith(favorite: 0);
                }
                _favorKeys[i]?.currentState?.setFavorite(favor: false);
              }
            }
            debugPrint('update games favor');
            // _games.forEach((element) {
            //   debugPrint('game id: ${element.id}, favor: ${element.favorite}');
            // });
          }
        },
      ),
    ];
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _store ??= Provider.of<HomeDisplayProvider>(context).store;
    if (_store == null) {
      return Center(
        child: WarningDisplay(message: localeStr.messageErrorInternal),
      );
    }
    if (_disposers == null) initDisposer();
    _games ??= _store.recommends;
    super.build(context);
    return Selector<HomeDisplayProvider, bool>(
      selector: (_, provider) => provider.hasUser,
      shouldRebuild: (previous, next) => previous != next,
      builder: (_, hasUser, child) {
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
      child: TabPageEmpty(onTap: () => _store.getRecommend()),
    );
  }

  SliverGrid _buildGrid(List<GameEntity> games, bool hasUser) {
    _favorKeys = new List();
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 160.0,
        crossAxisSpacing: 4.0,
        childAspectRatio: 0.6,
      ),
      delegate: SliverChildBuilderDelegate(
        (_, index) {
          if (hasUser) {
            final _favorKey =
                new GlobalKey<GridAddonFavoriteState>(debugLabel: 'g$index');
            _favorKeys.add(_favorKey);
          }
          return Stack(
            children: [
              HomeTabGameItem(
                game: games[index],
                onTap: (_) => (hasUser)
                    ? (_store.waitForGameUrl)
                        ? callToast(localeStr.messageWarnLoadingGame)
                        : _store.getGameUrl(_.gameUrl)
                    : callToastInfo(localeStr.messageErrorNotLogin),
              ),
              if (hasUser)
                Positioned(
                  top: 6,
                  left: 6,
                  child: GridAddonFavorite(
                      key: _favorKeys[index],
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
    if (_store != null && _store.recommends == null) {
      _store.getRecommend();
    }
  }
}
