import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/error/exceptions.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/loading_widget.dart';

import '../../data/entity/game_entity.dart';
import '../../data/form/platform_game_form.dart';
import '../../data/models/game_platform.dart';
import '../state/home_store.dart';
import 'grid_view_games.dart';
import 'grid_view_platforms.dart';
import 'home_search_widget.dart';
import 'home_store_inherit_widget.dart';

///
/// Create Platforms and Games [GridView]
/// @author H.C.CHIANG
/// @version 2020/6/20
///
class HomeDisplayTabPage extends StatefulWidget {
  final String category;
  final double pageMaxWidth;
  final double itemLabelWidthFactor;
  final bool addSearchListener;
  final bool addPlugin;

  HomeDisplayTabPage({
    Key key,
    @required this.category,
    @required this.pageMaxWidth,
    @required this.itemLabelWidthFactor,
    this.addSearchListener = false,
    this.addPlugin = false,
  }) : super(key: key);

  @override
  HomeDisplayTabPageState createState() => HomeDisplayTabPageState();
}

class HomeDisplayTabPageState extends State<HomeDisplayTabPage>
    with AfterLayoutMixin {
  final String _tag = 'HomeDisplayTabsPage';
  final bool _isIos = Global.device.isIos;

  HomeStore _store;
  List<GamePlatformEntity> _platforms;
  List<GameEntity> _games;

  Widget _contentWidget;
  Widget _gamesGrid;
  bool _isGameGrid = false;
  GamePlatformEntity _currentPlatform;

  String _searched;
  GamePlatformEntity _searchPlatform;

  String _getMapKey(GamePlatformEntity platform) {
    return '${platform.site}/${platform.category}';
  }

  PlatformGameForm _createForm(GamePlatformEntity platform) {
    _currentPlatform = platform;
    return PlatformGameForm(
      category: platform.category,
      platform: platform.site,
    );
  }

  /// Pass in a [itemData] on grid item tap or back button pressed.
  /// [itemData] should be [GamePlatformEntity] or [GameEntity]
  /// else throw [UnknownConditionException].
  void _onItemTap(dynamic itemData, {bool fromSearch = false}) {
    if (itemData is GamePlatformEntity) {
      debugPrint(
          'clicked platform: ${itemData.category}, from search: $fromSearch');
      if (fromSearch) {
        if (itemData.isGameHall == false) {
          _setGridContent(_buildGamesView(itemData));
        } else {
          _openGame(itemData.gameUrl);
        }
      } else if (_isGameGrid) {
        // if current is showing games grid, change to platforms grid
        _setGridContent(_createPlatformGrid());
      } else if (itemData.isGameHall == false) {
        // if the platform is not defined as game hall, show games grid
        _setGridContent(_buildGamesView(itemData));
      } else {
        debugPrint('game-hall (platform) url: ${itemData.gameUrl}');
        if (itemData.gameUrl == 'funky/lottery/0') {
          _setGridContent(_buildGamesView(itemData));
        } else if (itemData.gameUrl.isNotEmpty) {
          _openGame(itemData.gameUrl);
        }
      }
    } else if (itemData is GameEntity) {
      debugPrint('clicked game: ${itemData.gameUrl}');
      if (itemData.gameUrl.isNotEmpty) {
        _openGame(itemData.gameUrl);
      }
    } else {
      MyLogger.warn(msg: 'grid item unknown, data: $itemData', tag: _tag);
    }
  }

  void _setGridContent(Widget widget) {
    setState(() {
      _contentWidget = widget;
    });
  }

  void _openGame(String url) {
    if (_store.hasUser == false)
      callToastInfo(localeStr.messageErrorNotLogin);
    else if (_store != null) _store.getGameUrl(url);
  }

  void _setFavorite(dynamic entity, bool favor) {
    if (entity is GamePlatformEntity || entity is GameEntity) {
      debugPrint('set ${entity.id} favor to $favor');
      _store.postFavorite(entity: entity, favorite: favor);
    }
  }

  @override
  void didUpdateWidget(HomeDisplayTabPage oldWidget) {
    debugPrint("update game-page=${widget.category}");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    debugPrint("change game-page=${widget.category}");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _store ??= HomeStoreInheritedWidget.of(context).store;
    if (_store == null) {
      return Center(
        child: WarningDisplay(
          message:
              Failure.internal(FailureCode(type: FailureType.HOME)).message,
        ),
      );
    }

    _platforms ??= _store.homePlatformMap[widget.category] ?? [];
    _contentWidget ??= _createPlatformGrid();
    return _contentWidget;
  }

  /// Main layer to show platforms under category
  Widget _createPlatformGrid() {
    _isGameGrid = false;
    if (widget.addSearchListener) _store.searchGame(clear: true);
    return GridViewPlatform(
        platforms: _platforms,
        onTap: (entity) => _onItemTap(entity),
        addPlugin: widget.addPlugin,
        onFavorTap: (entity, isFavorite) => _setFavorite(entity, isFavorite),
        pageMaxWidth: widget.pageMaxWidth,
        labelWidthFactor: widget.itemLabelWidthFactor,
        isIos: _isIos);
  }

  /// Second Layer to show games under platform
  Widget _buildGamesView(GamePlatformEntity platform) {
    _isGameGrid = true;
    if (platform != _currentPlatform) {
      _gamesGrid = _createGameListListener(
        _createForm(platform),
        _getMapKey(platform),
      );
    }
//    debugPrint('test platform icon: ${platform.iconUrl}');
    return Stack(
      children: [
        // game grid view
        _gamesGrid,
        // action button to show platform grid
        Container(
          alignment: Alignment.bottomRight,
          padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
          child: FloatingActionButton(
            backgroundColor: Colors.white24,
            mini: true,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Icon(Icons.arrow_back),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 4.0),
                    child: Text(localeStr.btnBack),
                  ),
                ],
              ),
            ),
            onPressed: () {
              _setGridContent(_createPlatformGrid());
            },
          ),
        ),
      ],
    );
  }

  Widget _createGameListListener(PlatformGameForm form, String mapKey) {
    return StreamBuilder<String>(
      stream: _store.gamesStream,
      initialData: '',
      builder: (_, snapshot) {
        if (snapshot.data == mapKey || _store.hasPlatformGames(mapKey)) {
          return _createGamesGrid(_store.getPlatformGames(mapKey));
        } else {
          _store.getGames(form, mapKey);
          return LoadingWidget(heightFactor: 3);
        }
      },
    );
  }

  Widget _createGamesGrid(List<GameEntity> list) {
    _games = List.from(list);
    if (widget.addSearchListener) {
      return ListView(
        primary: true,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          HomeSearchWidget(onSearch: (input) {
            _store.searchGame(searchKey: input);
          }),
          StreamBuilder<String>(
              stream: _store.searchGameStream,
              initialData: '',
              builder: (context, snapshot) {
                String searchKey = snapshot?.data ?? '';
                return GridViewGames(
                  pageMaxWidth: widget.pageMaxWidth,
                  labelWidthFactor: widget.itemLabelWidthFactor,
                  isIos: _isIos,
                  games: (searchKey.isEmpty)
                      ? _games
                      : _games
                          .where((entity) => entity.cname
                              .toLowerCase()
                              .contains(searchKey.toLowerCase()))
                          .toList(),
                  onTap: (entity) => _onItemTap(entity),
                  addPlugin: widget.addPlugin,
                  onFavorTap: (entity, isFavorite) =>
                      _setFavorite(entity, isFavorite),
                );
              }),
        ],
      );
    } else {
      return GridViewGames(
        pageMaxWidth: widget.pageMaxWidth,
        labelWidthFactor: widget.itemLabelWidthFactor,
        isIos: _isIos,
        games: _games,
        onTap: (entity) => _onItemTap(entity),
        addPlugin: widget.addPlugin,
        onFavorTap: (entity, isFavorite) => _setFavorite(entity, isFavorite),
      );
    }
  }

  @override
  void afterFirstLayout(BuildContext context) {
    if (widget.addSearchListener) {
      if (_searched == null) {
        _searched = _store.searchPlatform;
        if (_searched != null) findPlatform();
      }
      _store.showPlatformStream.listen((event) {
        if (event.contains(widget.category) == false) return;
        debugPrint('page ${widget.category} received search $event');
        _searched = event;
        findPlatform();
      });
    }
  }

  void findPlatform() {
    _searchPlatform = _platforms.singleWhere(
      (element) => element.className == _searched,
      orElse: () => null,
    );
    debugPrint('search platform: $_searchPlatform');
    if (_searchPlatform != null) {
      _onItemTap(_searchPlatform, fromSearch: true);
      _store.clearPlatformSearch();
    }
  }
}
