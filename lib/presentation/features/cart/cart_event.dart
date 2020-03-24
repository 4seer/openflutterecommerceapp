// Home Screen Bloc Events
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/data/abstract/model/promo.dart';

@immutable
abstract class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class CartLoadedEvent extends CartEvent {}

@immutable
class CartQuantityChangedEvent extends CartEvent {
  final int productId;
  final int newQuantity;

  CartQuantityChangedEvent({this.productId, this.newQuantity});
}

@immutable
class CartRemoveFromCartEvent extends CartEvent {
  final int productId;

  CartRemoveFromCartEvent({this.productId});
}

@immutable
class CartAddToFavsEvent extends CartEvent {
  final int productId;

  CartAddToFavsEvent({this.productId});
}

@immutable
class CartPromoAppliedEvent extends CartEvent {
  final Promo promo;

  CartPromoAppliedEvent({this.promo});
}

@immutable
class CartPromoCodeAppliedEvent extends CartEvent {
  final String promoCode;

  CartPromoCodeAppliedEvent({this.promoCode});
}

@immutable
class CartShowPopupEvent extends CartEvent {}
