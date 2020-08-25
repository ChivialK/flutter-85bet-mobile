import 'package:freezed_annotation/freezed_annotation.dart';

part 'bet_record_type_model.freezed.dart';

@freezed
abstract class BetRecordTypeModel with _$BetRecordTypeModel {
  const factory BetRecordTypeModel({
    @JsonKey(name: 'id') int categoryId,
    @JsonKey(name: 'ch') String categoryName,
    @JsonKey(name: 'type') String categoryType,
    Map<String, dynamic> platformMap,
  }) = _BetRecordTypeModel;

  static jsonToBetRecordTypeModel(Map<String, dynamic> jsonMap) {
    return _$_BetRecordTypeModel(
      categoryId: jsonMap['id'] as int,
      categoryName: jsonMap['ch'] as String,
      categoryType: jsonMap['type'] as String,
    );
  }
}
