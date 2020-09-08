// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'payment_type_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PaymentTypeData _$PaymentTypeDataFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'other':
      return PaymentTypeOnlineData.fromJson(json);
    case 'local':
      return PaymentTypeLocalData.fromJson(json);

    default:
      throw FallThroughError();
  }
}

class _$PaymentTypeDataTearOff {
  const _$PaymentTypeDataTearOff();

// ignore: unused_element
  PaymentTypeOnlineData other(
      {String amount,
      @JsonKey(name: 'amountoption') List<String> amountOption,
      @JsonKey(name: 'amounttype') int amountType,
      @JsonKey(name: 'bankaccountid') int bankAccountId,
      int gateway,
      int max,
      int min,
      int payment,
      @JsonKey(name: 'pgindex') int pgIndex,
      @required List<int> sb,
      String type,
      dynamic key}) {
    return PaymentTypeOnlineData(
      amount: amount,
      amountOption: amountOption,
      amountType: amountType,
      bankAccountId: bankAccountId,
      gateway: gateway,
      max: max,
      min: min,
      payment: payment,
      pgIndex: pgIndex,
      sb: sb,
      type: type,
      key: key,
    );
  }

// ignore: unused_element
  PaymentTypeLocalData local(
      {@JsonKey(name: 'bankaccountid') int bankAccountId,
      @JsonKey(name: 'bankaccountno') String bankAccountNo,
      @JsonKey(name: 'bankindex') int bankIndex,
      @JsonKey(fromJson: JsonUtil.getRawJson) String max,
      @JsonKey(fromJson: JsonUtil.getRawJson) String min,
      String payment,
      String type,
      dynamic key}) {
    return PaymentTypeLocalData(
      bankAccountId: bankAccountId,
      bankAccountNo: bankAccountNo,
      bankIndex: bankIndex,
      max: max,
      min: min,
      payment: payment,
      type: type,
      key: key,
    );
  }
}

// ignore: unused_element
const $PaymentTypeData = _$PaymentTypeDataTearOff();

mixin _$PaymentTypeData {
  @JsonKey(name: 'bankaccountid')
  int get bankAccountId;
  String get type;
  dynamic get key;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result other(
            String amount,
            @JsonKey(name: 'amountoption') List<String> amountOption,
            @JsonKey(name: 'amounttype') int amountType,
            @JsonKey(name: 'bankaccountid') int bankAccountId,
            int gateway,
            int max,
            int min,
            int payment,
            @JsonKey(name: 'pgindex') int pgIndex,
            List<int> sb,
            String type,
            dynamic key),
    @required
        Result local(
            @JsonKey(name: 'bankaccountid') int bankAccountId,
            @JsonKey(name: 'bankaccountno') String bankAccountNo,
            @JsonKey(name: 'bankindex') int bankIndex,
            @JsonKey(fromJson: JsonUtil.getRawJson) String max,
            @JsonKey(fromJson: JsonUtil.getRawJson) String min,
            String payment,
            String type,
            dynamic key),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result other(
        String amount,
        @JsonKey(name: 'amountoption') List<String> amountOption,
        @JsonKey(name: 'amounttype') int amountType,
        @JsonKey(name: 'bankaccountid') int bankAccountId,
        int gateway,
        int max,
        int min,
        int payment,
        @JsonKey(name: 'pgindex') int pgIndex,
        List<int> sb,
        String type,
        dynamic key),
    Result local(
        @JsonKey(name: 'bankaccountid') int bankAccountId,
        @JsonKey(name: 'bankaccountno') String bankAccountNo,
        @JsonKey(name: 'bankindex') int bankIndex,
        @JsonKey(fromJson: JsonUtil.getRawJson) String max,
        @JsonKey(fromJson: JsonUtil.getRawJson) String min,
        String payment,
        String type,
        dynamic key),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result other(PaymentTypeOnlineData value),
    @required Result local(PaymentTypeLocalData value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result other(PaymentTypeOnlineData value),
    Result local(PaymentTypeLocalData value),
    @required Result orElse(),
  });
  Map<String, dynamic> toJson();
  $PaymentTypeDataCopyWith<PaymentTypeData> get copyWith;
}

