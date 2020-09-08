import 'package:vnum/vnum.dart';

@VnumDefinition
class WalletType extends Vnum<String> {
  /// Case Definition
  static const WalletType SINGLE = const WalletType.define('1');
  static const WalletType MULTI = const WalletType.define('0');

  /// Used for defining cases
  const WalletType.define(String fromValue) : super.define(fromValue);

  /// Used for loading enum using value
  factory WalletType(String value) => Vnum.fromValue(value, WalletType);
}
