import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';

import '../../data/entity/game_entity.dart';
import '../../data/models/game_platform.dart';
import '../state/home_store.dart';
import 'grid_view_mix.dart';
import 'home_store_inherit_widget.dart';

enum TabPageMixType { RECOMMEND, FAVORITE }

class HomeDisplayTabPageMix extends StatefulWidget {
  final TabPageMixType mixType;
  final double pageMaxWidth;
  final double itemLabelWidthFactor;
  final HomeSearchPlatformClicked onPlatformClicked;
  final bool addFavoritePlugin;

  HomeDisplayTabPageMix.recommend({
    Key key,
    @required this.pageMaxWidth,
    @required this.itemLabelWidthFactor,
    @required this.onPlatformClicked,
    this.addFavoritePlugin = true,
  })  : mixType = TabPageMixType.RECOMMEND,
        super(key: key);

  HomeDisplayTabPageMix.favorite({
    Key key,
    @required this.pageMaxWidth,
    @required this.itemLabelWidthFactor,
    @required this.onPlatformClicked,
  })  : mixType = TabPageMixType.FAVORITE,
        addFavoritePlugin = true,
        super(key: key);

  @override
  _HomeDisplayTabPageMixState createState() => _HomeDisplayTabPageMixState();
}

class _HomeDisplayTabPageMixState extends State<HomeDisplayTabPageMix> {
  final String tag = 'HomeDisplayTabPageMix';
  final bool _isIos = Global.device.isIos;

  HomeStore _store;
  List _itemList;
  Widget _grid;

  /// Pass in a [itemData] on grid item tap.
  /// [itemData] should be [GamePlatformEntity] or [GameEntity]
  /// else print warn log and show toast.
  void _onItemTap(dynamic itemData) {
    debugPrint('onItemTap mix: $itemData');
    if (itemData is GamePlatformEntity) {
      widget.onPlatformClicked(itemData);
    } else if (itemData is GameEntity) {
      if (_store == null || _store.hasUser == false) {
        callToastInfo(localeStr.messageErrorNotLogin);
      } else {
        debugPrint('opening game: ${itemData.gameUrl}');
        _store.getGameUrl(itemData.gameUrl);
      }
    } else {
      callToastError(localeStr.messageErrorInternal);
      MyLogger.wtf(msg: 'tapped unknown item, data: $itemData', tag: tag);
    }
  }

  void _setFavorite(dynamic entity, bool favor) {
    if (entity is GamePlatformEntity || entity is GameEntity) {
      debugPrint('set ${entity.id} favor to $favor');
      _store.postFavorite(entity: entity, favorite: favor);
    }
  }

  void _removeFavorite(dynamic entity) {
    if (entity is GamePlatformEntity || entity is GameEntity) {
      debugPrint('remove ${entity.id} from favorite');
      _store.postFavorite(entity: entity, favorite: false);
    }
  }

  @override
  void didUpdateWidget(HomeDisplayTabPageMix oldWidget) {
    debugPrint('updating tab page mix...');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    _store ??= HomeStoreInheritedWidget.of(context).store;
    if (_store == null) {
      return Center(
        child: WarningDisplay(
          message: Failure.internal(FailureCode(
                  type: (widget.mixType == TabPageMixType.RECOMMEND)
                      ? FailureType.RECOMMENDS
                      : FailureType.FAVORITE))
              .message,
        ),
      );
    }
    switch (widget.mixType) {
      case TabPageMixType.RECOMMEND:
        return StreamBuilder<List>(
          stream: _store.recommendStream,
          initialData: _store.recommends,
          builder: (_, snapshot) {
            if (snapshot.data == null) _store.getRecommend();
            if (snapshot != null && snapshot.data != _itemList) {
              _itemList = snapshot.data;
              _grid = _createGrid(removeFavOnly: false);
            }
            _grid ??= Center(child: CircularProgressIndicator());
            return _grid;
          },
        );
        break;
      case TabPageMixType.FAVORITE:
        return StreamBuilder<List>(
          stream: _store.favoriteStream,
          initialData: _store.favorites,
          builder: (_, snapshot) {
            if (snapshot.data == null) _store.getFavorites();
            if (snapshot != null || snapshot.data != _itemList) {
              _itemList = snapshot.data;
              _grid = _createGrid(removeFavOnly: true);
            }
            _grid ??= Center(child: CircularProgressIndicator());
            return _grid;
          },
        );
        break;
      default:
        return Container();
    }
  }

  Widget _createGrid({@required bool removeFavOnly}) {
    if (_itemList == null || _itemList.isEmpty) return SizedBox.shrink();
    return GridViewMixed(
      pageMaxWidth: widget.pageMaxWidth,
      labelWidthFactor: widget.itemLabelWidthFactor,
      isIos: _isIos,
      mixDataList: _itemList,
      onTap: (entity) => _onItemTap(entity),
      addPlugin: widget.addFavoritePlugin,
      onFavorTap: (removeFavOnly)
          ? (entity, _) => _removeFavorite(entity)
          : (entity, isFavorite) => _setFavorite(entity, isFavorite),
    );
  }
}