abstract class $PaymentTypeDataCopyWith<$Res> {
  factory $PaymentTypeDataCopyWith(
          PaymentTypeData value, $Res Function(PaymentTypeData) then) =
      _$PaymentTypeDataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'bankaccountid') int bankAccountId,
      String type,
      dynamic key});
}

class _$PaymentTypeDataCopyWithImpl<$Res>
    implements $PaymentTypeDataCopyWith<$Res> {
  _$PaymentTypeDataCopyWithImpl(this._value, this._then);

  final PaymentTypeData _value;
  // ignore: unused_field
  final $Res Function(PaymentTypeData) _then;

  @override
  $Res call({
    Object bankAccountId = freezed,
    Object type = freezed,
    Object key = freezed,
  }) {
    return _then(_value.copyWith(
      bankAccountId: bankAccountId == freezed
          ? _value.bankAccountId
          : bankAccountId as int,
      type: type == freezed ? _value.type : type as String,
      key: key == freezed ? _value.key : key as dynamic,
    ));
  }
}

abstract class $PaymentTypeOnlineDataCopyWith<$Res>
    implements $PaymentTypeDataCopyWith<$Res> {
  factory $PaymentTypeOnlineDataCopyWith(PaymentTypeOnlineData value,
          $Res Function(PaymentTypeOnlineData) then) =
      _$PaymentTypeOnlineDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String amount,
      @JsonKey(name: 'amountoption') List<String> amountOption,
      @JsonKey(name: 'amounttype') int amountType,
      @JsonKey(name: 'bankaccountid') int bankAccountId,
      int gateway,
      int max,
      int min,
      int payment,
      @JsonKey(name: 'pgindex') int pgIndex,
      List<int> sb,
      String type,
      dynamic key});
}

class _$PaymentTypeOnlineDataCopyWithImpl<$Res>
    extends _$PaymentTypeDataCopyWithImpl<$Res>
    implements $PaymentTypeOnlineDataCopyWith<$Res> {
  _$PaymentTypeOnlineDataCopyWithImpl(
      PaymentTypeOnlineData _value, $Res Function(PaymentTypeOnlineData) _then)
      : super(_value, (v) => _then(v as PaymentTypeOnlineData));

  @override
  PaymentTypeOnlineData get _value => super._value as PaymentTypeOnlineData;

  @override
  $Res call({
    Object amount = freezed,
    Object amountOption = freezed,
    Object amountType = freezed,
    Object bankAccountId = freezed,
    Object gateway = freezed,
    Object max = freezed,
    Object min = freezed,
    Object payment = freezed,
    Object pgIndex = freezed,
    Object sb = freezed,
    Object type = freezed,
    Object key = freezed,
  }) {
    return _then(PaymentTypeOnlineData(
      amount: amount == freezed ? _value.amount : amount as String,
      amountOption: amountOption == freezed
          ? _value.amountOption
          : amountOption as List<String>,
      amountType: amountType == freezed ? _value.amountType : amountType as int,
      bankAccountId: bankAccountId == freezed
          ? _value.bankAccountId
          : bankAccountId as int,
      gateway: gateway == freezed ? _value.gateway : gateway as int,
      max: max == freezed ? _value.max : max as int,
      min: min == freezed ? _value.min : min as int,
      payment: payment == freezed ? _value.payment : payment as int,
      pgIndex: pgIndex == freezed ? _value.pgIndex : pgIndex as int,
      sb: sb == freezed ? _value.sb : sb as List<int>,
      type: type == freezed ? _value.type : type as String,
      key: key == freezed ? _value.key : key as dynamic,
    ));
  }
}

