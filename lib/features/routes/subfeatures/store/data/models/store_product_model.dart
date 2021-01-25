import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_product_model.freezed.dart';

@freezed
abstract class StoreProductModel with _$StoreProductModel {
  const factory StoreProductModel({
    @JsonKey(name: 'productid', defaultValue: -1) int productId,
    @JsonKey(name: 'productname', defaultValue: '?') String productName,
    num point,
    @JsonKey(name: 'sequence') int remain,
    String pic,
    @JsonKey(name: 'new') String isNew,
  }) = _StoreProductModel;

  static StoreProductModel jsonToStoreProductModel(
          Map<String, dynamic> jsonMap) =>
      _$_StoreProductModel(
        productId: jsonMap['productid'] as int ?? -1,
        productName: jsonMap['productname'] as String ?? '?',
        point: jsonMap['point'] as num,
        remain: jsonMap['sequence'] as int,
        pic: '${jsonMap['pic']}',
        isNew: jsonMap['new'] as String,
      );
}

extension StoreProductModelExtension on StoreProductModel {
  bool get isNewProduct => isNew == '1';
  String get picUrl =>
      (_picRegex.hasMatch(pic)) ? pic : 'images/mall_product/$pic.jpg';
}

final RegExp _picRegex = RegExp("^(?:images/.*(jpg|png))");
