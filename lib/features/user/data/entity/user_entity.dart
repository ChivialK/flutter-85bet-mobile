import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    @required String account,
    @required String credit,
    @required int vip,
  }) = _UserEntity;
}

extension UserEntityExtension on UserEntity {
  UserEntity updateCredit(String credit) => copyWith(credit: credit);
}