@JsonSerializable()
class _$PaymentTypeOnlineData implements PaymentTypeOnlineData {
  const _$PaymentTypeOnlineData(
      {this.amount,
      @JsonKey(name: 'amountoption') this.amountOption,
      @JsonKey(name: 'amounttype') this.amountType,
      @JsonKey(name: 'bankaccountid') this.bankAccountId,
      this.gateway,
      this.max,
      this.min,
      this.payment,
      @JsonKey(name: 'pgindex') this.pgIndex,
      @required this.sb,
      this.type,
      this.key})
      : assert(sb != null);

  factory _$PaymentTypeOnlineData.fromJson(Map<String, dynamic> json) =>
      _$_$PaymentTypeOnlineDataFromJson(json);

  @override
  final String amount;
  @override
  @JsonKey(name: 'amountoption')
  final List<String> amountOption;
  @override
  @JsonKey(name: 'amounttype')
  final int amountType;
  @override
  @JsonKey(name: 'bankaccountid')
  final int bankAccountId;
  @override
  final int gateway;
  @override
  final int max;
  @override
  final int min;
  @override
  final int payment;
  @override
  @JsonKey(name: 'pgindex')
  final int pgIndex;
  @override
  final List<int> sb;
  @override
  final String type;
  @override
  final dynamic key;

