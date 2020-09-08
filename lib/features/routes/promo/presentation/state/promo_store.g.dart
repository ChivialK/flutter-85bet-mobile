// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PromoStore on _PromoStore, Store {
  Computed<PromoStoreState> _$stateComputed;

  @override
  PromoStoreState get state =>
      (_$stateComputed ??= Computed<PromoStoreState>(() => super.state,
              name: '_PromoStore.state'))
          .value;

  final _$_promoFutureAtom = Atom(name: '_PromoStore._promoFuture');

  @override
  ObservableFuture<Either<Failure, List<PromoEntity>>> get _promoFuture {
    _$_promoFutureAtom.reportRead();
    return super._promoFuture;
  }

  @override
  set _promoFuture(ObservableFuture<Either<Failure, List<PromoEntity>>> value) {
    _$_promoFutureAtom.reportWrite(value, super._promoFuture, () {
      super._promoFuture = value;
    });
  }

  final _$promosAtom = Atom(name: '_PromoStore.promos');

  @override
  List<PromoEntity> get promos {
    _$promosAtom.reportRead();
    return super.promos;
  }

  @override
  set promos(List<PromoEntity> value) {
    _$promosAtom.reportWrite(value, super.promos, () {
      super.promos = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_PromoStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$getPromoListAsyncAction = AsyncAction('_PromoStore.getPromoList');

  @override
  Future<void> getPromoList() {
    return _$getPromoListAsyncAction.run(() => super.getPromoList());
  }

  @override
  String toString() {
    return '''promos: $promos,errorMessage: $errorMessage,state: $state''';
  }
}
