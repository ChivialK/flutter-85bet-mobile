import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/loading_widget.dart';

import '../../data/entity/game_entity.dart';
import '../../data/form/platform_game_form.dart';
import '../../data/models/game_platform.dart';
import '../state/home_store.dart';
import 'grid_item_game.dart';
import 'grid_item_platform.dart';
import 'home_store_inherit_widget.dart';

///
/// Create Platforms and Games [GridView]
/// @author H.C.CHIANG
/// @version 2020/6/20
///
class HomeDisplayTabPage extends StatefulWidget {
  final String category;
  final double pageMaxWidth;
  final bool addSearchListener;
  final bool addPlugin;

  HomeDisplayTabPage({
    Key key,
    @required this.pageMaxWidth,
    @required this.category,
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
  final int _platformsPerRow = 2;
  final int _gamesPerRow = 2;
  final FontSize _gFontSize = FontSize.MESSAGE;

  HomeStore _store;
  List<GamePlatformEntity> _platforms;

  Widget _grid;
  Widget _gamesView;
  bool _isGameGrid = false;
  int _plusGrid;

  double _platformGridRatio;
  double _platformItemSize;

  double _gameItemSize;
  double _gBaseTextSize;
  int _gAvailableCharacters;

  GamePlatformEntity _currentPlatform;
  List<GameEntity> _games;
  bool _twoLineText = true;

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
  String _onItemTap(dynamic itemData, {bool search = false}) {
    debugPrint('onItemTap page: $itemData');
    if (itemData is GamePlatformEntity) {
      if (search)
        _setGridContent(_buildGamesView(itemData));
      else if (_isGameGrid) {
//        debugPrint('clicked back');
        _setGridContent(_createPlatformGrid());
      } else if (itemData.isGameHall == false) {
//        debugPrint('clicked platform: ${itemData.className}, data: $itemData');
        _setGridContent(_buildGamesView(itemData));
      } else {
        debugPrint('clicked game platform: ${itemData.gameUrl}');
        if (itemData.gameUrl == 'funky/lottery/0')
          _setGridContent(_buildGamesView(itemData));
        else
          return itemData.gameUrl;
      }
    } else if (itemData is GameEntity) {
      debugPrint('clicked game: ${itemData.gameUrl}');
      return itemData.gameUrl;
    } else {
      MyLogger.warn(msg: 'tapped item unknown, data: $itemData', tag: _tag);
    }
    return '';
  }

  void _setGridContent(Widget widget) {
    setState(() {
      _grid = widget;
    });
  }

  void _openGame(String url) {
    if (_store.hasUser == false)
      callToastInfo(localeStr.messageErrorNotLogin);
    else if (_store != null) _store.getGameUrl(url);
  }

  @override
  void initState() {
    _plusGrid = (Global.device.widthScale > 2.0)
        ? 2
        : (Global.device.widthScale > 1.5) ? 1 : 0;

    _platformItemSize =
        widget.pageMaxWidth / (_platformsPerRow + _plusGrid) * 1.05;
    _platformGridRatio = _platformItemSize / 128 / Global.device.widthScale;
    debugPrint(
        'platform item size: $_platformItemSize, ratio: $_platformGridRatio');
//
    _gameItemSize = widget.pageMaxWidth / (_gamesPerRow + _plusGrid);
//    gameGridRatio = gameItemSize / 115 / Global.device.widthScale;
//    debugPrint('game item size: $gameItemSize, ratio: $gameGridRatio');

    _gBaseTextSize = (_isIos) ? _gFontSize.value + 2 : _gFontSize.value;
    _gAvailableCharacters = (_gameItemSize * 0.9 / _gBaseTextSize).floor();
    debugPrint('game item available characters: $_gAvailableCharacters');
    super.initState();
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
              Failure.internal(FailureCode(type: FailureType.HOME, code: 10))
                  .message,
        ),
      );
    }

