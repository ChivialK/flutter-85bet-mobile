import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_exchange_history_form.freezed.dart';

@freezed
abstract class StoreExchangeHistoryForm with _$StoreExchangeHistoryForm {
  const factory StoreExchangeHistoryForm({
    int page,
  }) = StoreExchangeHistoryInit;

  const factory StoreExchangeHistoryForm.query({
    int page,
    int perPage,
    String search,
  }) = StoreExchangeHistoryQuery;
}

extension StoreExchangeHistoryFormExtension on StoreExchangeHistoryForm {
  Map<String, dynamic> toJson() {
    if (this is StoreExchangeHistoryQuery)
      return <String, dynamic>{
        'page': (this as StoreExchangeHistoryQuery).page ?? 1,
        'per_page':
            (this as StoreExchangeHistoryQuery).perPage?.toString() ?? '5',
        'msg': (this as StoreExchangeHistoryQuery).search ?? '',
      };
    else
      return <String, dynamic>{
        'page': this.page ?? 1,
      };
  }
}
