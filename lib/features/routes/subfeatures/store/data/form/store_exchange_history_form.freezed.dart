// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'store_exchange_history_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$StoreExchangeHistoryFormTearOff {
  const _$StoreExchangeHistoryFormTearOff();

// ignore: unused_element
  StoreExchangeHistoryInit call({int page}) {
    return StoreExchangeHistoryInit(
      page: page,
    );
  }

// ignore: unused_element
  StoreExchangeHistoryQuery query({int page, int perPage, String search}) {
    return StoreExchangeHistoryQuery(
      page: page,
      perPage: perPage,
      search: search,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $StoreExchangeHistoryForm = _$StoreExchangeHistoryFormTearOff();

/// @nodoc
mixin _$StoreExchangeHistoryForm {
  int get page;

  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(int page), {
    @required TResult query(int page, int perPage, String search),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(int page), {
    TResult query(int page, int perPage, String search),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(StoreExchangeHistoryInit value), {
    @required TResult query(StoreExchangeHistoryQuery value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(StoreExchangeHistoryInit value), {
    TResult query(StoreExchangeHistoryQuery value),
    @required TResult orElse(),
  });

  $StoreExchangeHistoryFormCopyWith<StoreExchangeHistoryForm> get copyWith;
}

/// @nodoc
abstract class $StoreExchangeHistoryFormCopyWith<$Res> {
  factory $StoreExchangeHistoryFormCopyWith(StoreExchangeHistoryForm value,
          $Res Function(StoreExchangeHistoryForm) then) =
      _$StoreExchangeHistoryFormCopyWithImpl<$Res>;
  $Res call({int page});
}

/// @nodoc
class _$StoreExchangeHistoryFormCopyWithImpl<$Res>
    implements $StoreExchangeHistoryFormCopyWith<$Res> {
  _$StoreExchangeHistoryFormCopyWithImpl(this._value, this._then);

  final StoreExchangeHistoryForm _value;
  // ignore: unused_field
  final $Res Function(StoreExchangeHistoryForm) _then;

  @override
  $Res call({
    Object page = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed ? _value.page : page as int,
    ));
  }
}

/// @nodoc
abstract class $StoreExchangeHistoryInitCopyWith<$Res>
    implements $StoreExchangeHistoryFormCopyWith<$Res> {
  factory $StoreExchangeHistoryInitCopyWith(StoreExchangeHistoryInit value,
          $Res Function(StoreExchangeHistoryInit) then) =
      _$StoreExchangeHistoryInitCopyWithImpl<$Res>;
  @override
  $Res call({int page});
}

/// @nodoc
class _$StoreExchangeHistoryInitCopyWithImpl<$Res>
    extends _$StoreExchangeHistoryFormCopyWithImpl<$Res>
    implements $StoreExchangeHistoryInitCopyWith<$Res> {
  _$StoreExchangeHistoryInitCopyWithImpl(StoreExchangeHistoryInit _value,
      $Res Function(StoreExchangeHistoryInit) _then)
      : super(_value, (v) => _then(v as StoreExchangeHistoryInit));

  @override
  StoreExchangeHistoryInit get _value =>
      super._value as StoreExchangeHistoryInit;

  @override
  $Res call({
    Object page = freezed,
  }) {
    return _then(StoreExchangeHistoryInit(
      page: page == freezed ? _value.page : page as int,
    ));
  }
}

/// @nodoc
class _$StoreExchangeHistoryInit implements StoreExchangeHistoryInit {
  const _$StoreExchangeHistoryInit({this.page});

  @override
  final int page;

  @override
  String toString() {
    return 'StoreExchangeHistoryForm(page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StoreExchangeHistoryInit &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(page);

  @override
  $StoreExchangeHistoryInitCopyWith<StoreExchangeHistoryInit> get copyWith =>
      _$StoreExchangeHistoryInitCopyWithImpl<StoreExchangeHistoryInit>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(int page), {
    @required TResult query(int page, int perPage, String search),
  }) {
    assert($default != null);
    assert(query != null);
    return $default(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(int page), {
    TResult query(int page, int perPage, String search),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(StoreExchangeHistoryInit value), {
    @required TResult query(StoreExchangeHistoryQuery value),
  }) {
    assert($default != null);
    assert(query != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(StoreExchangeHistoryInit value), {
    TResult query(StoreExchangeHistoryQuery value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class StoreExchangeHistoryInit implements StoreExchangeHistoryForm {
  const factory StoreExchangeHistoryInit({int page}) =
      _$StoreExchangeHistoryInit;

  @override
  int get page;
  @override
  $StoreExchangeHistoryInitCopyWith<StoreExchangeHistoryInit> get copyWith;
}

/// @nodoc
abstract class $StoreExchangeHistoryQueryCopyWith<$Res>
    implements $StoreExchangeHistoryFormCopyWith<$Res> {
  factory $StoreExchangeHistoryQueryCopyWith(StoreExchangeHistoryQuery value,
          $Res Function(StoreExchangeHistoryQuery) then) =
      _$StoreExchangeHistoryQueryCopyWithImpl<$Res>;
  @override
  $Res call({int page, int perPage, String search});
}

/// @nodoc
class _$StoreExchangeHistoryQueryCopyWithImpl<$Res>
    extends _$StoreExchangeHistoryFormCopyWithImpl<$Res>
    implements $StoreExchangeHistoryQueryCopyWith<$Res> {
  _$StoreExchangeHistoryQueryCopyWithImpl(StoreExchangeHistoryQuery _value,
      $Res Function(StoreExchangeHistoryQuery) _then)
      : super(_value, (v) => _then(v as StoreExchangeHistoryQuery));

  @override
  StoreExchangeHistoryQuery get _value =>
      super._value as StoreExchangeHistoryQuery;

  @override
  $Res call({
    Object page = freezed,
    Object perPage = freezed,
    Object search = freezed,
  }) {
    return _then(StoreExchangeHistoryQuery(
      page: page == freezed ? _value.page : page as int,
      perPage: perPage == freezed ? _value.perPage : perPage as int,
      search: search == freezed ? _value.search : search as String,
    ));
  }
}

/// @nodoc
class _$StoreExchangeHistoryQuery implements StoreExchangeHistoryQuery {
  const _$StoreExchangeHistoryQuery({this.page, this.perPage, this.search});

  @override
  final int page;
  @override
  final int perPage;
  @override
  final String search;

  @override
  String toString() {
    return 'StoreExchangeHistoryForm.query(page: $page, perPage: $perPage, search: $search)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StoreExchangeHistoryQuery &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)) &&
            (identical(other.perPage, perPage) ||
                const DeepCollectionEquality()
                    .equals(other.perPage, perPage)) &&
            (identical(other.search, search) ||
                const DeepCollectionEquality().equals(other.search, search)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(page) ^
      const DeepCollectionEquality().hash(perPage) ^
      const DeepCollectionEquality().hash(search);

  @override
  $StoreExchangeHistoryQueryCopyWith<StoreExchangeHistoryQuery> get copyWith =>
      _$StoreExchangeHistoryQueryCopyWithImpl<StoreExchangeHistoryQuery>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(int page), {
    @required TResult query(int page, int perPage, String search),
  }) {
    assert($default != null);
    assert(query != null);
    return query(page, perPage, search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(int page), {
    TResult query(int page, int perPage, String search),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (query != null) {
      return query(page, perPage, search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(StoreExchangeHistoryInit value), {
    @required TResult query(StoreExchangeHistoryQuery value),
  }) {
    assert($default != null);
    assert(query != null);
    return query(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(StoreExchangeHistoryInit value), {
    TResult query(StoreExchangeHistoryQuery value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (query != null) {
      return query(this);
    }
    return orElse();
  }
}

abstract class StoreExchangeHistoryQuery implements StoreExchangeHistoryForm {
  const factory StoreExchangeHistoryQuery(
      {int page, int perPage, String search}) = _$StoreExchangeHistoryQuery;

  @override
  int get page;
  int get perPage;
  String get search;
  @override
  $StoreExchangeHistoryQueryCopyWith<StoreExchangeHistoryQuery> get copyWith;
}
