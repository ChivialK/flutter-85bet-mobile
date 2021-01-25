import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/loading_widget.dart';
import 'package:flutter_85bet_mobile/features/routes/home/data/entity/game_entity.dart';
import 'package:flutter_85bet_mobile/features/routes/home/data/models/game_platform.dart';

import '../state/home_store.dart';
import 'grid_addon_favorite.dart';
import 'home_display_provider.dart';
import 'home_search_widget.dart';
import 'home_tab_game_item.dart';
import 'tabs/tab_page_empty.dart';

class HomeTabGamePage extends StatefulWidget {
  final GamePlatformEntity platform;

  HomeTabGamePage({
    Key key,
    @required this.platform,
  }) : super(key: key);

  @override
  _HomeTabGamePageState createState() => _HomeTabGamePageState();
}

class _HomeTabGamePageState extends State<HomeTabGamePage>
    with AutomaticKeepAliveClientMixin<HomeTabGamePage> {
  Future _gamesFuture;
  HomeStore _store;

  List<ReactionDisposer> _disposers;
  List<GameEntity> _games;
  List<GameEntity> _filterGames;
  List<GlobalKey<GridAddonFavoriteState>> _favorKeys;

  bool _hasUser;
  Widget _content;
  SliverGrid _sliver;
  int _favorCount;

  Future<List<GameEntity>> requestGameList({bool fromNetwork = false}) =>
      _store.getGames(platform: widget.platform, getFromNetwork: fromNetwork);

  void initDisposer() {
    _disposers ??= [
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
    super.build(context);
    return Selector<HomeDisplayProvider, bool>(
      selector: (_, provider) => provider.hasUser,
      shouldRebuild: (previous, next) => previous != next,
      builder: (_, hasUser, child) {
        if (_hasUser != hasUser) {
          _hasUser = hasUser;
          if (hasUser) {
            _gamesFuture = new Future.microtask(
              () => requestGameList(fromNetwork: true),
            );
          }
        }
        _gamesFuture ??= Future.microtask(() => requestGameList());
        return ListView(
          primary: true,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            child,
            FutureBuilder(
              future: _gamesFuture,
              initialData: _games,
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    _games != snapshot.data) {
                  _games = List.from(snapshot.data);
                  if (_games.isEmpty) {
                    _content = TabPageEmpty(onTap: () => requestGameList());
                  } else if (_filterGames == null) {
                    _content = _buildSliverContent(_games, hasUser);
                  }
                }
                _content ??= LoadingWidget();
                return _content;
              },
            ),
          ],
        );
      },
      child: HomeSearchWidget(onSearch: (type, keyword) {
        if (keyword.isEmpty && _filterGames != null) {
          _filterGames.clear();
          _filterGames = null;
          Future.delayed(Duration(milliseconds: 100), () {
            setState(() {
              _content = _buildSliverContent(_games, _hasUser);
            });
          });
          debugPrint('restore game search');
        } else if (keyword.isNotEmpty) {
          switch (type) {
            case HomeSearchType.PLATFORM:
              _filterGames = _games
                  .where((game) => game.gameUrl.contains('/$keyword/'))
                  .toList();
              break;
            case HomeSearchType.GAME:
              _filterGames =
                  _games.where((game) => game.cname.contains(keyword)).toList();
              break;
          }
          debugPrint('search game with [$keyword]: $_filterGames');
          Future.delayed(Duration(milliseconds: 100), () {
            setState(() {
              _content = _buildSliverContent(_filterGames, _hasUser);
            });
          });
        }
      }),
    );
  }

  Widget _buildSliverContent(List<GameEntity> list, bool hasUser) {
    // debugPrint('rebuild sliver content: ${list.length}');
    _sliver = _buildSliverGrid(list, hasUser);
    return CustomScrollView(
      primary: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      slivers: [_sliver],
    );
  }

  SliverGrid _buildSliverGrid(List<GameEntity> list, bool hasUser) {
    _favorKeys = new List();
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 160.0,
        crossAxisSpacing: 4.0,
        childAspectRatio: 0.6,
      ),
      delegate: SliverChildBuilderDelegate(
        (_, index) {
          final _favorKey =
              new GlobalKey<GridAddonFavoriteState>(debugLabel: 'g$index');
          _favorKeys.add(_favorKey);
          return Stack(
            children: [
              HomeTabGameItem(
                game: list[index],
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
                    key: _favorKey,
                    initValue: list[index].favorite == 1,
                    onTap: (favor) => _store.postFavorite(
                      entity: list[index],
                      favorite: favor,
                    ),
                  ),
                )
            ],
          );
        },
        childCount: list.length,
      ),
    );
  }
}