  @override
  String toString() {
    return 'PaymentTypeData.other(amount: $amount, amountOption: $amountOption, amountType: $amountType, bankAccountId: $bankAccountId, gateway: $gateway, max: $max, min: $min, payment: $payment, pgIndex: $pgIndex, sb: $sb, type: $type, key: $key)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaymentTypeOnlineData &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.amountOption, amountOption) ||
                const DeepCollectionEquality()
                    .equals(other.amountOption, amountOption)) &&
            (identical(other.amountType, amountType) ||
                const DeepCollectionEquality()
                    .equals(other.amountType, amountType)) &&
            (identical(other.bankAccountId, bankAccountId) ||
                const DeepCollectionEquality()
                    .equals(other.bankAccountId, bankAccountId)) &&
            (identical(other.gateway, gateway) ||
                const DeepCollectionEquality()
                    .equals(other.gateway, gateway)) &&
            (identical(other.max, max) ||
                const DeepCollectionEquality().equals(other.max, max)) &&
            (identical(other.min, min) ||
                const DeepCollectionEquality().equals(other.min, min)) &&
            (identical(other.payment, payment) ||
                const DeepCollectionEquality()
                    .equals(other.payment, payment)) &&
            (identical(other.pgIndex, pgIndex) ||
                const DeepCollectionEquality()
                    .equals(other.pgIndex, pgIndex)) &&
            (identical(other.sb, sb) ||
                const DeepCollectionEquality().equals(other.sb, sb)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(amountOption) ^
      const DeepCollectionEquality().hash(amountType) ^
      const DeepCollectionEquality().hash(bankAccountId) ^
      const DeepCollectionEquality().hash(gateway) ^
      const DeepCollectionEquality().hash(max) ^
      const DeepCollectionEquality().hash(min) ^
      const DeepCollectionEquality().hash(payment) ^
      const DeepCollectionEquality().hash(pgIndex) ^
      const DeepCollectionEquality().hash(sb) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(key);

  @override
  $PaymentTypeOnlineDataCopyWith<PaymentTypeOnlineData> get copyWith =>
      _$PaymentTypeOnlineDataCopyWithImpl<PaymentTypeOnlineData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result other(
            String amount,
            @JsonKey(name: 'amountoption') List<String> amountOption,
            @JsonKey(name: 'amounttype') int amountType,
            @JsonKey(name: 'bankaccountid') int bankAccountId,
            int gateway,
            int max,
            int min,
            int payment,
            @JsonKey(name: 'pgindex') int pgIndex,
            List<int> sb,
            String type,
            dynamic key),
    @required
        Result local(
            @JsonKey(name: 'bankaccountid') int bankAccountId,
            @JsonKey(name: 'bankaccountno') String bankAccountNo,
            @JsonKey(name: 'bankindex') int bankIndex,
            @JsonKey(fromJson: JsonUtil.getRawJson) String max,
            @JsonKey(fromJson: JsonUtil.getRawJson) String min,
            String payment,
            String type,
            dynamic key),
  }) {
    assert(other != null);
    assert(local != null);
    return other(amount, amountOption, amountType, bankAccountId, gateway, max,
        min, payment, pgIndex, sb, type, key);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result other(
        String amount,
        @JsonKey(name: 'amountoption') List<String> amountOption,
        @JsonKey(name: 'amounttype') int amountType,
        @JsonKey(name: 'bankaccountid') int bankAccountId,
        int gateway,
        int max,
        int min,
        int payment,
        @JsonKey(name: 'pgindex') int pgIndex,
        List<int> sb,
        String type,
        dynamic key),
    Result local(
        @JsonKey(name: 'bankaccountid') int bankAccountId,
        @JsonKey(name: 'bankaccountno') String bankAccountNo,
        @JsonKey(name: 'bankindex') int bankIndex,
        @JsonKey(fromJson: JsonUtil.getRawJson) String max,
        @JsonKey(fromJson: JsonUtil.getRawJson) String min,
        String payment,
        String type,
        dynamic key),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (other != null) {
      return other(amount, amountOption, amountType, bankAccountId, gateway,
          max, min, payment, pgIndex, sb, type, key);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result other(PaymentTypeOnlineData value),
    @required Result local(PaymentTypeLocalData value),
  }) {
    assert(other != null);
    assert(local != null);
    return other(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result other(PaymentTypeOnlineData value),
    Result local(PaymentTypeLocalData value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (other != null) {
      return other(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$PaymentTypeOnlineDataToJson(this)..['runtimeType'] = 'other';
  }
}

abstract class PaymentTypeOnlineData implements PaymentTypeData {
  const factory PaymentTypeOnlineData(
      {String amount,
      @JsonKey(name: 'amountoption') List<String> amountOption,
      @JsonKey(name: 'amounttype') int amountType,
      @JsonKey(name: 'bankaccountid') int bankAccountId,
      int gateway,
      int max,
      int min,
      int payment,
      @JsonKey(name: 'pgindex') int pgIndex,
      @required List<int> sb,
      String type,
      dynamic key}) = _$PaymentTypeOnlineData;

  factory PaymentTypeOnlineData.fromJson(Map<String, dynamic> json) =
      _$PaymentTypeOnlineData.fromJson;

  String get amount;
  @JsonKey(name: 'amountoption')
  List<String> get amountOption;
  @JsonKey(name: 'amounttype')
  int get amountType;
  @override
  @JsonKey(name: 'bankaccountid')
  int get bankAccountId;
  int get gateway;
  int get max;
  int get min;
  int get payment;
  @JsonKey(name: 'pgindex')
  int get pgIndex;
  List<int> get sb;
  @override
  String get type;
  @override
  dynamic get key;
  @override
  $PaymentTypeOnlineDataCopyWith<PaymentTypeOnlineData> get copyWith;
}

abstract class $PaymentTypeLocalDataCopyWith<$Res>
    implements $PaymentTypeDataCopyWith<$Res> {
  factory $PaymentTypeLocalDataCopyWith(PaymentTypeLocalData value,
          $Res Function(PaymentTypeLocalData) then) =
      _$PaymentTypeLocalDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'bankaccountid') int bankAccountId,
      @JsonKey(name: 'bankaccountno') String bankAccountNo,
      @JsonKey(name: 'bankindex') int bankIndex,
      @JsonKey(fromJson: JsonUtil.getRawJson) String max,
      @JsonKey(fromJson: JsonUtil.getRawJson) String min,
      String payment,
      String type,
      dynamic key});
}

