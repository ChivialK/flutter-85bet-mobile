import 'package:freezed_annotation/freezed_annotation.dart';

part 'platform_game_form.freezed.dart';

@freezed
abstract class PlatformGameForm with _$PlatformGameForm {
  const factory PlatformGameForm({
    @required String category,
    @required String platform,
  }) = _PlatformGameForm;
}

extension PlatformGameFormExtension on PlatformGameForm {
  Map<String, dynamic> toJson() => <String, dynamic>{
        'category': category,
        'platform': platform,
      };
}