    _platforms ??= _store.homePlatformMap[widget.category] ?? [];
    _grid ??= _createPlatformGrid();
    return _grid;
  }

  /// Main layer to show platforms under category
  Widget _createPlatformGrid() {
    _isGameGrid = false;
    _store.setGameTitle(clear: true);
    return GridView.count(
      physics: BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 2.0),
      crossAxisCount: _platformsPerRow + _plusGrid,
      childAspectRatio: _platformGridRatio + (_plusGrid * 0.075),
      mainAxisSpacing: 0.0,
      shrinkWrap: true,
      children: _platforms.map((entity) => _createGridItem(entity)).toList(),
    );
  }

  /// Second Layer to show games under platform
  Widget _buildGamesView(GamePlatformEntity platform) {
    _isGameGrid = true;
    _store.setGameTitle(platform: platform);
    if (platform != _currentPlatform) {
      _gamesView = _createGameListListener(
        _createForm(platform),
        _getMapKey(platform),
      );
    }
//    debugPrint('test platform icon: ${platform.iconUrl}');
    return Stack(
      children: [
        // game grid view
        _gamesView,
        // action button to show platform grid
        Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.only(right: 8.0, bottom: 8.0),
          child: FloatingActionButton(
            backgroundColor: Colors.black54,
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
    _twoLineText =
        _games.any((element) => element.isLongText(_gAvailableCharacters));
    debugPrint(
        '${_currentPlatform.className} game grid two line text: $_twoLineText');
    return StreamBuilder<String>(
        stream: _store.searchGameStream,
        initialData: '',
        builder: (context, snapshot) {
          String searchKey = snapshot?.data ?? '';
          return new GridView.count(
            physics: BouncingScrollPhysics(),
            crossAxisCount: _gamesPerRow + _plusGrid,
            childAspectRatio: 1.0,
            mainAxisSpacing: 0.0,
            shrinkWrap: true,
            children: (searchKey.isEmpty)
                ? _games.map((entity) => _createGridItem(entity)).toList()
                : _games
                    .where((entity) => entity.cname
                        .toLowerCase()
                        .contains(searchKey.toLowerCase()))
                    .map((entity) => _createGridItem(entity))
                    .toList(),
          );
        });
  }

  /// Create grid item for data [entity]
  /// Returns a [Stack] widget with image and name
  Widget _createGridItem(dynamic entity) {
    String label;
    String imgUrl;
    double textHeight = _gFontSize.value;

    if (entity is GameEntity) {
      label = entity.cname;
      imgUrl = entity.imageUrl;
//      debugPrint('game: $label, img:$imgUrl');
    } else if (entity is GamePlatformEntity) {
      label = entity.label;
      imgUrl = entity.imageUrl;
//      debugPrint('platform: $label, img:$imgUrl');
    } else {
      MyLogger.warn(msg: 'Unknown Grid item: $entity', tag: _tag);
    }

    return Container(
      padding:
          (!_isGameGrid) ? const EdgeInsets.only(top: 6.0) : EdgeInsets.zero,
      constraints: (!_isGameGrid)
          ? BoxConstraints.tight(Size(
              _platformItemSize,
              _platformItemSize + textHeight,
            ))
          : BoxConstraints.expand(),
      child: GestureDetector(
        onTap: () {
          String url = _onItemTap(entity);
          if (url.isNotEmpty) _openGame(url);
        },
        child: (!_isGameGrid)
            ? GridItemPlatform(
                imgUrl: imgUrl,
                label: label,
                itemSize: _platformItemSize,
                textHeight: textHeight,
                isIos: _isIos,
              )
            : GridItemGame(
                imgUrl: imgUrl,
                label: label,
                itemSize: _gameItemSize,
                fontSize: textHeight,
                twoLineText: _twoLineText,
                isIos: _isIos,
              ),
      ),
    );
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
      _onItemTap(_searchPlatform, search: true);
      _store.clearSearch();
    }
  }
}