class _$PaymentTypeLocalDataCopyWithImpl<$Res>
    extends _$PaymentTypeDataCopyWithImpl<$Res>
    implements $PaymentTypeLocalDataCopyWith<$Res> {
  _$PaymentTypeLocalDataCopyWithImpl(
      PaymentTypeLocalData _value, $Res Function(PaymentTypeLocalData) _then)
      : super(_value, (v) => _then(v as PaymentTypeLocalData));

  @override
  PaymentTypeLocalData get _value => super._value as PaymentTypeLocalData;

  @override
  $Res call({
    Object bankAccountId = freezed,
    Object bankAccountNo = freezed,
    Object bankIndex = freezed,
    Object max = freezed,
    Object min = freezed,
    Object payment = freezed,
    Object type = freezed,
    Object key = freezed,
  }) {
    return _then(PaymentTypeLocalData(
      bankAccountId: bankAccountId == freezed
          ? _value.bankAccountId
          : bankAccountId as int,
      bankAccountNo: bankAccountNo == freezed
          ? _value.bankAccountNo
          : bankAccountNo as String,
      bankIndex: bankIndex == freezed ? _value.bankIndex : bankIndex as int,
      max: max == freezed ? _value.max : max as String,
      min: min == freezed ? _value.min : min as String,
      payment: payment == freezed ? _value.payment : payment as String,
      type: type == freezed ? _value.type : type as String,
      key: key == freezed ? _value.key : key as dynamic,
    ));
  }
}

@JsonSerializable()
class _$PaymentTypeLocalData implements PaymentTypeLocalData {
  const _$PaymentTypeLocalData(
      {@JsonKey(name: 'bankaccountid') this.bankAccountId,
      @JsonKey(name: 'bankaccountno') this.bankAccountNo,
      @JsonKey(name: 'bankindex') this.bankIndex,
      @JsonKey(fromJson: JsonUtil.getRawJson) this.max,
      @JsonKey(fromJson: JsonUtil.getRawJson) this.min,
      this.payment,
      this.type,
      this.key});

  factory _$PaymentTypeLocalData.fromJson(Map<String, dynamic> json) =>
      _$_$PaymentTypeLocalDataFromJson(json);

  @override
  @JsonKey(name: 'bankaccountid')
  final int bankAccountId;
  @override
  @JsonKey(name: 'bankaccountno')
  final String bankAccountNo;
  @override
  @JsonKey(name: 'bankindex')
  final int bankIndex;
  @override
  @JsonKey(fromJson: JsonUtil.getRawJson)
  final String max;
  @override
  @JsonKey(fromJson: JsonUtil.getRawJson)
  final String min;
  @override
  final String payment;
  @override
  final String type;
  @override
  final dynamic key;

