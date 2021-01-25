// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'payment_promo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PaymentPromo _$PaymentPromoFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'default':
      return PaymentPromoTypeJson.fromJson(json);
    case 'data':
      return PaymentPromoData.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$PaymentPromoTearOff {
  const _$PaymentPromoTearOff();

// ignore: unused_element
  PaymentPromoTypeJson call(
      {@JsonKey(name: '1', defaultValue: '') dynamic local,
      @JsonKey(name: '2', defaultValue: '') dynamic other}) {
    return PaymentPromoTypeJson(
      local: local,
      other: other,
    );
  }

// ignore: unused_element
  PaymentPromoData data(
      {@JsonKey(name: 'promoid', required: true)
          int promoId,
      @JsonKey(name: 'promodesc', required: true, defaultValue: '?')
          String promoDesc}) {
    return PaymentPromoData(
      promoId: promoId,
      promoDesc: promoDesc,
    );
  }

// ignore: unused_element
  PaymentPromo fromJson(Map<String, Object> json) {
    return PaymentPromo.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $PaymentPromo = _$PaymentPromoTearOff();

/// @nodoc
mixin _$PaymentPromo {
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(@JsonKey(name: '1', defaultValue: '') dynamic local,
        @JsonKey(name: '2', defaultValue: '') dynamic other), {
    @required
        TResult data(
            @JsonKey(name: 'promoid', required: true)
                int promoId,
            @JsonKey(name: 'promodesc', required: true, defaultValue: '?')
                String promoDesc),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(@JsonKey(name: '1', defaultValue: '') dynamic local,
        @JsonKey(name: '2', defaultValue: '') dynamic other), {
    TResult data(
        @JsonKey(name: 'promoid', required: true)
            int promoId,
        @JsonKey(name: 'promodesc', required: true, defaultValue: '?')
            String promoDesc),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(PaymentPromoTypeJson value), {
    @required TResult data(PaymentPromoData value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(PaymentPromoTypeJson value), {
    TResult data(PaymentPromoData value),
    @required TResult orElse(),
  });
  Map<String, dynamic> toJson();
}

/// @nodoc
abstract class $PaymentPromoCopyWith<$Res> {
  factory $PaymentPromoCopyWith(
          PaymentPromo value, $Res Function(PaymentPromo) then) =
      _$PaymentPromoCopyWithImpl<$Res>;
}

/// @nodoc
class _$PaymentPromoCopyWithImpl<$Res> implements $PaymentPromoCopyWith<$Res> {
  _$PaymentPromoCopyWithImpl(this._value, this._then);

  final PaymentPromo _value;
  // ignore: unused_field
  final $Res Function(PaymentPromo) _then;
}

/// @nodoc
abstract class $PaymentPromoTypeJsonCopyWith<$Res> {
  factory $PaymentPromoTypeJsonCopyWith(PaymentPromoTypeJson value,
          $Res Function(PaymentPromoTypeJson) then) =
      _$PaymentPromoTypeJsonCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '1', defaultValue: '') dynamic local,
      @JsonKey(name: '2', defaultValue: '') dynamic other});
}

/// @nodoc
class _$PaymentPromoTypeJsonCopyWithImpl<$Res>
    extends _$PaymentPromoCopyWithImpl<$Res>
    implements $PaymentPromoTypeJsonCopyWith<$Res> {
  _$PaymentPromoTypeJsonCopyWithImpl(
      PaymentPromoTypeJson _value, $Res Function(PaymentPromoTypeJson) _then)
      : super(_value, (v) => _then(v as PaymentPromoTypeJson));

  @override
  PaymentPromoTypeJson get _value => super._value as PaymentPromoTypeJson;

  @override
  $Res call({
    Object local = freezed,
    Object other = freezed,
  }) {
    return _then(PaymentPromoTypeJson(
      local: local == freezed ? _value.local : local as dynamic,
      other: other == freezed ? _value.other : other as dynamic,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$PaymentPromoTypeJson implements PaymentPromoTypeJson {
  const _$PaymentPromoTypeJson(
      {@JsonKey(name: '1', defaultValue: '') this.local,
      @JsonKey(name: '2', defaultValue: '') this.other});

  factory _$PaymentPromoTypeJson.fromJson(Map<String, dynamic> json) =>
      _$_$PaymentPromoTypeJsonFromJson(json);

  @override
  @JsonKey(name: '1', defaultValue: '')
  final dynamic local;
  @override
  @JsonKey(name: '2', defaultValue: '')
  final dynamic other;

  @override
  String toString() {
    return 'PaymentPromo(local: $local, other: $other)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaymentPromoTypeJson &&
            (identical(other.local, local) ||
                const DeepCollectionEquality().equals(other.local, local)) &&
            (identical(other.other, this.other) ||
                const DeepCollectionEquality()
                    .equals(other.other, this.other)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(local) ^
      const DeepCollectionEquality().hash(other);

  @JsonKey(ignore: true)
  @override
  $PaymentPromoTypeJsonCopyWith<PaymentPromoTypeJson> get copyWith =>
      _$PaymentPromoTypeJsonCopyWithImpl<PaymentPromoTypeJson>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(@JsonKey(name: '1', defaultValue: '') dynamic local,
        @JsonKey(name: '2', defaultValue: '') dynamic other), {
    @required
        TResult data(
            @JsonKey(name: 'promoid', required: true)
                int promoId,
            @JsonKey(name: 'promodesc', required: true, defaultValue: '?')
                String promoDesc),
  }) {
    assert($default != null);
    assert(data != null);
    return $default(local, other);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(@JsonKey(name: '1', defaultValue: '') dynamic local,
        @JsonKey(name: '2', defaultValue: '') dynamic other), {
    TResult data(
        @JsonKey(name: 'promoid', required: true)
            int promoId,
        @JsonKey(name: 'promodesc', required: true, defaultValue: '?')
            String promoDesc),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(local, other);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(PaymentPromoTypeJson value), {
    @required TResult data(PaymentPromoData value),
  }) {
    assert($default != null);
    assert(data != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(PaymentPromoTypeJson value), {
    TResult data(PaymentPromoData value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$PaymentPromoTypeJsonToJson(this)..['runtimeType'] = 'default';
  }
}

abstract class PaymentPromoTypeJson implements PaymentPromo {
  const factory PaymentPromoTypeJson(
          {@JsonKey(name: '1', defaultValue: '') dynamic local,
          @JsonKey(name: '2', defaultValue: '') dynamic other}) =
      _$PaymentPromoTypeJson;

  factory PaymentPromoTypeJson.fromJson(Map<String, dynamic> json) =
      _$PaymentPromoTypeJson.fromJson;

  @JsonKey(name: '1', defaultValue: '')
  dynamic get local;
  @JsonKey(name: '2', defaultValue: '')
  dynamic get other;
  @JsonKey(ignore: true)
  $PaymentPromoTypeJsonCopyWith<PaymentPromoTypeJson> get copyWith;
}

/// @nodoc
abstract class $PaymentPromoDataCopyWith<$Res> {
  factory $PaymentPromoDataCopyWith(
          PaymentPromoData value, $Res Function(PaymentPromoData) then) =
      _$PaymentPromoDataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'promoid', required: true)
          int promoId,
      @JsonKey(name: 'promodesc', required: true, defaultValue: '?')
          String promoDesc});
}

/// @nodoc
class _$PaymentPromoDataCopyWithImpl<$Res>
    extends _$PaymentPromoCopyWithImpl<$Res>
    implements $PaymentPromoDataCopyWith<$Res> {
  _$PaymentPromoDataCopyWithImpl(
      PaymentPromoData _value, $Res Function(PaymentPromoData) _then)
      : super(_value, (v) => _then(v as PaymentPromoData));

  @override
  PaymentPromoData get _value => super._value as PaymentPromoData;

  @override
  $Res call({
    Object promoId = freezed,
    Object promoDesc = freezed,
  }) {
    return _then(PaymentPromoData(
      promoId: promoId == freezed ? _value.promoId : promoId as int,
      promoDesc: promoDesc == freezed ? _value.promoDesc : promoDesc as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$PaymentPromoData implements PaymentPromoData {
  const _$PaymentPromoData(
      {@JsonKey(name: 'promoid', required: true)
          this.promoId,
      @JsonKey(name: 'promodesc', required: true, defaultValue: '?')
          this.promoDesc});

  factory _$PaymentPromoData.fromJson(Map<String, dynamic> json) =>
      _$_$PaymentPromoDataFromJson(json);

  @override
  @JsonKey(name: 'promoid', required: true)
  final int promoId;
  @override
  @JsonKey(name: 'promodesc', required: true, defaultValue: '?')
  final String promoDesc;

  @override
  String toString() {
    return 'PaymentPromo.data(promoId: $promoId, promoDesc: $promoDesc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaymentPromoData &&
            (identical(other.promoId, promoId) ||
                const DeepCollectionEquality()
                    .equals(other.promoId, promoId)) &&
            (identical(other.promoDesc, promoDesc) ||
                const DeepCollectionEquality()
                    .equals(other.promoDesc, promoDesc)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(promoId) ^
      const DeepCollectionEquality().hash(promoDesc);

  @JsonKey(ignore: true)
  @override
  $PaymentPromoDataCopyWith<PaymentPromoData> get copyWith =>
      _$PaymentPromoDataCopyWithImpl<PaymentPromoData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(@JsonKey(name: '1', defaultValue: '') dynamic local,
        @JsonKey(name: '2', defaultValue: '') dynamic other), {
    @required
        TResult data(
            @JsonKey(name: 'promoid', required: true)
                int promoId,
            @JsonKey(name: 'promodesc', required: true, defaultValue: '?')
                String promoDesc),
  }) {
    assert($default != null);
    assert(data != null);
    return data(promoId, promoDesc);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(@JsonKey(name: '1', defaultValue: '') dynamic local,
        @JsonKey(name: '2', defaultValue: '') dynamic other), {
    TResult data(
        @JsonKey(name: 'promoid', required: true)
            int promoId,
        @JsonKey(name: 'promodesc', required: true, defaultValue: '?')
            String promoDesc),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (data != null) {
      return data(promoId, promoDesc);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(PaymentPromoTypeJson value), {
    @required TResult data(PaymentPromoData value),
  }) {
    assert($default != null);
    assert(data != null);
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(PaymentPromoTypeJson value), {
    TResult data(PaymentPromoData value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (data != null) {
      return data(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$PaymentPromoDataToJson(this)..['runtimeType'] = 'data';
  }
}

abstract class PaymentPromoData implements PaymentPromo {
  const factory PaymentPromoData(
      {@JsonKey(name: 'promoid', required: true)
          int promoId,
      @JsonKey(name: 'promodesc', required: true, defaultValue: '?')
          String promoDesc}) = _$PaymentPromoData;

  factory PaymentPromoData.fromJson(Map<String, dynamic> json) =
      _$PaymentPromoData.fromJson;

  @JsonKey(name: 'promoid', required: true)
  int get promoId;
  @JsonKey(name: 'promodesc', required: true, defaultValue: '?')
  String get promoDesc;
  @JsonKey(ignore: true)
  $PaymentPromoDataCopyWith<PaymentPromoData> get copyWith;
}
