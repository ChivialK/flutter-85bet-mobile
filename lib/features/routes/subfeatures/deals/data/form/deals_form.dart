import 'package:freezed_annotation/freezed_annotation.dart';

part 'deals_form.freezed.dart';

@freezed
abstract class DealsForm with _$DealsForm {
  const factory DealsForm({
    int page,
    int time,
    int type,
    int status,
  }) = _DealsForm;
}

extension DealsFormExtension on DealsForm {
  Map<String, dynamic> get toJson => <String, dynamic>{
        'page': this.page,
        'time': this.time,
        'type': this.type,
        'status': this.status,
      };
}