  @override
  String toString() {
    return 'PaymentTypeData.local(bankAccountId: $bankAccountId, bankAccountNo: $bankAccountNo, bankIndex: $bankIndex, max: $max, min: $min, payment: $payment, type: $type, key: $key)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaymentTypeLocalData &&
            (identical(other.bankAccountId, bankAccountId) ||
                const DeepCollectionEquality()
                    .equals(other.bankAccountId, bankAccountId)) &&
            (identical(other.bankAccountNo, bankAccountNo) ||
                const DeepCollectionEquality()
                    .equals(other.bankAccountNo, bankAccountNo)) &&
            (identical(other.bankIndex, bankIndex) ||
                const DeepCollectionEquality()
                    .equals(other.bankIndex, bankIndex)) &&
            (identical(other.max, max) ||
                const DeepCollectionEquality().equals(other.max, max)) &&
            (identical(other.min, min) ||
                const DeepCollectionEquality().equals(other.min, min)) &&
            (identical(other.payment, payment) ||
                const DeepCollectionEquality()
                    .equals(other.payment, payment)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(bankAccountId) ^
      const DeepCollectionEquality().hash(bankAccountNo) ^
      const DeepCollectionEquality().hash(bankIndex) ^
      const DeepCollectionEquality().hash(max) ^
      const DeepCollectionEquality().hash(min) ^
      const DeepCollectionEquality().hash(payment) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(key);

  @override
  $PaymentTypeLocalDataCopyWith<PaymentTypeLocalData> get copyWith =>
      _$PaymentTypeLocalDataCopyWithImpl<PaymentTypeLocalData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result other(
            String amount,
            @JsonKey(name: 'amountoption') List<String> amountOption,
            @JsonKey(name: 'amounttype') int amountType,
            @JsonKey(name: 'bankaccountid') int bankAccountId,
            int gateway,
            int max,
            int min,
            int payment,
            @JsonKey(name: 'pgindex') int pgIndex,
            List<int> sb,
            String type,
            dynamic key),
    @required
        Result local(
            @JsonKey(name: 'bankaccountid') int bankAccountId,
            @JsonKey(name: 'bankaccountno') String bankAccountNo,
            @JsonKey(name: 'bankindex') int bankIndex,
            @JsonKey(fromJson: JsonUtil.getRawJson) String max,
            @JsonKey(fromJson: JsonUtil.getRawJson) String min,
            String payment,
            String type,
            dynamic key),
  }) {
    assert(other != null);
    assert(local != null);
    return local(
        bankAccountId, bankAccountNo, bankIndex, max, min, payment, type, key);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result other(
        String amount,
        @JsonKey(name: 'amountoption') List<String> amountOption,
        @JsonKey(name: 'amounttype') int amountType,
        @JsonKey(name: 'bankaccountid') int bankAccountId,
        int gateway,
        int max,
        int min,
        int payment,
        @JsonKey(name: 'pgindex') int pgIndex,
        List<int> sb,
        String type,
        dynamic key),
    Result local(
        @JsonKey(name: 'bankaccountid') int bankAccountId,
        @JsonKey(name: 'bankaccountno') String bankAccountNo,
        @JsonKey(name: 'bankindex') int bankIndex,
        @JsonKey(fromJson: JsonUtil.getRawJson) String max,
        @JsonKey(fromJson: JsonUtil.getRawJson) String min,
        String payment,
        String type,
        dynamic key),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (local != null) {
      return local(bankAccountId, bankAccountNo, bankIndex, max, min, payment,
          type, key);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result other(PaymentTypeOnlineData value),
    @required Result local(PaymentTypeLocalData value),
  }) {
    assert(other != null);
    assert(local != null);
    return local(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result other(PaymentTypeOnlineData value),
    Result local(PaymentTypeLocalData value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (local != null) {
      return local(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$PaymentTypeLocalDataToJson(this)..['runtimeType'] = 'local';
  }
}

abstract class PaymentTypeLocalData implements PaymentTypeData {
  const factory PaymentTypeLocalData(
      {@JsonKey(name: 'bankaccountid') int bankAccountId,
      @JsonKey(name: 'bankaccountno') String bankAccountNo,
      @JsonKey(name: 'bankindex') int bankIndex,
      @JsonKey(fromJson: JsonUtil.getRawJson) String max,
      @JsonKey(fromJson: JsonUtil.getRawJson) String min,
      String payment,
      String type,
      dynamic key}) = _$PaymentTypeLocalData;

  factory PaymentTypeLocalData.fromJson(Map<String, dynamic> json) =
      _$PaymentTypeLocalData.fromJson;

  @override
  @JsonKey(name: 'bankaccountid')
  int get bankAccountId;
  @JsonKey(name: 'bankaccountno')
  String get bankAccountNo;
  @JsonKey(name: 'bankindex')
  int get bankIndex;
  @JsonKey(fromJson: JsonUtil.getRawJson)
  String get max;
  @JsonKey(fromJson: JsonUtil.getRawJson)
  String get min;
  String get payment;
  @override
  String get type;
  @override
  dynamic get key;
  @override
  $PaymentTypeLocalDataCopyWith<PaymentTypeLocalData> get copyWith;
}
