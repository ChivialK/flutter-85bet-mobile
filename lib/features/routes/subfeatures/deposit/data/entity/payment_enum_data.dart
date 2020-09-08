import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_enum_data.freezed.dart';

enum TutorialItemType { Desc, Image, Button }

@freezed
abstract class PaymentTutorialItem with _$PaymentTutorialItem {
  const factory PaymentTutorialItem({
    @required int sortId,
    @required String value,
    @required TutorialItemType type,
  }) = _PaymentTutorialItem;
}

@freezed
abstract class PaymentEnumData with _$PaymentEnumData {
  const factory PaymentEnumData({
    @required String title,
    @required String jsonKey,
//    @required String jsonKey2,
    String tutorialTitle,
    List<PaymentTutorialItem> tutorialItem,
  }) = _PaymentEnumData;
}
