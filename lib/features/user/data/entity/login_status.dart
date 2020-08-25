import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_entity.dart';

part 'login_status.freezed.dart';

@freezed
abstract class LoginStatus with _$LoginStatus {
  const factory LoginStatus({
    @required bool loggedIn,
    UserEntity currentUser,
  }) = _LoginStatus;
}
